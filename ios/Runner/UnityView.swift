//
//  UnityView.swift
//  Runner
//
//  Created by 홍순원 on 6/11/25.
//

class UnityView: NSObject, FlutterPlatformView {
    private var containerView: UIView
    private var unityManager: UnityManager
    
    init(
        frame: CGRect,
        viewId: Int64,
        args: Any?,
        unityManager: UnityManager
    ) {
        self.unityManager = unityManager
        self.containerView = UIView(frame: frame)
        
        super.init()
        
        self.containerView.tag = CustomWindow.PassthroughTag
        
        if let unityView = self.unityManager.unityUIView() {
            unityView.frame = self.containerView.bounds
            
            unityView.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]

            if unityView.superview != self.containerView {
                unityView.removeFromSuperview()
                self.containerView.addSubview(unityView)
            }

            unityView.isHidden = false
        }
    }
    
    func view() -> UIView {
        return self.containerView
    }
    
}
