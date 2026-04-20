import SwiftUI

struct PrismaApplicationSafetyBoundaryEducationScrollablePanelView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Environment(\.dismiss) private var prismaSheetDismissEnvironmentAction

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Prisma — это не психотерапия и не медицинская помощь. Приложение даёт размышления и формулировки, но не ставит диагнозов и не заменяет специалиста.")
                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .prismaComfortableMultilineReadableTextBlockModifierChain()
                    Text("Если есть угроза жизни или здоровью — звоните 112. При остром кризисе обратитесь к близким или в службы экстренной помощи в вашем регионе.")
                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .prismaComfortableMultilineReadableTextBlockModifierChain()
                    Text("Вы сами решаете, чем делиться в чате. Не передавайте чужие личные данные без согласия.")
                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .prismaComfortableMultilineReadableTextBlockModifierChain()
                }
                .padding(20)
            }
            .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
            .navigationTitle("Безопасность")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Готово") {
                        prismaSheetDismissEnvironmentAction()
                    }
                    .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                    .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                }
            }
        }
    }
}
