//
//  CoordinatorService.swift
//  Template
//
//  Created by Lazyman on 7/12/23.
//

import UIKit
import PluggableAppDelegate

class CoordinatorService: NSObject, ApplicationService {
  var appCoordinator: AppCoordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    setupAppCoordinator()
    return true
  }
}

extension CoordinatorService {
  func setupAppCoordinator() {
      appCoordinator = AppCoordinator(window!)
      appCoordinator?.start()

      window?.makeKeyAndVisible()
  }
}
