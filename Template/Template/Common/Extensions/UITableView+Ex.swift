//
//  UITableView+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import UIKit

public extension UITableView {
    func layoutSizeFittingHeaderView(_ width: CGFloat? = nil) {
        guard let viewFitting = self.tableHeaderView else { return }

        let fitWidth = width ?? self.frame.width

        viewFitting.translatesAutoresizingMaskIntoConstraints = false
        // [add subviews and their constraints to view]
        let widthConstraint = NSLayoutConstraint(item: viewFitting, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: fitWidth)
        widthConstraint.isActive = true

        viewFitting.addConstraint(widthConstraint)
        viewFitting.setNeedsLayout()
        viewFitting.layoutIfNeeded()
        let fittingHeight = viewFitting.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        viewFitting.removeConstraint(widthConstraint)
        widthConstraint.isActive = false

        viewFitting.frame = CGRect(x: 0, y: 0, width: fitWidth, height: fittingHeight)
        viewFitting.translatesAutoresizingMaskIntoConstraints = true

        self.tableHeaderView = viewFitting
    }

    func layoutSizeFittingFooterView(_ width: CGFloat? = nil) {
        guard let viewFitting = self.tableFooterView else { return }

        let fitWidth = width ?? self.frame.width

        viewFitting.translatesAutoresizingMaskIntoConstraints = false
        // [add subviews and their constraints to view]
        let widthConstraint = NSLayoutConstraint(item: viewFitting, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: fitWidth)
        widthConstraint.isActive = true

        viewFitting.addConstraint(widthConstraint)
        viewFitting.setNeedsLayout()
        viewFitting.layoutIfNeeded()
        let fittingHeight = viewFitting.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        viewFitting.removeConstraint(widthConstraint)
        widthConstraint.isActive = false

        viewFitting.frame = CGRect(x: 0, y: 0, width: fitWidth, height: fittingHeight)
        viewFitting.translatesAutoresizingMaskIntoConstraints = true

        self.tableFooterView = viewFitting
    }

    func setTableHeaderViewLayoutSizeFitting(_ headerView: UIView) {
        self.tableHeaderView = headerView
        self.layoutSizeFittingHeaderView()
    }

    func setTableFooterViewLayoutSizeFitting(_ footerView: UIView) {
        self.tableFooterView = footerView
        self.layoutSizeFittingFooterView()
    }

    func makeHeaderLeastNonzeroHeight() {
        let tempHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: CGFloat.leastNonzeroMagnitude))
        self.tableHeaderView = tempHeaderView
    }

    func makeFooterLeastNonzeroHeight() {
        let tempHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: CGFloat.leastNonzeroMagnitude))
        self.tableFooterView = tempHeaderView
    }

    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.row >= 0 && indexPath.section >= 0 && indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }

    func scrollToLastRow(animated: Bool = true, atScrollPosition: UITableView.ScrollPosition = .bottom) {
        let section = self.numberOfSections - 1
        guard section >= 0 else { return }
        let row = self.numberOfRows(inSection: section) - 1
        guard row >= 0, self.isValidIndexPath(IndexPath(row: row, section: section)) else { return }

        self.scrollToRow(at: IndexPath(row: row, section: section), at: atScrollPosition, animated: animated)
    }

    func scrollToCell(_ toCell: UITableViewCell?, animated: Bool = true, atScrollPosition: UITableView.ScrollPosition = .bottom) {
        guard let cell = toCell else { return }
        guard let indexPath = self.indexPath(for: cell), self.isValidIndexPath(indexPath) else { return }

        self.scrollToRow(at: indexPath, at: atScrollPosition, animated: animated)
    }

    func isLastIndexPath(_ indexPath: IndexPath) -> Bool {
        return (indexPath.section == self.numberOfSections - 1) && (indexPath.row == self.numberOfRows(inSection: indexPath.section) - 1)
    }

    func setSeparatorNoneForNoCells() {
        let footerV = UIView()
        footerV.backgroundColor = self.backgroundColor ?? UIColor.white
        self.tableFooterView = footerV
    }

    func reloadData(_ completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.reloadData()
        CATransaction.commit()
    }

    func reloadDataWithResetOffset() {
        UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions.allowAnimatedContent, animations: { [weak self] in
            self?.contentOffset = CGPoint.zero
        }) { [weak self] (_) in
            self?.reloadData()
        }
    }

    func register<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
    }

    func dequeue<T: UITableViewCell>(as cell: T.Type, for indexPath: IndexPath? = nil) -> T? {
        if let idx = indexPath {
            return dequeueReusableCell(withIdentifier: cell.reuseIdentifier, for: idx) as? T
        } else {
            return dequeueReusableCell(withIdentifier: cell.reuseIdentifier) as? T
        }
    }

    func deselectSelectedRows(animated: Bool = true) {
        indexPathsForSelectedRows?.forEach {
            deselectRow(at: $0, animated: animated)
        }
    }

    func batchUpdates(_ updates: (() -> Swift.Void)?, completion: ((Bool) -> Swift.Void)? = nil) {
        if #available(iOS 11, *) {
            performBatchUpdates(updates, completion: completion)
        } else {
            guard let updateBlock = updates else {
                completion?(false)
                return
            }
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                if let completionBlock = completion {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        if Thread.isMainThread {
                            completionBlock(true)
                        } else {
                            DispatchQueue.main.async(execute: {
                                completionBlock(true)
                            })
                        }
                    }
                }
            }
            self.beginUpdates()
            updateBlock()
            self.endUpdates()
            CATransaction.commit()
        }
    }
}

public extension UITableViewCell {
    static var reuseIdentifier: String { return String(describing: self) }

    var parentTableView: UITableView? {
        var parentView: UIView? = self.superview
        while parentView != nil && (parentView as? UITableView) == nil {
            parentView = parentView?.superview
        }

        return parentView  as? UITableView
    }

    func setSeparatorFullWidth() {
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }

    func setSeparatorInsets(_ edgeInsets: UIEdgeInsets) {
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = edgeInsets
        self.layoutMargins = UIEdgeInsets.zero
    }

    func setSeparatorInsetsEdges(left: CGFloat, right: CGFloat) {
        var edgeInsets = UIEdgeInsets.zero
        edgeInsets.left = left
        edgeInsets.right = right

        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = edgeInsets
        self.layoutMargins = UIEdgeInsets.zero
    }

    class func registerNib(to tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }

    class func registerClass(to tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: reuseIdentifier)
    }

    class func dequeue(from tableView: UITableView, for indexPath: IndexPath? = nil) -> Self {
        func _dequeue<T>(from tableView: UITableView, for indexPath: IndexPath?) -> T {
            if let idx = indexPath {
                return tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: idx) as! T
            } else {
                return tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) as! T
            }
        }
        return _dequeue(from: tableView, for: indexPath)
    }
}

