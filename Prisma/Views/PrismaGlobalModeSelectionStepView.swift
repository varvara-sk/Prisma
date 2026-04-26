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
        let prismaSelectedMode = prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.globalMode
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 28) {
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .globalModeStageTitle
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                .font(PrismaTypography.prismaOnboardingLargeTitleRoundedBold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
                VStack(spacing: 12) {
                    ForEach(prismaGlobalModeSelectionOrderedCaseRow, id: \.self) { prismaGlobalModeCase in
                        let prismaIsCardCurrentlySelectedFlag =
                            prismaSelectedMode == prismaGlobalModeCase
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                prismaRelationshipOnboardingFlowViewModel.prismaApplyGlobalModeSelectionMutation(prismaGlobalModeCase)
                            }
                        } label: {
                            HStack(alignment: .center, spacing: 14) {
                                ZStack {
                                    Circle()
                                        .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.15))
                                        .frame(width: 44, height: 44)
                                    Image(systemName: prismaGlobalModeCase.prismaCinematicLatchedNucleiGlobalModeCardRowSFSymbolGlyph)
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                        .symbolRenderingMode(.monochrome)
                                        .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                }
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(
                                        GlobalMode
                                            .prismaCinematicLatchedNucleiGlobalModeCurationLatchedCardCurationLabeledMosaicNuclei(
                                                forMode: prismaGlobalModeCase,
                                                lineOnePrimaryTitleChamber: true,
                                                language
                                            )
                                    )
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
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
                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(3)
                                    .fixedSize(horizontal: false, vertical: true)
                                }
                                Spacer(minLength: 0)
                            }
                            .padding(.vertical, 14)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(
                                        prismaIsCardCurrentlySelectedFlag
                                            ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.05)
                                            : PrismaColors.surface(prismaRuntimeActiveAppThemeComposition)
                                    )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(
                                        PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(prismaIsCardCurrentlySelectedFlag ? 1.0 : 0.0),
                                        lineWidth: 2
                                    )
                            )
                            .shadow(
                                color: Color.black.opacity(prismaIsCardCurrentlySelectedFlag ? 0.03 : 0.05),
                                radius: 8,
                                x: 0,
                                y: 4
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .animation(.easeInOut(duration: 0.2), value: prismaSelectedMode)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 120)
        }
    }
}
