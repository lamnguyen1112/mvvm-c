//
//  UIApplication+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/23/22.
//

import UIKit

public extension UIApplication {
    static var appVersion: String {
        return (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String) ?? "1.0.0"
    }
    
    static var appBuild: String {
        return (Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String) ?? "1"
    }
    
    static var appVersionBuild: String {
        return "v\(self.appVersion)(\(self.appBuild))"
    }
    
    class var rootViewController: UIViewController? { return self.shared.delegate?.window??.rootViewController }
    
    class var topMostViewController: UIViewController? {
        return self.rootViewController?.topMostViewController
    }
    
    class var visibleMostViewController: UIViewController? {
        return self.rootViewController?.visibleMostViewController
    }
    
    static var delegateKeyWindow: UIWindow? { return self.shared.delegate?.window ?? nil }
    
    static func canOpen(url string: String) -> Bool {
        guard let url = URL(string: string) else { return false }
        return shared.canOpenURL(url)
    }
    
    static func openUrlString(_ urlString: String?) {
        if let stringUrl = urlString, let url = URL(string: stringUrl) {
            if #available(iOS 10.0, *) {
                self.shared.open(url, options: [:], completionHandler: nil)
            } else {
                _ = self.shared.openURL(url)
            }
        }
    }
    
    static var statusBarView: UIView? {
        return UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
    }
    
    static var appKeyWindow: UIWindow? {
        return self.delegateKeyWindow ?? keyWindowOrFirst
    }
    
    static var keyWindowOrFirst: UIWindow? {
    #if os(iOS)
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first
        } else {
            return UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first
        }
    #elseif os(OSX)
        return UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first
    #else
        return nil
    #endif
    }
    
    static func switchRootViewController(to newRootViewController: UIViewController, animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let window = appKeyWindow else {
            completion?(false)
            return
        }
        
        guard animated else {
            window.rootViewController = newRootViewController
            window.makeKeyAndVisible()
            completion?(true)
            return
        }
        
        window.rootViewController = newRootViewController
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: { _ in
            completion?(true)
        })
    }
}
