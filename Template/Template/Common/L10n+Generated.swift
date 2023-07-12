// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Cancel
  internal static let cancel = L10n.tr("Localizable", "cancel", fallback: "Cancel")
  /// Ok
  internal static let ok = L10n.tr("Localizable", "ok", fallback: "Ok")
  internal enum Alert {
    internal enum Common {
      /// alert
      internal static let title = L10n.tr("Localizable", "alert.common.title", fallback: "alert")
    }
  }
  internal enum Login {
    /// Login
    internal static let title = L10n.tr("Localizable", "login.title", fallback: "Login")
  }
  internal enum Profile {
    /// Profile
    internal static let title = L10n.tr("Localizable", "profile.title", fallback: "Profile")
  }
  internal enum Userdetails {
    /// User Details
    internal static let title = L10n.tr("Localizable", "userdetails.title", fallback: "User Details")
  }
  internal enum Users {
    /// Users
    internal static let title = L10n.tr("Localizable", "users.title", fallback: "Users")
  }
  internal enum Watchlist {
    /// Watch List
    internal static let title = L10n.tr("Localizable", "watchlist.title", fallback: "Watch List")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
