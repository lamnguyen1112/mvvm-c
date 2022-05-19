//
//  UsersViewModel.swift
//  Template
//
//  Created by Lam Nguyen on 5/17/22.
//

import UIKit

class UsersViewModel: BaseViewModel {
    
    private let service = ExampleService()
    
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
}
