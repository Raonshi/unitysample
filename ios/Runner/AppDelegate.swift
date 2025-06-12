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
      
      // MARK: - Window Custom (iOS 15 터치 이슈)
      var window: CustomWindow
      if let windowScene = self.window.windowScene {
          window = CustomWindow(windowScene: windowScene)
      } else {
          window = CustomWindow(frame: UIScreen.main.bounds)
      }
      
      // MARK: - Window 계층 이슈
      window.windowLevel = .normal + 100
      window.rootViewController = self.window.rootViewController
      window.makeKeyAndVisible()
      self.window = window
      
      // MARK: - UnityFramwork 구동
      var unityManager = UnityManager()
      
      // MARK: - 유니티 IPC 연결
      if let ipcRegistrar = self.registrar(forPlugin: "MyMethodCallHandler") {
          UnityIpcManager.register(with: ipcRegistrar)
      }

      
      // MARK: - 유니티 화면 연결
      if let viewRegistrar = self.registrar(forPlugin: "UnityFlutterBridge") {
          let factory = UnityViewFactory(unityManager: unityManager)
          viewRegistrar.register(factory, withId: "@unity/view")
      }
      
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
