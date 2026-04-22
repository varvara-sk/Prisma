import SwiftUI

struct PrismaDashboardHIGCinematicNucleusContextualSituationPillLatchedMenuDropDownChromaticControlView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Binding var prismaDashboardLatchedContextFacetNucleusSelectionBinding: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration
    let prismaHydratedLatchedActiveUserProfileNucleusSnapshot: UserProfile
    let prismaArchivedLatchedScenarioNucleusLedgerChamberCollection: [PrismaArchivedUserScenarioLedgerEntry]

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        let prismaCinematicLatchedPillNucleusTitleChamber = prismaLatchedCinematicNucleusSituationPillNucleusDisplayTitleLineExcerpt(
            userInterfaceActiveLanguage: language
        )
        Menu {
            Button {
                prismaDashboardLatchedContextFacetNucleusSelectionBinding = .activePrimaryUserProfileContextFacet
            } label: {
                Text(
                    prismaLatchedCinematicNucleusPrimaryArchiveNucleusMenuLabeledExcerptChamber(
                        userInterfaceActiveLanguage: language,
                        isCinematicLatchedNucleusMarkSelected: prismaDashboardLatchedContextFacetNucleusSelectionBinding
                            == .activePrimaryUserProfileContextFacet
                    )
                )
            }
            ForEach(prismaArchivedLatchedScenarioNucleusLedgerChamberCollection) { prismaLedgerNucleusChamber in
                Button {
                    prismaDashboardLatchedContextFacetNucleusSelectionBinding = .archivedLedgerEmbeddedSnapshotContextFacet(
                        prismaLedgerNucleusChamber
                    )
                } label: {
                    Text(
                        prismaLatchedCinematicNucleusArchivedNucleusMenuLabeledExcerptChamber(
                            userInterfaceActiveLanguage: language,
                            prismaLedgerNucleusChamber: prismaLedgerNucleusChamber,
                            isCinematicLatchedNucleusMarkSelected: prismaLatchedCinematicNucleusLedgerChamberMatchesCurrentSelectionChamber(
                                prismaLedgerNucleusChamber
                            )
                        )
                    )
                }
            }
        } label: {
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                (Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardSituationPillPrefix
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                ) + Text(prismaCinematicLatchedPillNucleusTitleChamber) + Text(verbatim: " \u{25BE}"))
                .font(PrismaDashboardInsightsHIGSurfaceTypography.subheadlineDeemphasizedNucleus)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
            }
            .lineSpacing(5)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule(style: .continuous)
                    .fill(PrismaColors.prismaDashboardContextSwitcherPillMutedChromeFillNucleus())
            )
        }
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
