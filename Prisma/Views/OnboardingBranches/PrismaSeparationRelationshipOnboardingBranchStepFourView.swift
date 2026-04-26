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
            VStack(alignment: .leading, spacing: 22) {
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
                prismaConflictPatternSection(
                    title: "Как обычно реагировали вы?",
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
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }

    private func prismaConflictPatternSection(
        title: String,
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
                ForEach(PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei
                    .primalCinematicLatchedNucleiExPartnerCinematicCurationConflictCurationLatchedGrid, id: \.prismaCinematicLatchedNucleiPrimaryCurationTitle) { row in
                    let label = row.prismaCinematicLatchedNucleiPrimaryCurationTitle
                    let selected = selectedLabels.contains(label)
                    let dimUnselected = selectedCount == 2 && !selected
                    Button {
                        toggleAction(label)
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            Image(systemName: row.prismaCinematicLatchedNucleiSymbolName)
                                .font(.system(size: 18, weight: .semibold, design: .default))
                            Text(label)
                                .font(.system(size: 15, weight: .medium, design: .default))
                                .multilineTextAlignment(.leading)
                        }
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .padding(.vertical, 14)
                        .padding(.horizontal, 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
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
