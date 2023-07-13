//
//  SelfSizingTableView.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

/// This table view resize itself to the size of its content size.
class SelfSizingTableView: UITableView {
  override var contentSize: CGSize {
    didSet {
      invalidateIntrinsicContentSize()
    }
  }

  override var intrinsicContentSize: CGSize {
    CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
  }

  override func reloadData() {
    super.reloadData()
    invalidateIntrinsicContentSize()
    layoutIfNeeded()
  }

  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    isScrollEnabled = false
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    isScrollEnabled = false
  }
}
