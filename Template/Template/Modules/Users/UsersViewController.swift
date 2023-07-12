//
//  UsersViewController.swift
//  Template
//
//  Created by Lam Nguyen on 5/17/22.
//

import UIKit

class UsersViewController: BaseViewController {
    
    // MARK : - View Properties
    @IBOutlet weak var usersTableView: UITableView!
    
    // MARK : - Data Properties
    private var usersViewModel: UsersViewModel {
        return viewModel as! UsersViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        usersViewModel.getUsers()
    }
}

extension UsersViewController {
    private func setupUI() {
        title = L10n.Users.title
        usersTableView.rowHeight = UITableView.automaticDimension
        usersTableView.dataSource = self
        usersTableView.delegate = self
        UsersItemViewCell.registerNib(to: usersTableView)
    }
    
    private func bindUI() {
        usersViewModel.didGetUsers = { [weak self] in
            self?.usersTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersViewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersItemViewCell.reuseIdentifier, for: indexPath) as? UsersItemViewCell
        else {
            return UITableViewCell()
        }
        let user = usersViewModel.users[indexPath.row]
        cell.setUser(user)
        cell.selectionStyle = .default
        cell.setSeparatorFullWidth()

        return cell
    }
}

// MARK: - UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = usersViewModel.users[indexPath.row]
        usersViewModel.gotoUserDetails(user)
    }
}
