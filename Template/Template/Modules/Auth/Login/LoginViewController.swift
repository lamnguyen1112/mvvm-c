//
//  LoginViewController.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

class LoginViewController: BaseViewController {
    
    private var loginViewModel: LoginViewModel {
        return viewModel as! LoginViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
}

// MARK: - Action
extension LoginViewController {
    @IBAction private func goHomeAction(_ sender: Any) {
        loginViewModel.gotoHome()
    }
}

// MARK: - Helper
extension LoginViewController {
    private func setupUI() {
        title = L10n.Login.title
        navigationController?.isNavigationBarHidden = false
    }
}

