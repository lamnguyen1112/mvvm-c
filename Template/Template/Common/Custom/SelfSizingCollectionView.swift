//
//  SelfSizingCollectionView.swift
//  Template
//
//  Created by Lam Nguyen on 4/22/22.
//

import UIKit

/// This collection view resize itself to the size of its content size.
class SelfSizingCollectionView: UICollectionView {
  override var contentSize: CGSize {
    didSet {
      invalidateIntrinsicContentSize()
    }
  }

  override var intrinsicContentSize: CGSize {
    layoutIfNeeded()
    return contentSize
  }

  override func reloadData() {
    super.reloadData()
    invalidateIntrinsicContentSize()
    layoutIfNeeded()
  }

  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)

    isScrollEnabled = false
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    isScrollEnabled = false
  }
}
