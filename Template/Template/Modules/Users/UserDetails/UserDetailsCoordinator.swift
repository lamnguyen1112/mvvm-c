//
//  UserDetailsCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 5/21/22.
//

import UIKit
import Extensions

class UserDetailsCoordinator: BaseCoordinator {
  private var user: UserModel

  init(navigationController: UINavigationController, user: UserModel) {
    self.user = user
    super.init(navigationController: navigationController)
  }

  override func start() {
    let viewModel = UserDetailsViewModel(user)
    let viewController = UserDetailsViewController.instanceFromNibClass()
    viewController.viewModel = viewModel

    navigationController.pushViewController(viewController, animated: true)
  }
}
