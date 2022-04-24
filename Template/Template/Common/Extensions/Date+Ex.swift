//
//  Date+Ex.swift
//  Template
//
//  Created by Lam Nguyen on 4/24/22.
//

import Foundation

public extension Date {
    // "yyyy-MM-dd'T'HH:mm:ssZZZZZ", Locale(identifier: "en_US_POSIX")
    func toStringFormat8601() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }

    func toStringFormatRFC3339() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }

    func toString(format dateFormat: String, locale: Locale = Locale(identifier: "en_US"), timeZone: TimeZone? = nil) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = locale
        if timeZone != nil { dateFormatter.timeZone = timeZone }
        return dateFormatter.string(from: self)
    }

    func toStringJpTimeZone(format dateFormat: String) -> String {
        return self.toString(format: dateFormat, timeZone: TimeZone.jp)
    }

    var isFirstDayOfMonth: Bool {
        return Calendar.current.dateComponents(Set<Calendar.Component>([.day]), from: self).day == 1
    }

    var isLastDayOfMonth: Bool {
        return self.addingTimeInterval(24 * 60 * 60).isFirstDayOfMonth
    }

    var isFirstMonthOfYear: Bool {
        return Calendar.current.dateComponents(Set<Calendar.Component>([.month]), from: self).month == 1
    }

    var day: Int {
        get {
            return Calendar.current.dateComponents(Set<Calendar.Component>([.day]), from: self).day ?? 0
        }
        set {
            var dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: self)
            dateComponents.day = newValue
            guard let newDate = Calendar.current.date(from: dateComponents) else {
                return
            }
            self = newDate
        }
    }

    var month: Int {
        get {
            return Calendar.current.dateComponents(Set<Calendar.Component>([.month]), from: self).month ?? 0
        }
        set {
            var dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: self)
            dateComponents.month = newValue
            guard let newDate = Calendar.current.date(from: dateComponents) else {
                return
            }
            self = newDate
        }
    }

    var year: Int {
        get {
            return Calendar.current.dateComponents(Set<Calendar.Component>([.year]), from: self).year ?? 0
        }
        set {
            let offsetValue = newValue - self.year
            guard let newDate = Calendar.current.date(byAdding: Calendar.Component.year, value: offsetValue, to: self) else {
                return
            }
            self = newDate
        }
    }

    var second: Int {
        get {
            return Calendar.current.dateComponents(Set<Calendar.Component>([.second]), from: self).second ?? 0
        }
        set {
            var dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: self)
            dateComponents.second = newValue
            guard let newDate = Calendar.current.date(from: dateComponents) else {
                return
            }
            self = newDate
        }
    }

    var minute: Int {
        get {
            return Calendar.current.dateComponents(Set<Calendar.Component>([.minute]), from: self).minute ?? 0
        }
        set {
            var dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: self)
            dateComponents.minute = newValue
            guard let newDate = Calendar.current.date(from: dateComponents) else {
                return
            }
            self = newDate
        }
    }

    var hour: Int {
        get {
            return Calendar.current.dateComponents(Set<Calendar.Component>([.hour]), from: self).hour ?? 0
        }
        set {
            var dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: self)
            dateComponents.hour = newValue
            guard let newDate = Calendar.current.date(from: dateComponents) else {
                return
            }
            self = newDate
        }
    }

    func isEqualDateIgnoreTime(toDate: Date?) -> Bool {
        if let dateCompare = toDate {
            return self.day == dateCompare.day && self.month == dateCompare.month && self.year == dateCompare.year
        }
        return false
    }

    var isToday: Bool {
        return self.isEqualDateIgnoreTime(toDate: Date())
    }

    // interval must be evenly divided into 60. default is 0. min is 0, max is 30
    init(minuteInterval: Int, since date: Date = Date()) {
        self = date
        guard minuteInterval > 1 else { return }
        let minuteInterval = Int(date.minute / minuteInterval) * minuteInterval
        self.minute = minuteInterval
    }

    func addingMinutes(_ mins: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(mins * 60))
    }

    func addingHours(_ hours: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(hours * 60 * 60))
    }

    func addingDays(_ days: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(days * 24 * 60 * 60))
    }

    mutating func addMinutes(_ mins: Int) {
        self = self.addingTimeInterval(TimeInterval(mins * 60))
    }

    mutating func addHours(_ hours: Int) {
        self = self.addingTimeInterval(TimeInterval(hours * 60 * 60))
    }

    mutating func addDays(_ days: Int) {
        self = self.addingTimeInterval(TimeInterval(days * 24 * 60 * 60))
    }

    func daysIgnoreTimeSince(_ date: Date) -> Int {
        var calComponents = Calendar.current.dateComponents(in: TimeZone.current, from: date)
        calComponents.day = self.day
        calComponents.month = self.month
        calComponents.year = self.year
        let calDate = Calendar.current.date(from: calComponents) ?? self
        return Calendar.current.dateComponents([Calendar.Component.day], from: date, to: calDate).day ?? 0
    }
}

public extension TimeZone {
    init?(hoursFromGMT: Int) {
        self.init(secondsFromGMT: hoursFromGMT * 3600)
    }

    static var jp: TimeZone = TimeZone(hoursFromGMT: 9) ?? TimeZone.current
}

public extension Int {
    var toDateByTimestamp: Date {
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
}

public extension Int64 {
    var toDateByTimestamp: Date {
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
}
