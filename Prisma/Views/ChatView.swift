import SwiftUI

struct ChatView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition

    var body: some View {
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 14) {
                Text("Чат")
                    .font(PrismaTypography.prismaPremiumScreenTitleRoundedBold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Контекст для ответов задаётся в профиле — здесь только диалог.")
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 20)
            .padding(.top, 24)
        }
        .onAppear {
            PrismaProductUsageTelemetrySignalRecorder.prismaIncrementOrdinalTallyForTelemetrySignal(
                .primaryChatConversationSurfaceDidAppear
            )
        }
    }
}
