//
//  AppExtension.swift
//  Template
//
//  Created by Lam Nguyen on 5/21/22.
//

import UIKit

extension BaseCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController, animated: Bool) {
        // ensure the view controller is popping
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromViewController) else {
            return
        }
        
        // Check type controller to pop, release coordinator
        if checkViewControllerRelease(fromViewController) {
            self.children.removeAll()
        }
    }
    
    private var kindOfViewControllersRelease: [String] {
        return [String(describing: LoginViewController.self),
                String(describing: SignUpViewController.self),
                // User details
                String(describing: UserDetailsViewController.self)
        ]
    }
        
    private func checkViewControllerRelease(_ viewController: UIViewController) -> Bool {
        let classType = String(describing: type(of: viewController))
        let isContains = kindOfViewControllersRelease.contains(classType)
        return isContains
    }
    
}

