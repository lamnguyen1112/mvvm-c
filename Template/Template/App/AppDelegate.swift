//
//  AppDelegate.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import PluggableAppDelegate
import UIKit

@main
class AppDelegate: PluggableApplicationDelegate {
  override var services: [ApplicationService] {
    [
      CoordinatorService(),
    ]
  }

  override init() {
    super.init()
    window = UIWindow(frame: UIScreen.main.bounds)
  }
}
