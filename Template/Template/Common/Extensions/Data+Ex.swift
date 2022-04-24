//
//  Data+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/25/22.
//

import Foundation

public extension Data {
    func deviceTokenString() -> String {
        let tokenParts = self.map { data -> String in
            return String(format: "%02.2hhx", data)
        }

        return tokenParts.joined()
    }

    var stringUTF8: String? { return String(data: self, encoding: .utf8) }
}
