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
        let prismaCinematicLatchedNucleiSelectedCurationNucleiCount = prismaRelationshipOnboardingFlowViewModel
            .prismaMutableUserRelationshipProfileSnapshot.partnerConflictStyleDescriptorTags.count
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
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
                LazyVGrid(
                    columns: prismaCinematicLatchedNucleiPartnerCurationGenuTwoColumnCurationLatchedChamber,
                    alignment: .leading,
                    spacing: 10
                ) {
                    ForEach(PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei
                        .primalCinematicLatchedNucleiExPartnerCinematicCurationConflictCurationLatchedGrid, id: \.prismaCinematicLatchedNucleiPrimaryCurationTitle) { row in
                        let label = row.prismaCinematicLatchedNucleiPrimaryCurationTitle
                        let prismaCinematicLatchedNucleiTagCurationNucleiSelectedChamber = prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .partnerConflictStyleDescriptorTags
                            .contains(label)
                        let prismaCinematicLatchedNucleiDimUnselectedCurationNucleiChamber = prismaCinematicLatchedNucleiSelectedCurationNucleiCount
                            == 2
                            && !prismaCinematicLatchedNucleiTagCurationNucleiSelectedChamber
                        Button {
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaAttemptPostSeparationCinematicDualCapPartnerNucleusLatchedChamberedTagToggleMutation(
                                    desiredCinematicLatchedNucleiPartnerCurationLabeledNucleiDescriptor: label
                                )
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
                                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                                prismaCinematicLatchedNucleiTagCurationNucleiSelectedChamber ? 0.9 : 0.22
                                            ),
                                            lineWidth: prismaCinematicLatchedNucleiTagCurationNucleiSelectedChamber ? 2 : 1
                                        )
                                )
                        }
                        .buttonStyle(.plain)
                        .opacity(prismaCinematicLatchedNucleiDimUnselectedCurationNucleiChamber ? 0.42 : 1.0)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }
}
