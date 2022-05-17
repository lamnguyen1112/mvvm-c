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
    }
}

extension UsersViewController {
    private func setupUI() {
        title = R.string.localizable.usersTitle()
        
        usersTableView.rowHeight = UITableView.automaticDimension
        usersTableView.dataSource = self
        UsersItemViewCell.registerNib(to: usersTableView)
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

        return cell
    }
}

// MARK: - UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
