import SwiftUI

struct AnalyzerView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition

    var body: some View {
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 14) {
                Text("Анализатор")
                    .font(PrismaTypography.prismaPremiumScreenTitleRoundedBold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Text(
                    "Здесь будет разбор текста: тон, повторяющиеся темы, формулировки — отдельно от чата и дашборда по ситуации."
                )
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
                .analyticalAnalyzerWorkspaceSurfaceDidAppear
            )
        }
    }
}
