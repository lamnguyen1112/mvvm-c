//
//  BaseViewController.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Properties
    var viewModel: BaseViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("\(String(describing: self)) deinit")
    }
}
