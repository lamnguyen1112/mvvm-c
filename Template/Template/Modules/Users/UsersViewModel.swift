//
//  UsersViewModel.swift
//  Template
//
//  Created by Lam Nguyen on 5/17/22.
//

import Foundation

protocol UsersNavigation: AnyObject {
    func gotoUserDetails(_ user: UserModel)
}

class UsersViewModel: BaseViewModel {
    
    private let service = ExampleService()
    private weak var navigation: UsersNavigation!
    
    init(navigation: UsersNavigation) {
        self.navigation = navigation
    }
    
    var users: [UserModel] = [] {
        didSet {
            didGetUsers?()
        }
    }
    
    var didGetUsers: (() -> Void)?
    
    func getUsers() {
        service.request(target: .users) { [weak self] response in
            do {
                let users: [UserModel]? = try response.mapArray(UserModel.self)
                if let users = users {
                    self?.users = users
                }
            } catch {
                print("error for parse")
            }
        } error: { error in
            // error for response
            print(error)
        } failure: { error in
            // error for request
            print(error)
        }
    }
    
    func gotoUserDetails(_ user: UserModel) {
        navigation.gotoUserDetails(user)
    }
}
