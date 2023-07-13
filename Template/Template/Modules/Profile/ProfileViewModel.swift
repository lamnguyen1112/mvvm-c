//
//  ProfileViewModel.swift
//  Template
//
//  Created by Lam Nguyen on 4/27/22.
//

import Foundation

protocol ProfileNavigation: AnyObject {
  func logout()
}

class ProfileViewModel: BaseViewModel {
  private weak var navigation: ProfileNavigation!

  init(navigation: ProfileNavigation) {
    self.navigation = navigation
  }

  func logout() {
    navigation.logout()
  }
}
