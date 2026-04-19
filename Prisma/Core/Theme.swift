import Foundation
import SwiftUI

private func prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
    hexadecimalRGBLiteralWithoutNumberSignPrefix: String
) -> Color {
    var sanitizedHexadecimalString = hexadecimalRGBLiteralWithoutNumberSignPrefix.trimmingCharacters(in: .whitespacesAndNewlines)
    if sanitizedHexadecimalString.hasPrefix("#") {
        sanitizedHexadecimalString.removeFirst()
    }
    guard sanitizedHexadecimalString.count == 6 else {
        return Color(red: 0, green: 0, blue: 0)
    }
    var rgbUInt64Value: UInt64 = 0
    let scanner = Scanner(string: sanitizedHexadecimalString)
    guard scanner.scanHexInt64(&rgbUInt64Value) else {
        return Color(red: 0, green: 0, blue: 0)
    }
    let redChannelDoubleValue = Double((rgbUInt64Value >> 16) & 0xFF) / 255.0
    let greenChannelDoubleValue = Double((rgbUInt64Value >> 8) & 0xFF) / 255.0
    let blueChannelDoubleValue = Double(rgbUInt64Value & 0xFF) / 255.0
    return Color(red: redChannelDoubleValue, green: greenChannelDoubleValue, blue: blueChannelDoubleValue)
}

struct PrismaColors {
    static let background = prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
        hexadecimalRGBLiteralWithoutNumberSignPrefix: "0F172A"
    )
    static let surface = prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
        hexadecimalRGBLiteralWithoutNumberSignPrefix: "1E293B"
    )
    static let primary = prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
        hexadecimalRGBLiteralWithoutNumberSignPrefix: "818CF8"
    )
    static let accentGreen = prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
        hexadecimalRGBLiteralWithoutNumberSignPrefix: "34D399"
    )
    static let accentRed = prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
        hexadecimalRGBLiteralWithoutNumberSignPrefix: "FB7185"
    )
    static let textPrimary = prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
        hexadecimalRGBLiteralWithoutNumberSignPrefix: "FFFFFF"
    )
    static let textSecondary = prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
        hexadecimalRGBLiteralWithoutNumberSignPrefix: "94A3B8"
    )
}

enum PrismaTypography {
    static let prismaPrimaryTitleRoundedSemibold = Font.system(.title, design: .rounded).weight(.semibold)
    static let prismaSecondaryBodyRoundedRegular = Font.system(.body, design: .rounded)
    static let prismaOnboardingLargeTitleRoundedBold = Font.system(.largeTitle, design: .rounded).weight(.bold)
    static let prismaOnboardingTitle2RoundedSemibold = Font.system(.title2, design: .rounded).weight(.semibold)
    static let prismaOnboardingHeadlineRoundedMedium = Font.system(.headline, design: .rounded).weight(.medium)
    static let prismaOnboardingSubheadlineRoundedRegular = Font.system(.subheadline, design: .rounded)
    static let prismaOnboardingCaptionRoundedSecondary = Font.system(.caption, design: .rounded)
    static let prismaOnboardingFootnoteRoundedSecondary = Font.system(.footnote, design: .rounded)
}
