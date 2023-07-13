//
//  LoginViewModel.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import UIKit

class LoginViewModel: BaseViewModel {
  private weak var navigation: LoginNavigation!

  init(navigation: LoginNavigation) {
    self.navigation = navigation
  }

  func gotoHome() {
    navigation.gotoHome()
  }
}
