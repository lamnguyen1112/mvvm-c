//
//  MainCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

class MainCoordinator: BaseCoordinator {
    
    override func start() {
        let mainVC = MainViewController.instanceFromNibClass()
        let mainViewModel = MainViewModel(navigation: self)
        mainVC.viewModel = mainViewModel
        
        UIApplication.switchRootViewController(to: mainVC, animated: true)
    }
}


extension MainCoordinator: MainNavigation {
    func logout() {
        guard let appCoordinator = parentCoordinator as? AppCoordinator else {
            return
        }
        
        appCoordinator.logout()
    }
    
}
