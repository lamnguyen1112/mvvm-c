//
//  InterceptService.swift
//  Template
//
//  Created by Lazyman on 7/12/23.
//

import PluggableAppDelegate
import UIKit
#if DEBUG
  import Atlantis
#endif

class InterceptService: NSObject, ApplicationService {
  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    #if DEBUG
      Atlantis.start()
    #endif
    return true
  }
}
