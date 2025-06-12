//
//  UnityViewFactory.swift
//  Runner
//
//  Created by 홍순원 on 6/11/25.
//

class UnityViewFactory: NSObject, FlutterPlatformViewFactory {
    private var unityManager: UnityManager
    
    override init() {
        self.unityManager = UnityManager()
        super.init()
    }
    
    func createArgsCodec() -> any FlutterMessageCodec & NSObjectProtocol {
         return FlutterStandardMessageCodec()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> any FlutterPlatformView {
        return UnityView(frame: frame, viewId: viewId, args: args, unityManager: self.unityManager)
    }
}
