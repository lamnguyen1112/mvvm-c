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
        let viewModel = UsersViewModel()
        let userVC = UsersViewController.instanceFromNibClass()
        userVC.viewModel = viewModel
        navigationController.viewControllers = [userVC]
    }
    
}
