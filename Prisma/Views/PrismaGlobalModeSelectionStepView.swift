import SwiftUI

struct PrismaGlobalModeSelectionStepView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private var prismaGlobalModeSelectionOrderedCaseRow: [GlobalMode] {
        [
            .separationLettingGo,
            .committedRelationshipCare,
            .datingDiscovery,
            .communicationFriendshipAndPeers,
        ]
    }

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .globalModeStageTitle
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                .font(PrismaTypography.prismaOnboardingLargeTitleRoundedBold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
                VStack(spacing: 14) {
                    ForEach(prismaGlobalModeSelectionOrderedCaseRow, id: \.self) { prismaGlobalModeCase in
                        let prismaIsCardCurrentlySelectedFlag =
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.globalMode
                            == prismaGlobalModeCase
                        Button {
                            prismaRelationshipOnboardingFlowViewModel.prismaApplyGlobalModeSelectionMutation(prismaGlobalModeCase)
                        } label: {
                            HStack(alignment: .center, spacing: 16) {
                                Text(prismaGlobalModeCase.prismaCinematicLatchedNucleiGlobalModeCardRowEmojiGlyph)
                                    .font(PrismaTypography.prismaOnboardingGlobalModeRowEmojiDimensionalLargeTitleRoundedRegular)
                                    .frame(width: 52, alignment: .center)
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(
                                        GlobalMode
                                            .prismaCinematicLatchedNucleiGlobalModeCurationLatchedCardCurationLabeledMosaicNuclei(
                                                forMode: prismaGlobalModeCase,
                                                lineOnePrimaryTitleChamber: true,
                                                language
                                            )
                                    )
                                    .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                    .multilineTextAlignment(.leading)
                                    Text(
                                        GlobalMode
                                            .prismaCinematicLatchedNucleiGlobalModeCurationLatchedCardCurationLabeledMosaicNuclei(
                                                forMode: prismaGlobalModeCase,
                                                lineOnePrimaryTitleChamber: false,
                                                language
                                            )
                                    )
                                    .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(4)
                                    .fixedSize(horizontal: false, vertical: true)
                                }
                                Spacer(minLength: 0)
                            }
                            .padding(18)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 22, style: .continuous)
                                    .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 22, style: .continuous)
                                    .stroke(
                                        PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(prismaIsCardCurrentlySelectedFlag ? 1.0 : 0.0),
                                        lineWidth: 2
                                    )
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }
}
