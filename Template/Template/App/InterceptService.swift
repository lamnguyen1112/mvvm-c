//
//  InterceptService.swift
//  Template
//
//  Created by Lazyman on 7/12/23.
//

import UIKit
import PluggableAppDelegate
#if DEBUG
  import Atlantis
#endif

class InterceptService: NSObject, ApplicationService {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    #if DEBUG
        Atlantis.start()
    #endif
    return true
  }
}
