//
//  AppCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private var isAuthenticate: Bool = false
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        if !isAuthenticate {
            gotoAuth()
            return
        }
        
        gotoHome()
    }
    
    private func gotoAuth() {
        // Remove all children, because this is a top level coordinator.
        children.removeAll()
        
        let authCoordinator = AuthCoordinator.init(navigationController: navigationController)
        authCoordinator.parentCoordinator = self
        children.append(authCoordinator)
        
        authCoordinator.start()
    }
    
    func gotoHome() {
        // Remove all children, because this is a top level coordinator.
        children.removeAll()
        
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.parentCoordinator = self
        children.append(mainCoordinator)
        
        mainCoordinator.start()
        
        // Remove view controller in navigation
        navigationController.viewControllers = []
    }
}
