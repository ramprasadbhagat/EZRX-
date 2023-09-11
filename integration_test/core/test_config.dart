// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class TestConfig {
  // //todo: Read from pipe-line config
// const String PROJECT_KEY = 'TZS'; //Get from Jira

// //todo: Read from pipe-line config
// const String CYRCLE_KEY = 'TZS-R9'; //Get from Zephyr Scale

// //todo: Read from system environment
// const String TOKEN =
//     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb250ZXh0Ijp7ImJhc2VVcmwiOiJodHRwczovL3h1YW50aGFuaHRzZC5hdGxhc3NpYW4ubmV0IiwidXNlciI6eyJhY2NvdW50SWQiOiI3MDEyMTowODM0NTYxYy1kZTE5LTQwYjQtYjM3Yi0yYjhlNDY0NGEwNTcifX0sImlzcyI6ImNvbS5rYW5vYWgudGVzdC1tYW5hZ2VyIiwic3ViIjoiMWRlZjZlMDUtYzMwZi0zNDRjLWIyN2QtNmVmYTMzYzE5MGE4IiwiZXhwIjoxNzIzNzEzNjQ4LCJpYXQiOjE2OTIxNzc2NDh9.Ku1tXva3FAQvHwhJbrH8wrOCHX1WXekDTJiLzQ-ohhg';

  String PROJECT_KEY = 'EZRX'; //Get from Jira
// const String CYCLE_KEY = 'EZRX-R5'; //Get from Zephyr Scale
  String TOKEN =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb250ZXh0Ijp7ImJhc2VVcmwiOiJodHRwczovL3p1ZWxsaWdwaGFybWEuYXRsYXNzaWFuLm5ldCIsInVzZXIiOnsiYWNjb3VudElkIjoiNjNkNzhlNTkxYjEzZDQyOTk4ZTA2NTlmIn19LCJpc3MiOiJjb20ua2Fub2FoLnRlc3QtbWFuYWdlciIsInN1YiI6IjFiMDNjM2Y3LTZhNTMtM2Q5ZC1iN2Y3LTg0MTlhMmNkMTlkMCIsImV4cCI6MTcyNDE0OTMxNywiaWF0IjoxNjkyNjEzMzE3fQ.QvwQ9ESY4hkxYEreAX9d56M2ye73q7KrntfxvB1S8iU';

  String STEP_URL =
      'https://api.zephyrscale.smartbear.com/v2/testcases/{ID}/teststeps';
  String EXECUTION_URL =
      'https://api.zephyrscale.smartbear.com/v2/testexecutions';
}
