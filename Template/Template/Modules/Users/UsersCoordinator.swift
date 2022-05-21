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
