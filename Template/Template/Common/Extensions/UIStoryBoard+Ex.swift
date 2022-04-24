//
//  UIStoryBoard+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

public extension UIStoryboard {
    func initialViewController<T>() -> T {
        instantiateInitialViewController() as! T
    }

    func viewController<T: UIViewController>(identifier: String = T.classIdentifier) -> T {
        instantiateViewController(withIdentifier: identifier) as! T
    }

    class func initialViewController<T>(name storyboardName: String, bundle bundleOrNil: Bundle? = nil) -> T {
        self.init(name: storyboardName, bundle: bundleOrNil).initialViewController()
    }

    class func viewController<T: UIViewController>(name storyboardName: String, bundle bundleOrNil: Bundle? = nil, identifier: String = T.classIdentifier) -> T {
        self.init(name: storyboardName, bundle: bundleOrNil).viewController(identifier: identifier)
    }

    convenience init(named: String) {
        self.init(name: named, bundle: nil)
    }
}

