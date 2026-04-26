import Foundation
import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable, Sendable {
    case darkLavender = "darkLavender"
    case lightTranslucentLavender = "lightTranslucentLavender"

    var id: String { rawValue }

    var prismaDerivedPreferredAppleSystemColorSchemeValue: ColorScheme? {
        switch self {
        case .darkLavender:
            return .dark
        case .lightTranslucentLavender:
            return .light
        }
    }
}

private struct PrismaRuntimeActiveAppThemeCompositionKey: EnvironmentKey {
    static let defaultValue: AppTheme = .darkLavender
}

extension EnvironmentValues {
    var prismaRuntimeActiveAppThemeComposition: AppTheme {
        get { self[PrismaRuntimeActiveAppThemeCompositionKey.self] }
        set { self[PrismaRuntimeActiveAppThemeCompositionKey.self] = newValue }
    }
}

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

enum PrismaColors {
    static func background(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "161622"
            )
        case .lightTranslucentLavender:
            return prismaDashboardInsightsHIGCalmingOffWhiteCanvasChromaticNucleus()
        }
    }

    static func prismaDashboardInsightsHIGCalmingOffWhiteCanvasChromaticNucleus() -> Color {
        prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
            hexadecimalRGBLiteralWithoutNumberSignPrefix: "F9F9FB"
        )
    }

    static func prismaDashboardContextSwitcherPillMutedChromeFillNucleus() -> Color {
        prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
            hexadecimalRGBLiteralWithoutNumberSignPrefix: "F2F2F7"
        )
    }

    static func prismaDashboardHighContrastInteractivePillFillNucleus(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "232336"
            )
        case .lightTranslucentLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "F2F2F7"
            )
        }
    }

    static func prismaDashboardHighContrastInteractivePillTextNucleus(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "FFFFFF"
            )
        case .lightTranslucentLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "2D2D3A"
            )
        }
    }

    static func prismaDashboardInsightsAnxietyAreaGradientPastelLavenderTopNucleus() -> Color {
        prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
            hexadecimalRGBLiteralWithoutNumberSignPrefix: "E0E7FF"
        )
    }

    static func prismaDashboardWidenAdditiveSituationLavenderBathCtaCinematicFrostNucleus() -> Color {
        prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
            hexadecimalRGBLiteralWithoutNumberSignPrefix: "E0E7FF"
        )
    }

    static func surface(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "232336"
            )
        case .lightTranslucentLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "FFFFFF"
            )
        }
    }

    static func primary(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
            hexadecimalRGBLiteralWithoutNumberSignPrefix: "818CF8"
        )
    }

    static func accentGreen(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
            hexadecimalRGBLiteralWithoutNumberSignPrefix: "34D399"
        )
    }

    static func accentRed(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
            hexadecimalRGBLiteralWithoutNumberSignPrefix: "FB7185"
        )
    }

    static func textPrimary(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "FFFFFF"
            )
        case .lightTranslucentLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "2D2D3A"
            )
        }
    }

    static func textSecondary(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "94A3B8"
            )
        case .lightTranslucentLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "6B6B78"
            )
        }
    }

    static func prismaFormFieldMutedFillSurface(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "1E1E30"
            )
        case .lightTranslucentLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "EFEFF4"
            )
        }
    }

    static func prismaElevatedCardShadowColor(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return Color.black.opacity(0.32)
        case .lightTranslucentLavender:
            return prismaSwiftUIColorFromHexadecimalRGBLiteralWithoutNumberSignPrefix(
                hexadecimalRGBLiteralWithoutNumberSignPrefix: "2D2D3A"
            )
            .opacity(0.12)
        }
    }

    static func prismaProfileSectionCardWarmAmbientDropShadowChromaticBlend(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return Color.black.opacity(0.32)
        case .lightTranslucentLavender:
            return Color.black.opacity(0.05)
        }
    }

    static func prismaDashboardInsightsHIGNotionStyleCardDropShadowLuminanceFragment(_ prismaApplicationVisualThemeDescriptor: AppTheme) -> Color {
        switch prismaApplicationVisualThemeDescriptor {
        case .darkLavender:
            return Color.black.opacity(0.4)
        case .lightTranslucentLavender:
            return Color.black.opacity(0.04)
        }
    }
}

enum PrismaTypography {
    static let prismaPremiumScreenTitleRoundedBold = Font.system(.title2, design: .rounded).weight(.bold)
    static let prismaPrimaryTitleRoundedSemibold = Font.system(.title, design: .rounded).weight(.semibold)
    static let prismaSecondaryBodyRoundedRegular = Font.system(.body, design: .rounded)
    static let prismaCallToActionPrimaryEmphasisBodyRoundedSemibold = Font.system(.body, design: .rounded).weight(.semibold)
    static let prismaOnboardingLargeTitleRoundedBold = Font.system(.largeTitle, design: .rounded).weight(.bold)
    static let prismaOnboardingTitle2RoundedSemibold = Font.system(.title2, design: .rounded).weight(.semibold)
    static let prismaDashboardDecorativeEmojiDimensionalTitleRounded = Font.system(.title, design: .rounded)
    static let prismaOnboardingHeadlineRoundedMedium = Font.system(.headline, design: .rounded).weight(.medium)
    static let prismaOnboardingSubheadlineRoundedRegular = Font.system(.subheadline, design: .rounded)
    static let prismaOnboardingCaptionRoundedSecondary = Font.system(.caption, design: .rounded)
    static let prismaOnboardingFootnoteRoundedSecondary = Font.system(.footnote, design: .rounded)
    static let prismaNavigationBarInlineBackGlyphDimensionalRoundedSemibold = Font.system(size: 17, weight: .semibold, design: .rounded)
    static let prismaProfileRowLeadingOrnamentalSymbolDimensionalHeadlineRoundedSemibold = Font.system(
        size: 20,
        weight: .semibold,
        design: .rounded
    )
    static let prismaProfileRowTrailingDisclosureChevronDimensionalSubheadlineRoundedSemibold = Font.system(
        size: 14,
        weight: .semibold,
        design: .rounded
    )
    static let prismaCompactMenuInlineDisclosureChevronDimensionalCaptionRoundedSemibold = Font.system(
        size: 12,
        weight: .semibold,
        design: .rounded
    )
    static let prismaOnboardingGenderPickerEmojiDimensionalTitle1RoundedRegular = Font.system(size: 30, design: .rounded)
    static let prismaOnboardingGlobalModeRowEmojiDimensionalLargeTitleRoundedRegular = Font.system(size: 40, design: .rounded)
    static let prismaEmptyStateHeroOrnamentalSymbolDimensionalLargeTitleRoundedMedium = Font.system(
        size: 48,
        weight: .medium,
        design: .rounded
    )
}

enum PrismaDashboardInsightsHIGSurfaceTypography {
    static let screenHeroTitleDisplayNucleus = Font.system(.largeTitle, design: .default).weight(.bold)
    static let cardBlockTitleNucleus = Font.system(.title3, design: .default).weight(.semibold)
    static let bodyReadingPrimaryNucleus = Font.system(.body, design: .default)
    static let subheadlineDeemphasizedNucleus = Font.system(.subheadline, design: .default)
    static let calloutPillNucleus = Font.system(.callout, design: .default)
    static let footnoteDeemphasizedNucleus = Font.system(.footnote, design: .default)
    static let microCaptionAxisNucleus = Font.system(.caption, design: .default)
}

extension View {
    func prismaComfortableMultilineReadableTextBlockModifierChain() -> some View {
        multilineTextAlignment(.leading)
            .lineSpacing(4)
            .fixedSize(horizontal: false, vertical: true)
    }
}
