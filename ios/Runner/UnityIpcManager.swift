//
//  UnityIpcManager.swift
//  Runner
//
//  Created by 홍순원 on 6/11/25.
//

import UnityFramework

class UnityIpcManager: NSObject, FlutterPlugin {
    private let channel: FlutterMethodChannel
    


    init(messenger: FlutterBinaryMessenger) {
        self.channel = FlutterMethodChannel(
            name: "@unity/ipc",
            binaryMessenger: messenger
        )
        
        super.init()
        
        self.channel.setMethodCallHandler(handle)
        
    }

    internal func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "setRotation":
            if let rotation = call.arguments as? Double {
                setRotation(rotation: Float(rotation))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
        result(nil)
    }

    static func register(
        with registrar: FlutterPluginRegistrar
    ) {
        _ = UnityIpcManager(messenger: registrar.messenger())
    }
    
  
       private func setRotation(rotation: Float) {
           UnityManager.shared.sendMessage(String(rotation))
       }
}
