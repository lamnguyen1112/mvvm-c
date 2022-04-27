//
//  WatchListCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/27/22.
//

import UIKit

class WatchListCoordinator: BaseCoordinator {
    
    override init(navigationController: UINavigationController = UINavigationController()) {
        super.init()
        self.navigationController = navigationController
    }
    
    override func start() {
        let watchListVM = WatchListViewModel()
        let watchListVC = WatchListViewController.instanceFromNibClass()
        watchListVC.viewModel = watchListVM
        navigationController.viewControllers = [watchListVC]
    }
}
