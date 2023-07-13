//
//  MainViewController.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import UIKit

class MainViewController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  deinit {
    print("\(String(describing: self)) deinit")
  }
}
