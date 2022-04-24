//
//  String+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/25/22.
//

import Foundation

public extension String {
    var nsString: NSString { return self as NSString }
    var length: Int { return self.nsString.length }
    var trimWhiteSpace: String { return self.trimmingCharacters(in: .whitespaces) }
    var trimWhiteSpaceAndNewLine: String { return self.trimmingCharacters(in: .whitespacesAndNewlines) }
    static let empty: String = ""
    
    static func isEmpty(_ string: String?, trimCharacters: CharacterSet = CharacterSet(charactersIn: "")) -> Bool {
        if string == nil { return true }
        return string!.trimmingCharacters(in: trimCharacters) == ""
    }
    
    func getRanges(of: String?) -> [NSRange]? {
        guard let ofString = of, String.isEmpty(ofString) == false else {
            return nil
        }

        do {
            let regex = try NSRegularExpression(pattern: ofString)
            return regex.matches(in: self, range: NSRange(location: 0, length: self.length)).map({ (textCheckingResult) -> NSRange in
                return textCheckingResult.range
            })
        } catch {
            let range = self.nsString.range(of: ofString)
            if range.location != NSNotFound {
                var ranges = [NSRange]()
                ranges.append(range)
                let remainString = self.nsString.substring(from: range.location + range.length)
                if let rangesNext = remainString.getRanges(of: ofString) {
                    ranges.append(contentsOf: rangesNext)
                }
                return ranges
            } else {
                return nil
            }
        }
    }

    func rangesOfString(_ ofString: String, options: NSString.CompareOptions = [], searchRange: Range<Index>? = nil ) -> [Range<Index>] {
        if let range = self.range(of: ofString, options: options, range: searchRange, locale: nil) {
            let nextRange: Range = range.upperBound..<self.endIndex
            return [range] + rangesOfString(ofString, searchRange: nextRange)
        }
        return []
    }
}
