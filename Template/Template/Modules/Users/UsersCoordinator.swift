//
//  UsersCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 5/17/22.
//

import UIKit

class UsersCoordinator: BaseCoordinator {
    
    override init(navigationController: UINavigationController = UINavigationController()) {
        super.init()
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewModel = UsersViewModel(navigation: self)
        let userVC = UsersViewController.instanceFromNibClass()
        userVC.viewModel = viewModel
        navigationController.viewControllers = [userVC]
        navigationController.delegate = self
    }
    
}

extension UsersCoordinator: UsersNavigation {
    func gotoUserDetails(_ user: UserModel) {
        let coordinator = UserDetailsCoordinator(navigationController: navigationController, user: user)
        children.append(coordinator)
        coordinator.start()
    }
}

extension UsersCoordinator: UINavigationControllerDelegate {
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
        return [
            String(describing: UserDetailsViewController.self)
        ]
    }
        
    private func checkViewControllerRelease(_ viewController: UIViewController) -> Bool {
        let classType = String(describing: type(of: viewController))
        let isContains = kindOfViewControllersRelease.contains(classType)
        return isContains
    }
    
}
