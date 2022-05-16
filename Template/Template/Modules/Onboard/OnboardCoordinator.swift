//
//  OnboardCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 5/16/22.
//

import UIKit

class OnboardCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        gotoOnboard()
    }
    
    private func gotoOnboard() {
        let onboardVC = OnboardViewController.instanceFromNibClass()
        let viewModel = OnboardViewModel(self)
        onboardVC.viewModel = viewModel
        
        navigationController.viewControllers = [onboardVC]
        navigationController.delegate = self
        window.rootViewController = navigationController
    }
}

extension OnboardCoordinator: OnboardNavigation {
    
    func gotoLogin() {
        // Remove all children, because this is a top level coordinator.
        children.removeAll()

        let loginCoordinator = LoginCoordinator.init(navigationController: navigationController)
        loginCoordinator.parentCoordinator = self.parentCoordinator
        children.append(loginCoordinator)

        loginCoordinator.start()
    }
    
    func gotoSignUp() {
        children.removeAll()

        let signUpCoordinator = SignUpCoordinator.init(navigationController: navigationController)
        signUpCoordinator.parentCoordinator = self.parentCoordinator
        children.append(signUpCoordinator)

        signUpCoordinator.start()
    }
}
