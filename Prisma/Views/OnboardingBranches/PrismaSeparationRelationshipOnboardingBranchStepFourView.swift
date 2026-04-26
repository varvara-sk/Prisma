import SwiftUI

struct PrismaSeparationRelationshipOnboardingBranchStepFourView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private var prismaCinematicLatchedNucleiPartnerCurationGenuTwoColumnCurationLatchedChamber: [GridItem] {
        [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
        ]
    }

    var body: some View {
        let prismaUserSelectedCount = prismaRelationshipOnboardingFlowViewModel
            .prismaMutableUserRelationshipProfileSnapshot.prismaPostSeparationUserConflictPatternDescriptorTags.count
        let prismaPartnerSelectedCount = prismaRelationshipOnboardingFlowViewModel
            .prismaMutableUserRelationshipProfileSnapshot.prismaPostSeparationPartnerConflictPatternDescriptorTags.count
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .separationPartnerConflict
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .kerning(0.1)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .separationPickPatterns
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(3)
                VStack(alignment: .leading, spacing: 32) {
                    prismaConflictPatternSection(
                        title: "Как обычно реагировали вы?",
                        rows: PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei
                            .primalCinematicLatchedNucleiUserCinematicCurationConflictCurationLatchedGrid,
                        selectedLabels: prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .prismaPostSeparationUserConflictPatternDescriptorTags,
                        selectedCount: prismaUserSelectedCount,
                        toggleAction: { label in
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaAttemptPostSeparationUserNucleusLatchedChamberedTagToggleMutation(
                                    desiredCinematicLatchedNucleiUserCurationLabeledNucleiDescriptor: label
                                )
                        }
                    )
                    prismaConflictPatternSection(
                        title: "А как реагировал партнёр?",
                        rows: PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei
                            .primalCinematicLatchedNucleiExPartnerCinematicCurationConflictCurationLatchedGrid,
                        selectedLabels: prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .prismaPostSeparationPartnerConflictPatternDescriptorTags,
                        selectedCount: prismaPartnerSelectedCount,
                        toggleAction: { label in
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaAttemptPostSeparationCinematicDualCapPartnerNucleusLatchedChamberedTagToggleMutation(
                                    desiredCinematicLatchedNucleiPartnerCurationLabeledNucleiDescriptor: label
                                )
                        }
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 120)
        }
    }

    private func prismaConflictPatternSection(
        title: String,
        rows: [(prismaCinematicLatchedNucleiPrimaryCurationTitle: String, prismaCinematicLatchedNucleiSymbolName: String)],
        selectedLabels: [String],
        selectedCount: Int,
        toggleAction: @escaping (String) -> Void
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            LazyVGrid(
                columns: prismaCinematicLatchedNucleiPartnerCurationGenuTwoColumnCurationLatchedChamber,
                alignment: .leading,
                spacing: 10
            ) {
                ForEach(rows, id: \.prismaCinematicLatchedNucleiPrimaryCurationTitle) { row in
                    let label = row.prismaCinematicLatchedNucleiPrimaryCurationTitle
                    let selected = selectedLabels.contains(label)
                    let dimUnselected = selectedCount == 2 && !selected
                    Button {
                        toggleAction(label)
                    } label: {
                        VStack(alignment: .center, spacing: 8) {
                            Image(systemName: row.prismaCinematicLatchedNucleiSymbolName)
                                .font(.title2)
                            Text(label)
                                .font(.system(size: 15, weight: .medium, design: .default))
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                                .minimumScaleFactor(0.88)
                        }
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .frame(maxWidth: .infinity, minHeight: 96)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(
                                    selected
                                        ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.1)
                                        : PrismaColors.surface(prismaRuntimeActiveAppThemeComposition)
                                )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(
                                    PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(selected ? 0.9 : 0.22),
                                    lineWidth: selected ? 2 : 1
                                )
                        )
                    }
                    .buttonStyle(.plain)
                    .opacity(dimUnselected ? 0.42 : 1.0)
                }
            }
        }
    }
}
