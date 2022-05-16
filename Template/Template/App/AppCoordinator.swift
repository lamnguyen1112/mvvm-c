//
//  AppCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    private var window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        gotoOnboard()
    }
    
    private func gotoOnboard() {
        children.removeAll()
        
        let onboardCoordinator = OnboardCoordinator(window)
        onboardCoordinator.parentCoordinator = self
        children.append(onboardCoordinator)
        
        onboardCoordinator.start()
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
    
    func logout() {
        children.removeAll()

        gotoOnboard()
    }
}
