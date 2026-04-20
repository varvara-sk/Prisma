import SwiftUI

struct PrismaGlobalModeSelectionStepView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaGlobalModeVerticalCardDescriptorRows: [(GlobalMode, String, String, String)] = [
        (.separationLettingGo, "💔", "Расставание", "Пройти через боль и отпустить"),
        (.committedRelationshipCare, "❤️", "В отношениях", "Разобраться в конфликтах и улучшить связь"),
        (.datingDiscovery, "✨", "Знакомства (Свидания)", "Анализ мэтчей и свиданий"),
        (.communicationFriendshipAndPeers, "🤝", "Общение и Дружба", "Коллеги, друзья, семья"),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text("На каком этапе вы сейчас?")
                    .font(PrismaTypography.prismaOnboardingLargeTitleRoundedBold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
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
                                    .font(PrismaTypography.prismaOnboardingGlobalModeRowEmojiDimensionalLargeTitleRoundedRegular)
                                    .frame(width: 52, alignment: .center)
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(prismaPrimaryLine)
                                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                        .multilineTextAlignment(.leading)
                                    Text(prismaSecondaryLine)
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
