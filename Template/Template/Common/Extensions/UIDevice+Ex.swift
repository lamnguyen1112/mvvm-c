//
//  UIDevice+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import UIKit

public extension UIDevice {
    
    static var height: CGFloat { return UIScreen.height }
    static var width: CGFloat { return UIScreen.width }
    static var bounds: CGRect { return UIScreen.main.bounds }
    static var center: CGPoint { return UIScreen.center }
    static var size: CGSize { return UIScreen.size }
    
    static var isIphone: Bool { return UIDevice.current.userInterfaceIdiom == .phone }
    static var isIpad: Bool { return UIDevice.current.userInterfaceIdiom == .pad }
    
    static var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
        } else {
            var layoutMargins = UIApplication.shared.windows.first?.layoutMargins ?? UIEdgeInsets.zero
            layoutMargins.top -= (layoutMargins.left + layoutMargins.right) / 2
            layoutMargins.bottom -= (layoutMargins.left + layoutMargins.right) / 2
            layoutMargins.left = 0
            layoutMargins.right = 0
            return layoutMargins
        }
    }
    
    static var iOSVersion: String { return current.systemVersion }
    static var osVersion: OperatingSystemVersion { return ProcessInfo().operatingSystemVersion }
    
//    static var safeAreaInsetsOffsetStatusBar: UIEdgeInsets {
//        var layoutInsets = self.safeAreaInsets
//        if !UIApplication.shared.isStatusBarHidden, layoutInsets.top == 0 { layoutInsets.top = 20 }
//        return layoutInsets
//    }
    
//    static var isRabbitEar: Bool {
//        if #available(iOS 11.0, *) {
//            var safeAreaTop = (UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0)
//            safeAreaTop -= UIApplication.shared.isStatusBarHidden ? 0 : 20
//            return safeAreaTop > 0
//        }
//        return false
//    }
}

public extension UIScreen {
    static var height: CGFloat { return UIScreen.main.bounds.size.height }
    static var width: CGFloat { return UIScreen.main.bounds.size.width }
    static var center: CGPoint { return CGPoint(x: UIScreen.width / 2, y: UIScreen.height / 2) }
    static var size: CGSize { return UIScreen.main.bounds.size }
}
