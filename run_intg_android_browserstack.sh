#!/bin/bash

start=$SECONDS

if [ $# -eq 0 ];
then
  echo "$0: Missing arguments"
  exit 1
elif [ $# -gt 16 ];
then
  echo "$0: Too many arguments: $@"
  exit 1
else
  echo "We got some argument(s)"
  echo "==========================="
  echo "Number of arguments.: $#"
  echo "List of arguments...: $@"
  echo "Arg #1..............: $1"
  echo "Arg #2..............: $2"
  echo "Arg #3..............: $3"
  echo "Arg #4..............: $4"
  echo "Arg #5..............: $5"
  echo "Arg #6..............: $6"
  echo "Arg #7..............: $7"
  echo "Arg #8..............: $8"
  echo "==========================="
fi

if [ -z "$BROWSERSTACK_USERNAME" ] || [ -z "$BROWSERSTACK_ACCESSKEY" ]
then
      echo "Either the Browserstack Username or Browserstack Accesskey is not set. Please set them to run the tests on Browserstack."
	  exit 1
fi

BROWSERSTACK_CREDENTIALS=$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESSKEY

IS_GEOLOCATION_ENABLED="No"
if [ -z "$ENABLE_GEOLOCATION" ]
then
    echo "ENABLE_GEOLOCATION is not set. We will be running tests in random Geo-Location."
elif [ "$ENABLE_GEOLOCATION" == 'Yes' ]
then
	echo "ENABLE_GEOLOCATION is set and defined as Yes. We will be running tests in the specificied Geo-Location."
	IS_GEOLOCATION_ENABLED="Yes"
elif [ "$ENABLE_GEOLOCATION" == 'No' ]
then
	echo "ENABLE_GEOLOCATION is set but defined as No. We will be running tests in random Geo-Location."
	IS_GEOLOCATION_ENABLED="No"
else
	echo "Some confusion with the ENABLE_GEOLOCATION variable set. It should either be 'Yes' or 
	No' Please correct that. Exiting the tests for now."
	exit 1
fi

pushd android
filename=local.properties
if [ ! -f $filename ]
then
	echo "flutter.minSdkVersion=24" >> $filename
	echo "flutter.targetSdkVersion=33" >> $filename
	echo "flutter.compileSdkVersion=33" >> $filename
	echo "local.properties file created successfully"
fi
popd

devices=("Samsung Galaxy S21 Plus-11.0" "Google Pixel 6-12.0" "Samsung Galaxy S23-13.0" "OnePlus 9-11.0")

if [ -z "$MOBILE_DEVICES" ]
then
    echo "No specific mobile devices specified. Will run the tests with the default devices."
else	 
	echo "Will use the mobile devices specified."
	IFS=':' read -r -a devices <<< "$MOBILE_DEVICES"
fi

actualDeviceCount=${#devices[*]}
echo "Total Count of mobile devices is: " $actualDeviceCount
echo "The mobile devices are : " ${devices[*]}

count=0
testVsBuildId=()
testVsBuildStatus=()

for i in $@
do 
    IFS=':' read -r -a testAndGeoLocation <<< $i
	echo -e "\n"
	echo "Testcase:" "${testAndGeoLocation[0]}"
	echo "GeoLocation:" "${testAndGeoLocation[1]}"
	echo "Using device:" "${devices[$count]}"
	
	echo -e "\n"	
	echo "Starting Build of APP using : flutter build apk --flavor uat -t lib/main_uat.dart --debug For Testcase: " "${testAndGeoLocation[0]}"

	flutter build apk --flavor uat -t lib/main_uat.dart --debug -Ptarget="${testAndGeoLocation[0]}"

	pushd android	

	./gradlew app:assembleAndroidTest

	popd

	echo -e "\n"
	echo "Uploading the App to Browserstack :"

	cmd="curl -u $BROWSERSTACK_CREDENTIALS -X POST "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/app" -F "file=@build/app/outputs/flutter-apk/app-uat-debug.apk""
	result=`$cmd | sed -En 's/.*"app_url":"([^"]*).*/\1/p'`
	echo -e "\n"
	echo "app_url : " $result

	echo -e "\n"
	echo "Uploading the test suite to Browserstack :"

	cmd="curl -u $BROWSERSTACK_CREDENTIALS -X POST "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/test-suite" -F "file=@build/app/outputs/apk/androidTest/uat/debug/app-uat-debug-androidTest.apk" -F "custom_id=SampleTest""
	result1=`$cmd | sed -En 's/.*"test_suite_url":"([^"]*).*/\1/p'` 
	echo -e "\n"
	echo "test_suite_url : " $result1

	echo -e "\n"
	echo "Staring the Test execution on Browserstack :"

	val=""
	if [ $IS_GEOLOCATION_ENABLED == 'Yes' ]
	then
		val=$(curl -X POST 'https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/build' \
		--header 'Content-Type: application/json' \
		-u $BROWSERSTACK_CREDENTIALS \
		-d '{"app": "'"$result"'", "testSuite": "'"$result1"'", "geoLocation":"'"${testAndGeoLocation[1]}"'" , "deviceLogs":"true", "networkLogs":"true", "devices": ["'"${devices[$count]}"'"]}' )
	else
		val=$(curl -X POST 'https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/build' \
		--header 'Content-Type: application/json' \
		-u $BROWSERSTACK_CREDENTIALS \
		-d '{"app": "'"$result"'", "testSuite": "'"$result1"'", "deviceLogs":"true", "networkLogs":"true",  "devices": ["'"${devices[$count]}"'"]}' )
	fi

	result2=$(echo $val | sed 's/{.*"build_id":"*\([0-9a-zA-Z]*\)"*,*.*}/\1/')
	echo "Build_Id : " $result2
	
	testVsBuildId+=("${testAndGeoLocation[0]}:$result2")
	
	(( count++ ))
    if [ $count -eq $actualDeviceCount ]; then  count=0; fi
		
done

for j in ${testVsBuildId[@]}
do
	IFS=':' read -r -a testAndBuildId <<< $j
	echo -e "\n"
	echo "Test case : " ${testAndBuildId[0]} "  ----- Build_Id : " ${testAndBuildId[1]}
	
	buildStatus="running"
	buildMonitorStart=$SECONDS
	maxTime=300 # Max test time should not be above 5 minutes.

	while [ "$buildStatus" == "running" ];
	do
		cmd="curl -X GET "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/builds/${testAndBuildId[1]}" -u $BROWSERSTACK_CREDENTIALS "
		buildStatus=`$cmd | sed -En 's/.*"status":"([^"]*).*/\1/p'`
		sessionId=`$cmd | sed -En 's/.*"id":"([^"]*).*/\1/p'`
		echo "The Current status of the run is : " $buildStatus
		echo "The Session Id of the run is : " $sessionId
		monitorTime=$(( SECONDS - buildMonitorStart ))
		echo "Monitor Time : " $monitorTime
		echo "Max Time : " $maxTime
		if [ $monitorTime -gt $maxTime  ]
		then	
			buildStatus="error"
		fi
	done
	cmd1="curl -X GET "https://api-cloud.browserstack.com/app-automate/flutter-integration-tests/v2/android/builds/${testAndBuildId[1]}/sessions/${sessionId}" -u $BROWSERSTACK_CREDENTIALS "
	video=`$cmd1 | sed -En 's/.*"video":"([^"]*).*/\1/p'`
	buildDetails=https://app-automate.browserstack.com/dashboard/v2/builds/"${testAndBuildId[1]}"
	echo "vd" $video
	echo "BD" $buildDetails
	testVsBuildStatus+=("${testAndBuildId[0]}!$buildStatus!$buildDetails!$video")

done

didAnyBuildFail="No"
countBuildPassed=0

echo -e "\n"
echo "Summary of the Test Run is as follows: "

for j in ${testVsBuildStatus[@]}
do
	IFS='!' read -r -a testAndBuildStatus <<< $j
	echo -e "\n"
	echo "Test case : " ${testAndBuildStatus[0]}
	echo "Build Status : " ${testAndBuildStatus[1]}
	echo "Build Details Link : " ${testAndBuildStatus[2]}
	echo "Video Link : " ${testAndBuildStatus[3]}
	if [ ${testAndBuildStatus[1]} == 'passed' ]
	then	
		(( count++ ))
	else
		didAnyBuildFail="Yes"
	fi
	
done	

duration=$(( SECONDS - start ))

echo -e "\n"
echo "The total time taken for the test execution in seconds is :" $duration 

if [ $didAnyBuildFail == 'Yes' ]
then
	echo -e "\n"
	echo "Some Tests Failed."
	exit 1
fi