//
//  UserDetailsViewModel.swift
//  Template
//
//  Created by Lam Nguyen on 5/21/22.
//

import Foundation

class UserDetailsViewModel: BaseViewModel {
  var user: UserModel

  init(_ user: UserModel) {
    self.user = user
  }
}
