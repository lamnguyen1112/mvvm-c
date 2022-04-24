//
//  MainViewController.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import UIKit

class MainViewController: BaseViewController {
    
    private var mainViewModel: MainViewModel {
        return viewModel as! MainViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func logoutAction() {
        mainViewModel.logout()
    }
}
