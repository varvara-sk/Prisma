import SwiftUI

struct PrismaDashboardPairDynamicsCompactCardView: View {
    let prismaPairDynamicsNarrativeBody: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Динамика пары")
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textPrimary)
            HStack(alignment: .top, spacing: 12) {
                Text("🎭")
                    .font(.system(size: 28))
                Text(prismaPairDynamicsNarrativeBody)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .prismaDashboardCardUniformSurfaceStyle()
    }
}
