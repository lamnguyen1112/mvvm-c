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

extension WatchListViewController {}

// MARK: - Helper

extension WatchListViewController {
  func setupUI() {
    setupNavigationBar()
  }

  private func setupNavigationBar() {
    title = L10n.Watchlist.title

    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(showMenu))
  }
}

// MARK: - Actions

extension WatchListViewController {
  @objc private func showMenu() {
    sideMenuController?.revealMenu(animated: true, completion: nil)
  }
}
