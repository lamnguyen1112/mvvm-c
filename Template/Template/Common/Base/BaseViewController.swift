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
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.viewWillAppearAtFirst(self.isViewWillAppearAtFirst, animated: animated)
        self.isViewWillAppearAtFirst = false
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.viewDidAppearAtFirst(self.isViewDidAppearAtFirst, animated: animated)
        self.isViewDidAppearAtFirst = false
    }

    open func viewWillAppearAtFirst(_ atFirst: Bool, animated: Bool) { }
    open func viewDidAppearAtFirst(_ atFirst: Bool, animated: Bool) { }
    
    deinit {
        print("\(String(describing: self)) deinit")
    }
}
