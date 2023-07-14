//
//  OnboardCoordinator.swift
//  Template
//
//  Created by Lam Nguyen on 5/16/22.
//

import UIKit
import Extensions

protocol OnboardNavigation: AnyObject {
  func gotoLogin()
  func gotoSignUp()
}

class OnboardCoordinator: BaseCoordinator {
  private var window: UIWindow

  init(_ window: UIWindow) {
    self.window = window
  }

  override func start() {
    gotoOnboard()
  }

  private func gotoOnboard() {
    let onboardVC = OnboardViewController.instanceFromNibClass()
    let viewModel = OnboardViewModel(self)
    onboardVC.viewModel = viewModel

    navigationController.viewControllers = [onboardVC]
    navigationController.delegate = self
    window.rootViewController = navigationController
  }
}

extension OnboardCoordinator: OnboardNavigation {
  func gotoLogin() {
    // Remove all children, because this is a top level coordinator.
    children.removeAll()

    let loginCoordinator = LoginCoordinator(navigationController: navigationController)
    loginCoordinator.parentCoordinator = parentCoordinator
    children.append(loginCoordinator)

    loginCoordinator.start()
  }

  func gotoSignUp() {
    children.removeAll()

    let signUpCoordinator = SignUpCoordinator(navigationController: navigationController)
    signUpCoordinator.parentCoordinator = parentCoordinator
    children.append(signUpCoordinator)

    signUpCoordinator.start()
  }
}

extension OnboardCoordinator: UINavigationControllerDelegate {
  func navigationController(_ navigationController: UINavigationController,
                            didShow _: UIViewController, animated _: Bool)
  {
    // ensure the view controller is popping
    guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
          !navigationController.viewControllers.contains(fromViewController)
    else {
      return
    }

    // Check type controller to pop, release coordinator
    if checkViewControllerRelease(fromViewController) {
      children.removeAll()
    }
  }

  private var kindOfViewControllersRelease: [String] {
    [String(describing: LoginViewController.self),
     String(describing: SignUpViewController.self)]
  }

  private func checkViewControllerRelease(_ viewController: UIViewController) -> Bool {
    let classType = String(describing: type(of: viewController))
    let isContains = kindOfViewControllersRelease.contains(classType)
    return isContains
  }
}
