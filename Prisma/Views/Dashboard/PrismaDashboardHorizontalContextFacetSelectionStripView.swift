import SwiftUI

struct PrismaDashboardHorizontalContextFacetSelectionStripView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Binding var prismaDashboardSelectedContextFacetIdentifierBinding: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration
    let prismaActivePrimaryUserProfileSnapshotForLabelFabrication: UserProfile
    let prismaArchivedScenarioLedgerEntryCollection: [PrismaArchivedUserScenarioLedgerEntry]

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        VStack(alignment: .leading, spacing: 10) {
            Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardContextTitle
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
            )
            .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardContextBody
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
            )
            .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
            .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
            .multilineTextAlignment(.leading)
            .lineSpacing(4)
            .fixedSize(horizontal: false, vertical: true)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    prismaFabricateContextSelectionCapsuleButton(
                        userInterfaceActiveLanguage: language,
                        prismaLocalizedCapsuleTitle: prismaFabricateActivePrimaryContextCapsuleTitleLine(
                            userInterfaceActiveLanguage: language
                        ),
                        prismaSelectionTargetIdentifier: .activePrimaryUserProfileContextFacet
                    )
                    ForEach(prismaArchivedScenarioLedgerEntryCollection) { prismaLedgerEntry in
                        prismaFabricateContextSelectionCapsuleButton(
                            userInterfaceActiveLanguage: language,
                            prismaLocalizedCapsuleTitle: prismaFabricateArchivedContextCapsuleTitleLine(
                                userInterfaceActiveLanguage: language,
                                prismaLedgerEntry
                            ),
                            prismaSelectionTargetIdentifier: .archivedLedgerEmbeddedSnapshotContextFacet(prismaLedgerEntry)
                        )
                    }
                }
                .padding(.vertical, 2)
            }
        }
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

    private func prismaFabricateActivePrimaryContextCapsuleTitleLine(
        userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        let prismaModeLabel = prismaActivePrimaryUserProfileSnapshotForLabelFabrication.globalMode?
            .prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(
                userInterfaceActiveLanguage
            ) ?? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardNowPrefix
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        let now = PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardNowPrefix
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        return "\(now) · \(prismaModeLabel)"
    }

    private func prismaFabricateArchivedContextCapsuleTitleLine(
        userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration,
        _ prismaLedgerEntry: PrismaArchivedUserScenarioLedgerEntry
    ) -> String {
        let prismaModeLabel = prismaLedgerEntry.prismaEmbeddedUserProfileSnapshot.globalMode?
            .prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(
                userInterfaceActiveLanguage
            ) ?? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardSaved
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        let prismaShortDateFragment = prismaLedgerEntry.prismaScenarioCapturedTimestamp.formatted(date: .abbreviated, time: .omitted)
        return "\(prismaModeLabel) · \(prismaShortDateFragment)"
    }

    private func prismaFabricateContextSelectionCapsuleButton(
        userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration,
        prismaLocalizedCapsuleTitle: String,
        prismaSelectionTargetIdentifier: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration
    ) -> some View {
        let prismaIsCurrentlySelectedFlag = prismaDashboardSelectedContextFacetIdentifierBinding == prismaSelectionTargetIdentifier
        return Button {
            prismaDashboardSelectedContextFacetIdentifierBinding = prismaSelectionTargetIdentifier
        } label: {
            Text(prismaLocalizedCapsuleTitle)
                .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                .foregroundStyle(
                    prismaIsCurrentlySelectedFlag
                        ? PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition)
                        : PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition)
                )
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(
                    Capsule(style: .continuous)
                        .fill(
                            prismaIsCurrentlySelectedFlag
                                ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.35)
                                : PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.12)
                        )
                )
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(
                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(prismaIsCurrentlySelectedFlag ? 0.55 : 0.2),
                            lineWidth: 1
                        )
                )
        }
        .buttonStyle(.plain)
    }
}
