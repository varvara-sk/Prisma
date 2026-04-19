import SwiftUI

struct PrismaDatingDiscoveryOnboardingBranchStepFourRedFlagsView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Есть ли у вас «Красные флаги»?")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Опиши, что для тебя категорически неприемлемо")
                    .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
                TextField(
                    "Например: агрессия, ложь, неуважение к границам",
                    text: Binding(
                        get: {
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                .datingRedFlagsFreeformText
                        },
                        set: { prismaRelationshipOnboardingFlowViewModel.prismaApplyDatingRedFlagsFreeformTextMutation($0) }
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
