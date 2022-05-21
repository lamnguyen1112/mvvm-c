//
//  Coordinator.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    /// Removing a coordinator inside a children. This call is important to prevent memory leak.
    /// - Parameter coordinator: Coordinator that finished.
    func childDidFinish(_ coordinator: Coordinator) {
        // Call this if a coordinator is done.
        for (index, child) in children.enumerated() where child === coordinator {
            children.remove(at: index)
        }
    }
}

class BaseCoordinator: NSObject, Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController = UINavigationController()
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {}
    
    deinit {
        print("\(String(describing: self)) deinit")
    }
}
