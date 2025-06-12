//
//  UnityView.swift
//  Runner
//
//  Created by 홍순원 on 6/11/25.
//

class UnityView: NSObject, FlutterPlatformView {
    private var containerView: UIView
    
    init(
        frame: CGRect,
        viewId: Int64,
        args: Any?,
    ) {
        self.containerView = UIView(frame: frame)
        
        super.init()
        
        
    }
    
    func view() -> UIView {
        return self.containerView
    }
    
}
