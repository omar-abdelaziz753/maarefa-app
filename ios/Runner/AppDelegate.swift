import UIKit
import Flutter
import Firebase
import GoogleMaps
import FirebaseCore
import FirebaseMessaging
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
//   override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

//    Messaging.messaging().apnsToken = deviceToken
//    super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
//  }
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
    GeneratedPluginRegistrant.register(with: registry)
  }
    GeneratedPluginRegistrant.register(with: self)
    Messaging.messaging().delegate = self
      if #available(iOS 10.0, *) {
                  // For iOS 10 display notification (sent via APNS)
                  UNUserNotificationCenter.current().delegate = self
                  let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                  UNUserNotificationCenter.current().requestAuthorization(
                          options: authOptions,
                          completionHandler: {_, _ in })
              }
              application.registerForRemoteNotifications()
    GMSServices.provideAPIKey("AIzaSyD2Up44qdj3v6sbSS2Ruyn5Cj5jVNvAh64")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
