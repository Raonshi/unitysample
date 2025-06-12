import Flutter
import UnityFramework
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      
      // MARK: - UnityFramwork 구동
      _ = UnityManager()
      
      // MARK: - 유니티 IPC 연결
      if let ipcRegistrar = self.registrar(forPlugin: "MyMethodCallHandler") {
          UnityIpcManager.register(with: ipcRegistrar)
      }

      
      // MARK: - 유니티 화면 연결
      if let viewRegistrar = self.registrar(forPlugin: "UnityFlutterBridge") {
          let factory = UnityViewFactory()
          viewRegistrar.register(factory, withId: "@unity/view")
      }
      
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
