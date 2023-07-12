//
//  AppDelegate.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit
import PluggableAppDelegate

@main
class AppDelegate: PluggableApplicationDelegate {
    override var services: [ApplicationService] {
        return [
          CoordinatorService()
        ]
    }

    override init() {
        super.init()
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }
}
