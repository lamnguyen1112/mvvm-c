//
//  CoordinatorService.swift
//  Template
//
//  Created by Lazyman on 7/12/23.
//

import PluggableAppDelegate
import UIKit

class CoordinatorService: NSObject, ApplicationService {
  var appCoordinator: AppCoordinator?

  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
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
