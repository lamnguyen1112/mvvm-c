//
//  UsersItemViewCell.swift
//  Template
//
//  Created by Lam Nguyen on 5/17/22.
//

import UIKit

class UsersItemViewCell: UITableViewCell {
    
    @IBOutlet private weak var userNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUser(_ user: User) {
        userNameLbl.text = user.name
    }
    
}
