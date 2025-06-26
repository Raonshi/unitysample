//
//  UnityManager.swift
//  Runner
//
//  Created by 홍순원 on 6/11/25.
//

import UnityFramework

class UnityManager : NSObject, NativeCallsProtocol {
    static let shared = UnityManager()
    
    private var ufw: UnityFramework?
    private var unityView: UIView?
    
    
    private override init() {
        super.init()
        self.initUnity()
    }
    
    func showHostMainWindow(_ color: String) {
        
    }
    
    
    
    func show() {
        if ufw == nil {
            initUnity()
        }
        ufw?.showUnityWindow()
    }
    
    func hide() {
        if ufw != nil {
            ufw?.pause(true)
        }
    }
    
    func sendMessage(_ message: String) {
        ufw?.sendMessageToGO(
            withName: "Cube",
            functionName: "SetRotationSpeed",
            message: message
        )
    }
    
    // MARK: - Init Unity Framework
    private func initUnity() {
        let bundlePath = Bundle.main.bundlePath + "/Frameworks/UnityFramework.framework"
        guard let bundle = Bundle(path: bundlePath) else { return }
        if !bundle.isLoaded { bundle.load() }
        
        guard let ufwClass = bundle.principalClass as? UnityFramework.Type else { return }
        let instance = ufwClass.getInstance()
        
        let headerPtr = UnsafePointer<MachHeader>(bitPattern: Int(bitPattern: #dsohandle))!
        instance?.setExecuteHeader(headerPtr)
        
        instance?.setDataBundleId("com.unity3d.framework")
        instance?.runEmbedded(withArgc: CommandLine.argc, argv: CommandLine.unsafeArgv, appLaunchOpts: nil)
        
        self.ufw = instance
        self.ufw?.register(self)
        
        FrameworkLibAPI.registerAPIforNativeCalls(self)
        
        self.unityView = instance?.appController()?.rootView
    }
    
    func unityUIView() -> UIView? {
        return self.unityView
    }
}

extension UnityManager: UnityFrameworkListener {
    internal func unityDidUnload(_ notification: Notification!) {
        self.ufw?.unregisterFrameworkListener(self)
    }
    
    func unityDidQuit(_ notification: Notification!) {
        
    }
}
