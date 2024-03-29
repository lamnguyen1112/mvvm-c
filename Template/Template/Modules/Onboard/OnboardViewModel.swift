//
//  OnboardViewModel.swift
//  Template
//
//  Created by Lam Nguyen on 5/16/22.
//

import Foundation

class OnboardViewModel: BaseViewModel {
  private weak var navigation: OnboardNavigation!

  init(_ navigation: OnboardNavigation) {
    self.navigation = navigation
  }

  func gotoLogin() {
    navigation.gotoLogin()
  }

  func gotoHome() {
    navigation.gotoSignUp()
  }
}
