//
//  AppDelegate.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupAppCoordinator()
        setupDebugToolKit()

        return true
    }
    
    private func setupAppCoordinator() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController.init()
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator!.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}

