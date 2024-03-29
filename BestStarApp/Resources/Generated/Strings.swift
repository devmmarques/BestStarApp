// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// BestStarApp
  internal static let bestStarApp = L10n.tr("Localizable", "BestStarApp")
  /// Não foi possível carregar a lista de Repositórios
  internal static let errorInternetDescription = L10n.tr("Localizable", "errorInternetDescription")
  /// Sem conexão com internet
  internal static let errorInternetTitle = L10n.tr("Localizable", "errorInternetTitle")
  /// Não foi possivel carregar a lista de Repositórios. Por favor, tente mais tarde.
  internal static let errorUnexpectedDescription = L10n.tr("Localizable", "errorUnexpectedDescription")
  /// Erro inesperado
  internal static let errorUnexpectedTitle = L10n.tr("Localizable", "errorUnexpectedTitle")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
