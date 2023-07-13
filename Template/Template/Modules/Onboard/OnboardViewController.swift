//
//  OnboardViewController.swift
//  Template
//
//  Created by Lam Nguyen on 5/16/22.
//

import SwiftUI
import UIKit

class OnboardViewController: BaseViewController {
  private var onboardViewModel: OnboardViewModel {
    viewModel as! OnboardViewModel
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.isNavigationBarHidden = true
  }
}

// MARK: - Action Handler

extension OnboardViewController {
  @IBAction private func loginButtonPressed() {
    onboardViewModel.gotoLogin()
    // Test popup :))
//        PopupHelper.presentPopup(alertView: BasicAlert(okAction: {
//            PopupHelper.dismiss()
//        }))
  }

  @IBAction private func signUpButtonPressed() {
    onboardViewModel.gotoHome()
  }
}
