//
//  UINavigation+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import Foundation
import UIKit

public extension UINavigationController {
    var rootViewController: UIViewController? { return self.viewControllers.first }

    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }

    @discardableResult
    func popViewController(animated: Bool, completion: @escaping () -> Void) -> UIViewController? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let results = self.popViewController(animated: animated)
        CATransaction.commit()
        return results
    }

    @discardableResult
    func popToViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) -> [UIViewController]? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let results = self.popToViewController(viewController, animated: animated)
        CATransaction.commit()
        return results
    }

    @discardableResult
    func popToRootViewController(animated: Bool, completion: @escaping () -> Void) -> [UIViewController]? {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let results = self.popToRootViewController(animated: animated)
        CATransaction.commit()
        return results
    }

    // This function will be push viewController, and then remove all viewControllers in stack and only keep rootViewController of stack
    func pushViewControllerAndRemoveAllBefore(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        self.pushViewController(viewController, animated: animated) { [weak self] in
            guard let firstVC = self?.viewControllers.first, let lastVC = self?.viewControllers.last, firstVC != lastVC else {
                completion?()
                return
            }
            self?.viewControllers = [firstVC, lastVC]
            completion?()
        }
    }

    // if stacks include viewController, remove all viewControllers from viewController position, and push viewController again, other, push in viewController
    func pushToViewControllerBefore(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        var stackVCs = self.viewControllers
        let indexVc = stackVCs.remove(object: viewController)
        self.viewControllers = stackVCs
        var stackFinal = [UIViewController]()
        let indexVcFinal = indexVc ?? stackVCs.count
        for idx: Int in 0..<indexVcFinal {
            stackFinal.append(stackVCs[idx])
        }
        stackFinal.append(viewController)
        self.pushViewController(viewController, animated: animated) { [weak self] in
            self?.viewControllers = stackFinal
            completion?()
        }
    }

    func replaceLast(with viewController: UIViewController, animated: Bool = true) {
        var vcs = viewControllers
        vcs.removeLastSafe()
        vcs.append(viewController)

        setViewControllers(vcs, animated: animated)
    }

    func layoutNavigationBar() {
        let value = isNavigationBarHidden
        isNavigationBarHidden = !value
        isNavigationBarHidden = value
    }
}

public extension UIViewController {
    func canPopViewController() -> Bool {
        guard let nav = (self as? UINavigationController) ?? navigationController else { return false }
        for (i, vc) in nav.viewControllers.enumerated() where vc === self { return i > 0 }
        return false
    }
}
