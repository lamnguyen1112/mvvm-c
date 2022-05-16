//
//  SignUpViewController.swift
//  Template
//
//  Created by Lam Nguyen on 5/17/22.
//

import UIKit

class SignUpViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

}

extension SignUpViewController {
    private func setupUI() {
        title = R.string.localizable.loginTitle()
        navigationController?.isNavigationBarHidden = false
    }
}
