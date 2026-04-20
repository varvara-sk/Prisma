import SwiftUI

struct PrismaDashboardPairDynamicsCompactCardView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaPairDynamicsSectionLocalizedTitle: String
    let prismaPairDynamicsNarrativeBody: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(prismaPairDynamicsSectionLocalizedTitle)
                .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            HStack(alignment: .top, spacing: 12) {
                Text("🎭")
                    .font(PrismaTypography.prismaDashboardDecorativeEmojiDimensionalTitleRounded)
                Text(prismaPairDynamicsNarrativeBody)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .prismaDashboardCardUniformSurfaceStyle()
    }
}
