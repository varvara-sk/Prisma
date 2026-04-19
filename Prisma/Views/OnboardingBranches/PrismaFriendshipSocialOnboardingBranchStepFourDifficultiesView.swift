import SwiftUI

struct PrismaFriendshipSocialOnboardingBranchStepFourDifficultiesView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Сложности в общении")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                TextField(
                    "Например: он постоянно меня перебивает",
                    text: Binding(
                        get: {
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                .friendshipCommunicationDifficultiesFreeformText
                        },
                        set: {
                            prismaRelationshipOnboardingFlowViewModel.prismaApplyFriendshipCommunicationDifficultiesFreeformTextMutation(
                                $0
                            )
                        }
                    ),
                    axis: .vertical
                )
                .lineLimit(4...12)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textPrimary)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PrismaColors.surface)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(PrismaColors.primary.opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }
}
