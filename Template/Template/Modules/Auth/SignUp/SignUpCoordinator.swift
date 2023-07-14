//
//  SignUpCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 5/17/22.
//

import UIKit
import Extensions

class SignUpCoordinator: BaseCoordinator {
  override func start() {
    gotoSignUp()
  }

  private func gotoSignUp() {
    let signUpVC = SignUpViewController.instanceFromNibClass()
    let viewModel = SignUpViewModel()
    signUpVC.viewModel = viewModel

    navigationController.pushViewController(signUpVC, animated: true)
  }
}
