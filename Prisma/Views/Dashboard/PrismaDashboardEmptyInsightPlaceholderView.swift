import SwiftUI

struct PrismaDashboardEmptyInsightPlaceholderView: View {
    let prismaNavigateToChatConversationTabAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "sparkles")
                .font(.system(size: 48, weight: .medium))
                .foregroundStyle(PrismaColors.primary)
                .symbolRenderingMode(.hierarchical)
            Text("Здесь появятся инсайты после вашего первого анализа")
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            Button(action: prismaNavigateToChatConversationTabAction) {
                Text("Начать разбор")
                    .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(PrismaColors.primary)
                    )
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
