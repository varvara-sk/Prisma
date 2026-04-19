import SwiftUI

struct PrismaFriendshipSocialOnboardingBranchStepThreeSocialRoleView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaRoleTagGridColumnLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Кем вам приходится этот человек?")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                LazyVGrid(columns: prismaRoleTagGridColumnLayout, alignment: .leading, spacing: 10) {
                    ForEach(
                        PrismaOnboardingBranchTagCatalogDefinitions.prismaFriendshipSocialPeerRoleDescriptorLabels,
                        id: \.self
                    ) { prismaRoleLabel in
                        let prismaRoleSelectedFlag =
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.socialContext
                            == prismaRoleLabel
                        Button {
                            prismaRelationshipOnboardingFlowViewModel.prismaApplySocialPeerSingleRoleDescriptorSelectionMutation(
                                prismaRoleLabel
                            )
                        } label: {
                            Text(prismaRoleLabel)
                                .font(PrismaTypography.prismaOnboardingFootnoteRoundedSecondary)
                                .foregroundStyle(PrismaColors.textPrimary)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 14)
                                .padding(.horizontal, 12)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .fill(
                                            prismaRoleSelectedFlag
                                                ? PrismaColors.primary.opacity(0.22)
                                                : PrismaColors.surface
                                        )
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                                        .stroke(
                                            PrismaColors.primary.opacity(prismaRoleSelectedFlag ? 1.0 : 0.35),
                                            lineWidth: prismaRoleSelectedFlag ? 2 : 1
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
