//
//  ProfileCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/27/22.
//

import UIKit
import Extensions

class ProfileCoordinator: BaseCoordinator {
  override init(navigationController: UINavigationController = UINavigationController()) {
    super.init()
    self.navigationController = navigationController
  }

  override func start() {
    let profileVM = ProfileViewModel(navigation: self)
    let profileVC = ProfileViewController.instanceFromNibClass()
    profileVC.viewModel = profileVM
    navigationController.viewControllers = [profileVC]
  }
}

extension ProfileCoordinator: ProfileNavigation {
  func logout() {
    guard let appCoordinator = parentCoordinator as? AppCoordinator else {
      return
    }
    appCoordinator.logout()
  }
}
