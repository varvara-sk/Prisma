import SwiftUI

struct PrismaDashboardEmptyInsightPlaceholderView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaNavigateToChatConversationTabAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "sparkles")
                .font(PrismaTypography.prismaEmptyStateHeroOrnamentalSymbolDimensionalLargeTitleRoundedMedium)
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                .symbolRenderingMode(.hierarchical)
            Text(
                "После первого разбора здесь появятся динамика тревоги, главные инсайты сессии и план действий. Начните с чата — опишите ситуацию своими словами."
            )
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 24)
            Button(action: prismaNavigateToChatConversationTabAction) {
                Text("Начать разбор")
                    .font(PrismaTypography.prismaCallToActionPrimaryEmphasisBodyRoundedSemibold)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                    )
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
