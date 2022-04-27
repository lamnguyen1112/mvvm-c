//
//  AppDelegate+Setting.swift
//  Template
//
//  Created by Lam Nguyen on 4/25/22.
//

import UIKit
#if DEBUG
    import DBDebugToolkit
#endif

extension AppDelegate {
    
    func setupDebugToolKit() {
#if DEBUG
        let shakeTrigger = DBShakeTrigger()
        DBDebugToolkit.setup(with: [shakeTrigger])
#endif
    }
}
