import SwiftUI

struct PrismaGlobalModeSelectionStepView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaGlobalModeVerticalCardDescriptorRows: [(GlobalMode, String, String, String)] = [
        (.separationLettingGo, "💔", "Расставание", "Пройти через боль и отпустить"),
        (.committedRelationshipCare, "❤️", "В отношениях", "Разобраться в конфликтах и улучшить связь"),
        (.datingDiscovery, "✨", "Знакомства", "Анализ мэтчей и свиданий"),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text("На каком этапе вы сейчас?")
                    .font(PrismaTypography.prismaOnboardingLargeTitleRoundedBold)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Это поможет Prisma настроить тональность анализа")
                    .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
                VStack(spacing: 14) {
                    ForEach(prismaGlobalModeVerticalCardDescriptorRows, id: \.0) { prismaDescriptorRow in
                        let prismaGlobalModeCase = prismaDescriptorRow.0
                        let prismaEmojiSymbol = prismaDescriptorRow.1
                        let prismaPrimaryLine = prismaDescriptorRow.2
                        let prismaSecondaryLine = prismaDescriptorRow.3
                        let prismaIsCardCurrentlySelectedFlag =
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.globalMode
                            == prismaGlobalModeCase
                        Button {
                            prismaRelationshipOnboardingFlowViewModel.prismaApplyGlobalModeSelectionMutation(prismaGlobalModeCase)
                        } label: {
                            HStack(alignment: .center, spacing: 16) {
                                Text(prismaEmojiSymbol)
                                    .font(.system(size: 40))
                                    .frame(width: 52, alignment: .center)
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(prismaPrimaryLine)
                                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                                        .foregroundStyle(PrismaColors.textPrimary)
                                        .multilineTextAlignment(.leading)
                                    Text(prismaSecondaryLine)
                                        .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                                        .foregroundStyle(PrismaColors.textSecondary)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer(minLength: 0)
                            }
                            .padding(18)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 22, style: .continuous)
                                    .fill(PrismaColors.surface)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 22, style: .continuous)
                                    .stroke(
                                        PrismaColors.primary.opacity(prismaIsCardCurrentlySelectedFlag ? 1.0 : 0.0),
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
