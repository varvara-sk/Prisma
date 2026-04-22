import SwiftUI

struct PrismaDashboardCompactActiveUserIdentityRibbonCardView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaActiveUserProfileSnapshotForIdentityRibbon: UserProfile

    private func prismaCondensedIdentityRibbonNarrativeLine(
        userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        var prismaFragmentAccumulator = [String]()
        let prismaTrimmedCallsign = prismaActiveUserProfileSnapshotForIdentityRibbon.prismaPreferredCallsignForUserInterfaceDisplay
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !prismaTrimmedCallsign.isEmpty {
            prismaFragmentAccumulator.append(prismaTrimmedCallsign)
        }
        let prismaTrimmedAge = prismaActiveUserProfileSnapshotForIdentityRibbon.userAgeFreeformInputText
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !prismaTrimmedAge.isEmpty {
            prismaFragmentAccumulator.append(
                PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardIdentityAgeNarrativePrefix
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
                    + prismaTrimmedAge
            )
        }
        let prismaGenderNarrativeFragment = prismaCinematicLatchedNucleiGenderRibbonNarrativeMosaicLabeledCurationExcerpt(
            userInterfaceActiveLanguage: userInterfaceActiveLanguage
        )
        if !prismaGenderNarrativeFragment.isEmpty {
            prismaFragmentAccumulator.append(prismaGenderNarrativeFragment)
        }
        if prismaFragmentAccumulator.isEmpty {
            return PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardIdentityRibbonEmpty
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        }
        return prismaFragmentAccumulator.joined(separator: " · ")
    }

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        VStack(alignment: .leading, spacing: 8) {
            Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardAboutYou
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
            )
            .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            Text(prismaCondensedIdentityRibbonNarrativeLine(userInterfaceActiveLanguage: language))
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
        .shadow(
            color: PrismaColors.prismaElevatedCardShadowColor(prismaRuntimeActiveAppThemeComposition),
            radius: prismaRuntimeActiveAppThemeComposition == .lightTranslucentLavender ? 10 : 14,
            x: 0,
            y: prismaRuntimeActiveAppThemeComposition == .lightTranslucentLavender ? 4 : 8
        )
    }

    private func prismaCinematicLatchedNucleiGenderRibbonNarrativeMosaicLabeledCurationExcerpt(
        userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        let prismaGenderLabel = prismaActiveUserProfileSnapshotForIdentityRibbon.userGender
        if prismaGenderLabel == "Не указан" {
            return ""
        }
        if prismaGenderLabel == "Женский" {
            return PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardIdentityGenderFemaleNarrative
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        }
        if prismaGenderLabel == "Мужской" {
            return PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardIdentityGenderMaleNarrative
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        }
        if prismaGenderLabel == "Другое" {
            return PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardIdentityGenderOtherNarrative
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        }
        return prismaGenderLabel.lowercased()
    }
}
