//
//  ProfileViewController.swift
//  Template
//
//  Created by Lam Nguyen on 4/27/22.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    private var profileViewModel: ProfileViewModel {
        return viewModel as! ProfileViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = R.string.localizable.profileTitle()
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        profileViewModel.logout()
    }
}
