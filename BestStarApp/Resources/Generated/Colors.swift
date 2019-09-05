// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#205072"></span>
  /// Alpha: 100% <br/> (0x205072ff)
  internal static let blueApp = ColorName(rgbaValue: 0x205072ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#329d9c"></span>
  /// Alpha: 100% <br/> (0x329d9cff)
  internal static let greenApp = ColorName(rgbaValue: 0x329d9cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#56c596"></span>
  /// Alpha: 100% <br/> (0x56c596ff)
  internal static let greenBasicApp = ColorName(rgbaValue: 0x56c596ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#7be495"></span>
  /// Alpha: 100% <br/> (0x7be495ff)
  internal static let greenLight = ColorName(rgbaValue: 0x7be495ff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

// swiftlint:disable operator_usage_whitespace
internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
