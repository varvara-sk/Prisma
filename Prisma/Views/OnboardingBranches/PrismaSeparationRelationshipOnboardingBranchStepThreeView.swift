import SwiftUI

struct PrismaSeparationRelationshipOnboardingBranchStepThreeView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                Text("Как давно произошло расставание?")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .fixedSize(horizontal: false, vertical: true)
                TextField(
                    "Например: 2 недели назад или полгода",
                    text: Binding(
                        get: {
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.timeSinceBreakup
                        },
                        set: { prismaRelationshipOnboardingFlowViewModel.prismaApplyTimeSinceBreakupFreeformTextMutation($0) }
                    ),
                    axis: .vertical
                )
                .lineLimit(2...6)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }
}
