import SwiftUI

struct PrismaDashboardHIGCinematicNucleusContextualSituationPillLatchedMenuDropDownChromaticControlView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Binding var prismaDashboardLatchedContextFacetNucleusSelectionBinding: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration
    let prismaHydratedLatchedActiveUserProfileNucleusSnapshot: UserProfile
    let prismaArchivedLatchedScenarioNucleusLedgerChamberCollection: [PrismaArchivedUserScenarioLedgerEntry]
    let prismaSituationPickerTapAction: () -> Void

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        let prismaCinematicLatchedPillNucleusTitleChamber = prismaLatchedCinematicNucleusSituationPillNucleusDisplayTitleLineExcerpt(
            userInterfaceActiveLanguage: language
        )
        Button(action: prismaSituationPickerTapAction) {
            HStack(alignment: .center, spacing: 6) {
                Text(
                    PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .dashboardSituationPillPrefix
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                        + prismaCinematicLatchedPillNucleusTitleChamber
                )
                .font(PrismaDashboardInsightsHIGSurfaceTypography.subheadlineDeemphasizedNucleus)
                .foregroundStyle(PrismaColors.prismaDashboardHighContrastInteractivePillTextNucleus(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
                Image(systemName: "chevron.down")
                    .font(.system(size: 11, weight: .bold, design: .default))
                    .foregroundStyle(PrismaColors.prismaDashboardHighContrastInteractivePillTextNucleus(prismaRuntimeActiveAppThemeComposition))
            }
            .lineSpacing(5)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule(style: .continuous)
                    .fill(PrismaColors.prismaDashboardHighContrastInteractivePillFillNucleus(prismaRuntimeActiveAppThemeComposition))
            )
        }
        .buttonStyle(.plain)
    }

    private func prismaLatchedCinematicNucleusSituationPillNucleusDisplayTitleLineExcerpt(
        userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch prismaDashboardLatchedContextFacetNucleusSelectionBinding {
        case .activePrimaryUserProfileContextFacet:
            return prismaHydratedLatchedActiveUserProfileNucleusSnapshot.globalMode?
                .prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(userInterfaceActiveLanguage)
                ?? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardNowPrefix
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        case .archivedLedgerEmbeddedSnapshotContextFacet(let prismaLedgerNucleusChamber):
            return prismaLedgerNucleusChamber.prismaEmbeddedUserProfileSnapshot.globalMode?
                .prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(userInterfaceActiveLanguage)
                ?? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardSaved
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        }
    }

    private func prismaLatchedCinematicNucleusPrimaryArchiveNucleusMenuLabeledExcerptChamber(
        userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration,
        isCinematicLatchedNucleusMarkSelected: Bool
    ) -> String {
        let descriptor = prismaHydratedLatchedActiveUserProfileNucleusSnapshot.globalMode?
            .prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(userInterfaceActiveLanguage) ?? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardNowPrefix
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        let mark = isCinematicLatchedNucleusMarkSelected ? "✓ " : ""
        let nowLabel = PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardNowPrefix
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        return "\(mark)\(nowLabel) — \(descriptor)"
    }

    private func prismaLatchedCinematicNucleusLedgerChamberMatchesCurrentSelectionChamber(
        _ prismaLedgerNucleusChamber: PrismaArchivedUserScenarioLedgerEntry
    ) -> Bool {
        if case .archivedLedgerEmbeddedSnapshotContextFacet(
            let prismaCinematicLatchedIsolatedNucleusLedgerChamber
        ) = prismaDashboardLatchedContextFacetNucleusSelectionBinding {
            return prismaCinematicLatchedIsolatedNucleusLedgerChamber.id == prismaLedgerNucleusChamber.id
        }
        return false
    }

    private func prismaLatchedCinematicNucleusArchivedNucleusMenuLabeledExcerptChamber(
        userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration,
        prismaLedgerNucleusChamber: PrismaArchivedUserScenarioLedgerEntry,
        isCinematicLatchedNucleusMarkSelected: Bool
    ) -> String {
        let label = prismaLedgerNucleusChamber.prismaEmbeddedUserProfileSnapshot.globalMode?
            .prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(userInterfaceActiveLanguage)
            ?? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardSaved
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        let date = prismaLedgerNucleusChamber.prismaScenarioCapturedTimestamp.formatted(date: .abbreviated, time: .omitted)
        let mark = isCinematicLatchedNucleusMarkSelected ? "✓ " : ""
        return "\(mark)\(label) · \(date)"
    }
}
