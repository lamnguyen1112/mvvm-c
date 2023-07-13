//
//  PopupHelper.swift
//  Template
//
//  Created by Lam Nguyen on 7/27/22.
//

import core
import SwiftEntryKit
import SwiftUI
import UIKit

struct AlertContent {
  var title: String?
  var message: String?
  var okButtonTitle: String?
  var cancelButtonTitle: String?
}

struct BasicAlert: View {
  var cancelTitle: String?
  var okTitle: String? = "OK"
  var okAction: (() -> Void)?
  var cancelAction: (() -> Void)?

  var body: some View {
    VStack {
      Text("Title")
        .font(.headline)
        .lineLimit(2)
      Spacer()
        .frame(height: 10)
      Text("Hello World")
        .font(.body)
        .lineLimit(3)
      Spacer()
        .frame(height: 20)
      HStack {
        if let cancelTitle = cancelTitle {
          Spacer()
          Button(cancelTitle, action: {
            cancelAction?()
          })
          Spacer()
        }
        Spacer()
        Button(okTitle ?? "OK", action: {
          okAction?()
        })
        Spacer()
      }
      .padding(.horizontal, 20)
    }
  }
}

enum PopupHelper {
  static func presentPopup<AlertView: View>(alertView: AlertView) {
    let viewController = UIHostingController(rootView: alertView)
    viewController.view.cornerRadius = 10
    SwiftEntryKit.display(entry: viewController, using: defaultSettings)
  }

  static func dismiss(completionHandler: (() -> Void)? = nil) {
    if SwiftEntryKit.isCurrentlyDisplaying {
      SwiftEntryKit.dismiss {
        completionHandler?()
      }
    }
  }

  static var defaultSettings: EKAttributes {
    var attributes = EKAttributes.centerFloat
    attributes.windowLevel = .normal
    attributes.screenBackground = .color(color: EKColor(UIColor.black.withAlphaComponent(0.5)))
    attributes.entranceAnimation = .init(fade: .init(from: 0, to: 1, duration: 0.25))
    attributes.exitAnimation = .init(fade: .init(from: 1, to: 0, duration: 0.3))
    attributes.popBehavior = .animated(animation: .init(fade: .init(from: 1, to: 0, duration: 2.5)))
    attributes.scroll = .disabled
    attributes.displayDuration = .infinity
    // to disable tap dim to dismiss change this property
    attributes.screenInteraction = .dismiss
    attributes.entryInteraction = .absorbTouches
    attributes.statusBar = .light
    attributes.precedence = .enqueue(priority: .normal)
    attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.width), height: .constant(value: UIScreen.height - 140))
    return attributes
  }
}
