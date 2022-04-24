//
//  DispatchQueue+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import Foundation

public extension DispatchQueue {
    static var background: DispatchQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)

    class func mainAsync(execute work: @escaping @convention(block) () -> Swift.Void) {
        DispatchQueue.main.async {
            work()
        }
    }

    class func mainAsyncAfter(seconds: Double, execute work: @escaping @convention(block) () -> Swift.Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            DispatchQueue.main.async {
                work()
            }
        }
    }

    class func backgroundAsync(execute work: @escaping @convention(block) () -> Swift.Void) {
        DispatchQueue.background.async {
            work()
        }
    }

    class func backgroundAsyncAfter(seconds: Double, execute work: @escaping @convention(block) () -> Swift.Void) {
        DispatchQueue.background.asyncAfter(deadline: .now() + seconds) {
            work()
        }
    }

    class func serialAsync(_ label: String = "DispatchSerial", execute work: @escaping @convention(block) () -> Swift.Void) {
        DispatchQueue(label: label).async {
            work()
        }
    }

    class func serialAsyncAfter(_ label: String = "DispatchSerial", seconds: Double, execute work: @escaping @convention(block) () -> Swift.Void) {
        DispatchQueue(label: label).asyncAfter(deadline: .now() + seconds) {
            work()
        }
    }
}
