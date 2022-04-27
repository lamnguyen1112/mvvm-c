//
//  WatchListViewController.swift
//  Template
//
//  Created by Lam Nguyen on 4/27/22.
//

import UIKit

class WatchListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
}

// MARK: - Action
extension WatchListViewController {
    
}

// MARK: - Helper
extension WatchListViewController {
    func setupUI() {
        title = R.string.localizable.watchlistTitle()
    }
}
