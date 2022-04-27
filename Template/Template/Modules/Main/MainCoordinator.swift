//
//  MainCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

class MainCoordinator: BaseCoordinator {
    
    override func start() {
        initializeTabbar()
    }
    
    private func initializeTabbar() {
        let mainVC = MainViewController()
        
        let watchListNavigationController = UINavigationController()
        let watchCoordinator = WatchListCoordinator.init(navigationController: watchListNavigationController)
        watchCoordinator.parentCoordinator = parentCoordinator
        
        // Create the tabbar item for tabbar.
        let watchListItem = UITabBarItem()
        watchListItem.title = "Watch List"
        watchListItem.image = UIImage.init(systemName: "house.fill")
        watchListNavigationController.tabBarItem = watchListItem
        
        // Setup for profile tab
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator.init(navigationController: profileNavigationController)
        profileCoordinator.parentCoordinator = parentCoordinator
        
        let profileItem = UITabBarItem()
        profileItem.title = "Profile"
        profileItem.image = UIImage.init(systemName: "person.fill")
        profileNavigationController.tabBarItem = profileItem
        
        mainVC.viewControllers = [watchListNavigationController, profileNavigationController]
        UIApplication.switchRootViewController(to: mainVC, animated: true)
        
        // Add the coordinator into parent's child
        parentCoordinator?.children.append(watchCoordinator)
        parentCoordinator?.children.append(profileCoordinator)
        
        watchCoordinator.start()
        profileCoordinator.start()
    }
}
