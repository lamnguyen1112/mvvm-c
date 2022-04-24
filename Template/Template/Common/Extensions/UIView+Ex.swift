//
//  UIView+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import UIKit

public extension UIView {
    var xFrame: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
    var yFrame: CGFloat {
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }
    var width: CGFloat {
        get { return self.frame.size.width }
        set { self.frame.size.width = newValue }
    }
    var height: CGFloat {
        get { return self.frame.size.height }
        set { self.frame.size.height = newValue }
    }
    var centerSelf: CGPoint { return CGPoint(x: width / 2.0, y: height / 2.0) }

    class var nibNameClass: String? {
        return "\(self)".components(separatedBy: ".").first
    }

    class var nib: UINib? {
        guard Bundle.main.path(forResource: nibNameClass, ofType: "nib") != nil else { return nil }
        
        return UINib(nibName: nibNameClass ?? "", bundle: nil)
    }

    class func nib(bundle: Bundle = Bundle.main) -> UINib? {
        guard bundle.path(forResource: nibNameClass, ofType: "nib") != nil else { return nil }

        return UINib(nibName: nibNameClass ?? "", bundle: bundle)
    }

    class func fromNib(nibNameOrNil: String? = nil, inBundle: Bundle = Bundle.main) -> Self? {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self, inBundle: inBundle)
    }

    class func fromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type, inBundle: Bundle = Bundle.main) -> T? {
        let nibName = (nibNameOrNil ?? nibNameClass) ?? ""
        guard inBundle.path(forResource: nibName, ofType: "nib") != nil else { return nil }

        guard let nibViews = inBundle.loadNibNamed(nibName, owner: nil, options: nil), nibViews.count > 0 else { return nil }

        for view in nibViews where view is T {
            return view as? T
        }
        return nil
    }

    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

    func captured(withScale: CGFloat = 0.0) -> UIImage? {
        var capturedImage: UIImage?
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, withScale)
        if let currentContext = UIGraphicsGetCurrentContext() {
            self.layer.render(in: currentContext)
            capturedImage = UIGraphicsGetImageFromCurrentImageContext()
        }

        UIGraphicsEndImageContext()
        return capturedImage
    }

    func rotate(degree: CGFloat = 0, duration: TimeInterval = 0) {
        DispatchQueue.mainAsync { [weak self] in
            UIView.animate(withDuration: duration) {
                self?.transform = CGAffineTransform(rotationAngle: CGFloat.pi * degree / 180.0)
            }
        }
    }
}

@IBDesignable
extension UIView {
    @IBInspectable
    open var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            setNeedsDisplay()
            setNeedsLayout()
        }
    }

    @IBInspectable
    open var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set {
            layer.borderWidth = newValue
            setNeedsDisplay()
            setNeedsLayout()
        }
    }

    @IBInspectable
    open var borderColor: UIColor? {
        get { return layer.borderColor == nil ? nil : UIColor(cgColor: layer.borderColor!) }
        set {
            layer.borderColor = newValue?.cgColor
            setNeedsDisplay()
            setNeedsLayout()
        }
    }

    @objc public func setCornerRadius(_ radius: CGFloat, width: CGFloat = 0, color: UIColor? = nil) {
        layer.cornerRadius = radius
        layer.borderWidth = width
        layer.borderColor = color?.cgColor
        if radius > 0 {
            clipsToBounds = true
        }
    }

    func add(to superview: UIView, belowSubview: UIView? = nil, aboveSubview: UIView? = nil) {
        if let below = belowSubview {
            superview.insertSubview(self, belowSubview: below)
        } else if let above = aboveSubview {
            superview.insertSubview(self, aboveSubview: above)
        } else {
            superview.addSubview(self)
        }
    }

    func sizeThatFits(width: CGFloat = CGFloat.greatestFiniteMagnitude,
                      height: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        sizeThatFits(CGSize(width: width, height: height))
    }

    @discardableResult
    func setLayout(_ attr1: NSLayoutConstraint.Attribute, is relation: NSLayoutConstraint.Relation = .equal,
        to: (view: Any, attribute: NSLayoutConstraint.Attribute)? = nil,
        multiplier: CGFloat = 1, constant: CGFloat = 0, activate: Bool = true) -> NSLayoutConstraint {
        let lc = NSLayoutConstraint(
            item: self, attribute: attr1, relatedBy: relation,
            toItem: to?.view, attribute: to?.attribute ?? .notAnAttribute,
            multiplier: multiplier, constant: constant
        )
        lc.isActive = activate
        return lc
    }

    @discardableResult
    @available(iOS 9.0, *)
    func constraint(
        equalToAnchorOf view: UIView,
        safeArea: Bool = false,
        top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0
    ) -> (top: NSLayoutConstraint, left: NSLayoutConstraint, bottom: NSLayoutConstraint, right: NSLayoutConstraint) {
        let topConst = topAnchor.constraint(equalTo: safeArea ? view.safeAreaTopAnchor : view.topAnchor, constant: top).activate()
        let leftConst = leftAnchor.constraint(equalTo: safeArea ? view.safeAreaLeftAnchor : view.leftAnchor, constant: left).activate()
        let bottomConst = bottomAnchor.constraint(equalTo: safeArea ? view.safeAreaBottomAnchor : view.bottomAnchor, constant: bottom).activate()
        let rightConst = rightAnchor.constraint(equalTo: safeArea ? view.safeAreaRightAnchor : view.rightAnchor, constant: right).activate()
        return (top: topConst, left: leftConst, bottom: bottomConst, right: rightConst)
    }
}

@available(iOS 9.0, *)
public extension UIView {
    var safeAreaLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        }
        return leadingAnchor
    }

    var safeAreaTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        }
        return trailingAnchor
    }

    var safeAreaLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }

    var safeAreaRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }

    var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }

    var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }

    var safeAreaWidthAnchor: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.widthAnchor
        }
        return widthAnchor
    }

    var safeAreaHeightAnchor: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.heightAnchor
        }
        return heightAnchor
    }

    var safeAreaCenterXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.centerXAnchor
        }
        return centerXAnchor
    }

    var safeAreaCenterYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.centerYAnchor
        }
        return centerYAnchor
    }
}


public extension NSLayoutConstraint {
    @discardableResult
    func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
}

