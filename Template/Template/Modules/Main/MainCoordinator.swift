//
//  MainCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import core
import SideMenu
import UIKit

class MainCoordinator: BaseCoordinator {
  override func start() {
    initializeTabbar()
  }

  private func initializeTabbar() {
    let mainVC = MainViewController()

    // Setup Side Menu
    let menuVC = MenuViewController.instanceFromNibClass()
    let menuViewModel = MenuViewModel()
    menuVC.viewModel = menuViewModel
    let sideMenuVC = SideMenuController(contentViewController: mainVC, menuViewController: menuVC)

    let watchListNavigationController = UINavigationController()
    let watchCoordinator = WatchListCoordinator(navigationController: watchListNavigationController)
    watchCoordinator.parentCoordinator = parentCoordinator

    // Create the tabbar item for tabbar.

    // Setup for watch list
    let watchListItem = UITabBarItem()
    watchListItem.title = "Watch List"
    watchListItem.image = UIImage(systemName: "house.fill")
    watchListNavigationController.tabBarItem = watchListItem

    // Setup for Users
    let usersNavigationController = UINavigationController()
    let usersCoordinator = UsersCoordinator(navigationController: usersNavigationController)
    usersCoordinator.parentCoordinator = parentCoordinator

    let usersItem = UITabBarItem()
    usersItem.title = "Users"
    usersItem.image = UIImage(systemName: "person.circle")
    usersNavigationController.tabBarItem = usersItem

    // Setup for profile tab
    let profileNavigationController = UINavigationController()
    let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController)
    profileCoordinator.parentCoordinator = parentCoordinator

    let profileItem = UITabBarItem()
    profileItem.title = "Profile"
    profileItem.image = UIImage(systemName: "person.fill")
    profileNavigationController.tabBarItem = profileItem

    mainVC.viewControllers = [watchListNavigationController, usersNavigationController, profileNavigationController]
    UIApplication.switchRootViewController(to: sideMenuVC, animated: true)

    // Add the coordinator into parent's child
    parentCoordinator?.children.append(watchCoordinator)
    parentCoordinator?.children.append(usersCoordinator)
    parentCoordinator?.children.append(profileCoordinator)

    watchCoordinator.start()
    usersCoordinator.start()
    profileCoordinator.start()
  }
}
