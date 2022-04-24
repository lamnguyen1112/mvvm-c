//
//  AuthCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

class AuthCoordinator: BaseCoordinator {
    
    override func start() {
        gotoLoginPage()
    }
    
    private func gotoLoginPage() {
        let loginVC = LoginViewController.instanceFromNibClass()
        let loginViewModel = LoginViewModel.init(navigation: self)
        loginVC.viewModel = loginViewModel
        
        navigationController.pushViewController(loginVC, animated: true)
    }
}

// MARK: - Navigate

extension AuthCoordinator: LoginNavigation {
    func gotoHome() {
        guard let appCoordinator = parentCoordinator as? AppCoordinator else {
            return
        }
        
        appCoordinator.gotoHome()
    }
    
    func gotoRegiter() {
        print("gotoRegiter")
    }
}
