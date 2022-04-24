//
//  String+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/25/22.
//

import Foundation

public extension String {
    func toDate(formatter: DateFormatter) -> Date? {
        return formatter.date(from: self)
    }

    func toDate(format dateFormat: String, locale: Locale? = nil, timeZone: TimeZone? = nil) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        if let locale = locale { dateFormatter.locale = locale }
        if let timeZone = timeZone { dateFormatter.timeZone = timeZone }
        return dateFormatter.date(from: self)
    }

    func toDateFormat8601() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }

    func toDateFormatRFC3339() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
}
