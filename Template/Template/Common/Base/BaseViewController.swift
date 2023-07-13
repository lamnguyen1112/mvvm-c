//
//  BaseViewController.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

class BaseViewController: UIViewController {
  // MARK: - Properties

  var viewModel: BaseViewModel?

  private var isViewWillAppearAtFirst: Bool = true
  private var isViewDidAppearAtFirst: Bool = true

  override open func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
  }

  override open func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    viewWillAppearAtFirst(isViewWillAppearAtFirst, animated: animated)
    isViewWillAppearAtFirst = false
  }

  override open func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    viewDidAppearAtFirst(isViewDidAppearAtFirst, animated: animated)
    isViewDidAppearAtFirst = false
  }

  open func viewWillAppearAtFirst(_: Bool, animated _: Bool) {}
  open func viewDidAppearAtFirst(_: Bool, animated _: Bool) {}

  deinit {
    print("\(String(describing: self)) deinit")
  }
}
