//
//  UserDetailsViewController.swift
//  Template
//
//  Created by Lam Nguyen on 5/21/22.
//

import UIKit

class UserDetailsViewController: BaseViewController {

    // MARK: - UI
    @IBOutlet weak var userNameLbl: UILabel!
    
    // MARK: - Data
    private var userDetailsViewModel: UserDetailsViewModel {
        return viewModel as! UserDetailsViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
}

extension UserDetailsViewController {
    
    private func setupUI() {
        title = L10n.Userdetails.title
        userNameLbl.text = userDetailsViewModel.user.name
        tabBarController?.tabBar.isHidden = true
    }
}
