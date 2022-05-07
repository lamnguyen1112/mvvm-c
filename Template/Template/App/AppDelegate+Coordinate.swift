//
//  File.swift
//  Template
//
//  Created by Lam Nguyen on 5/7/22.
//

import UIKit

extension AppDelegate {
    func setupAppCoordinator() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController.init()
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator!.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
