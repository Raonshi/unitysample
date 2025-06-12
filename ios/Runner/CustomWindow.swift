//
//  CustomWindow.swift
//  Runner
//
//  Created by 홍순원 on 6/12/25.
//

class CustomWindow: UIWindow {
    public static let PassthroughTag = 9999
    
    override func hitTest(
        _ point: CGPoint,
        with event: UIEvent?
    ) -> UIView? {
        guard let view = super.hitTest(point, with: event) else {
            return nil
        }
        
        if view.tag == CustomWindow.PassthroughTag {
            return nil
        }
        
        return view
    }
}
