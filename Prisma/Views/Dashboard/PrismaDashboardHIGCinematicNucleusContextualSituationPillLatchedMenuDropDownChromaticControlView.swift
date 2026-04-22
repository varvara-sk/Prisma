import SwiftUI

struct PrismaDashboardHIGCinematicNucleusContextualSituationPillLatchedMenuDropDownChromaticControlView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Binding var prismaDashboardLatchedContextFacetNucleusSelectionBinding: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration
    let prismaHydratedLatchedActiveUserProfileNucleusSnapshot: UserProfile
    let prismaArchivedLatchedScenarioNucleusLedgerChamberCollection: [PrismaArchivedUserScenarioLedgerEntry]

    var body: some View {
        let prismaCinematicLatchedPillNucleusTitleChamber = prismaLatchedCinematicNucleusSituationPillNucleusDisplayTitleLineExcerpt()
        Menu {
            Button {
                prismaDashboardLatchedContextFacetNucleusSelectionBinding = .activePrimaryUserProfileContextFacet
            } label: {
                Text(
                    prismaLatchedCinematicNucleusPrimaryArchiveNucleusMenuLabeledExcerptChamber(
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
                (Text("Ситуация: ") + Text(prismaCinematicLatchedPillNucleusTitleChamber) + Text(verbatim: " \u{25BE}"))
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

    private func prismaLatchedCinematicNucleusSituationPillNucleusDisplayTitleLineExcerpt() -> String {
        switch prismaDashboardLatchedContextFacetNucleusSelectionBinding {
        case .activePrimaryUserProfileContextFacet:
            return prismaHydratedLatchedActiveUserProfileNucleusSnapshot.globalMode?
                .prismaCompactRussianScenarioDescriptorLabel
                ?? "Сейчас"
        case .archivedLedgerEmbeddedSnapshotContextFacet(let prismaLedgerNucleusChamber):
            return prismaLedgerNucleusChamber.prismaEmbeddedUserProfileSnapshot.globalMode?
                .prismaCompactRussianScenarioDescriptorLabel
                ?? "Сохранено"
        }
    }

    private func prismaLatchedCinematicNucleusPrimaryArchiveNucleusMenuLabeledExcerptChamber(
        isCinematicLatchedNucleusMarkSelected: Bool
    ) -> String {
        let descriptor = prismaHydratedLatchedActiveUserProfileNucleusSnapshot.globalMode?
            .prismaCompactRussianScenarioDescriptorLabel ?? "Сейчас"
        let mark = isCinematicLatchedNucleusMarkSelected ? "✓ " : ""
        return "\(mark)Сейчас — \(descriptor)"
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
        prismaLedgerNucleusChamber: PrismaArchivedUserScenarioLedgerEntry,
        isCinematicLatchedNucleusMarkSelected: Bool
    ) -> String {
        let label = prismaLedgerNucleusChamber.prismaEmbeddedUserProfileSnapshot.globalMode?
            .prismaCompactRussianScenarioDescriptorLabel
            ?? "Сохранено"
        let date = prismaLedgerNucleusChamber.prismaScenarioCapturedTimestamp.formatted(date: .abbreviated, time: .omitted)
        let mark = isCinematicLatchedNucleusMarkSelected ? "✓ " : ""
        return "\(mark)\(label) · \(date)"
    }
}
