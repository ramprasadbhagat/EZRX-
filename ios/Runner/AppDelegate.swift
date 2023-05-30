import UIKit
import Flutter
import FirebaseCore
import CleverTapSDK
import clevertap_plugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    CleverTapPlugin.sharedInstance()?.applicationDidLaunch(options: launchOptions)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
