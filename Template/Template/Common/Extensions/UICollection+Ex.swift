//
//  UICollection+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/25/22.
//

import UIKit

public extension UICollectionView {
    var collectionViewFlowLayout: UICollectionViewFlowLayout? {
        return self.collectionViewLayout as? UICollectionViewFlowLayout
    }

    func reloadData(_ completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.reloadData()
        CATransaction.commit()
    }

    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.item >= 0 && indexPath.section >= 0 && indexPath.section < self.numberOfSections && indexPath.item < self.numberOfItems(inSection: indexPath.section)
    }

    func scrollToLastItem(animated: Bool = true, atScrollPosition: UICollectionView.ScrollPosition = .bottom) {
        let sectionIndex = self.numberOfSections - 1
        guard sectionIndex >= 0 else { return }
        let itemIndex = self.numberOfItems(inSection: sectionIndex) - 1
        let toIndexPath = IndexPath(item: itemIndex, section: sectionIndex)
        guard itemIndex >= 0, self.isValidIndexPath(toIndexPath) else { return }

        self.scrollToItem(at: toIndexPath, at: atScrollPosition, animated: animated)
    }

    func scrollToCell(_ toCell: UICollectionViewCell?, animated: Bool = true, atScrollPosition: UICollectionView.ScrollPosition = .bottom) {
        guard let cell = toCell else { return }
        guard let indexPath = self.indexPath(for: cell), self.isValidIndexPath(indexPath) else { return }

        self.scrollToItem(at: indexPath, at: atScrollPosition, animated: animated)
    }

    func isLastIndexPath(_ indexPath: IndexPath) -> Bool {
        return (indexPath.section == self.numberOfSections - 1) && (indexPath.item == self.numberOfItems(inSection: indexPath.section) - 1)
    }

    func register<T: UICollectionViewCell>(_ cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeue<T: UICollectionViewCell>(as cell: T.Type, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }
}


public extension UICollectionViewCell {
    var parentCollectionView: UICollectionView? {
        var parentView: UIView? = self.superview
        while parentView != nil && (parentView as? UICollectionView) == nil {
            parentView = parentView?.superview
        }

        return parentView  as? UICollectionView
    }

    class func registerNib(to collectionView: UICollectionView) {
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }

    class func registerClass(to collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    class func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        func _dequeue<T>(from collectionView: UICollectionView, for indexPath: IndexPath) -> T {
            collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as! T
        }
        return _dequeue(from: collectionView, for: indexPath)
    }
}

public extension UICollectionReusableView {
    static var reuseIdentifier: String { return String(describing: self) }
}
