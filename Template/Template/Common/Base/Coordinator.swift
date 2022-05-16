//
//  Coordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    /// Removing a coordinator inside a children. This call is important to prevent memory leak.
    /// - Parameter coordinator: Coordinator that finished.
    func childDidFinish(_ coordinator: Coordinator) {
        // Call this if a coordinator is done.
        for (index, child) in children.enumerated() where child === coordinator {
            children.remove(at: index)
        }
    }
}

class BaseCoordinator: NSObject, Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController = UINavigationController()
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {}
    
    deinit {
        print("\(String(describing: self)) deinit")
    }
}

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
                String(describing: SignUpViewController.self)]
    }
        
    private func checkViewControllerRelease(_ viewController: UIViewController) -> Bool {
        let classType = String(describing: type(of: viewController))
        let isContains = kindOfViewControllersRelease.contains(classType)
        return isContains
    }
    
}
