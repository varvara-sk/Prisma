import SwiftUI

struct PrismaDatingDiscoveryOnboardingBranchStepThreeTraitsView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaTraitGridColumnLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Что для вас самое важное в будущем партнере?")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .fixedSize(horizontal: false, vertical: true)
                Text("Выбери ровно 3 приоритета")
                    .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .fixedSize(horizontal: false, vertical: true)
                LazyVGrid(columns: prismaTraitGridColumnLayout, alignment: .leading, spacing: 10) {
                    ForEach(
                        PrismaOnboardingBranchTagCatalogDefinitions.prismaDatingFuturePartnerPriorityTraitPool,
                        id: \.self
                    ) { prismaTraitLabel in
                        let prismaSelectedFlag =
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.topDesiredTraits
                            .contains(prismaTraitLabel)
                        let prismaTripleLockEngagedFlag =
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.topDesiredTraits
                            .count >= 3
                        let prismaDimmedUnselectedTraitFlag = prismaTripleLockEngagedFlag && !prismaSelectedFlag
                        Button {
                            prismaRelationshipOnboardingFlowViewModel.prismaApplyDatingPriorityTripleTraitSelectionMutation(
                                prismaTraitLabel
                            )
                        } label: {
                            Text(prismaTraitLabel)
                                .font(PrismaTypography.prismaOnboardingFootnoteRoundedSecondary)
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 10)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(
                                            prismaSelectedFlag
                                                ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.22)
                                                : PrismaColors.surface(prismaRuntimeActiveAppThemeComposition)
                                        )
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .stroke(
                                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(prismaSelectedFlag ? 1.0 : 0.35),
                                            lineWidth: prismaSelectedFlag ? 2 : 1
                                        )
                                )
                                .opacity(prismaDimmedUnselectedTraitFlag ? 0.42 : 1.0)
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
