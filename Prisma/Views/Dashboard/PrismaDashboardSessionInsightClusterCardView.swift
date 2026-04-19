import SwiftUI

struct PrismaDashboardSessionInsightClusterCardView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaSessionInsightPayload: InsightData

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Главные инсайты сессии")
                .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            VStack(alignment: .leading, spacing: 6) {
                Text("Текущий статус")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                Text(prismaSessionInsightPayload.currentConflictStatusNarrativeLine)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Выявленные триггеры")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                PrismaDashboardAdaptiveTagChipGridClusterView(
                    prismaTagLabelCollection: prismaSessionInsightPayload.userOwnedTriggerDescriptorTags
                )
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Красные флаги партнера")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                PrismaDashboardAdaptiveTagChipGridClusterView(
                    prismaTagLabelCollection: prismaSessionInsightPayload.partnerRedFlagDescriptorTags
                )
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Ошибки в коммуникации")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(prismaSessionInsightPayload.communicationMisalignmentBulletFragments, id: \.self) { prismaBulletLine in
                        HStack(alignment: .top, spacing: 10) {
                            Circle()
                                .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.85))
                                .frame(width: 6, height: 6)
                                .padding(.top, 7)
                            Text(prismaBulletLine)
                                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("План действий")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(prismaSessionInsightPayload.actionPlanChecklistItemTitles, id: \.self) { prismaChecklistTitle in
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "circle")
                                .font(.system(size: 18, weight: .regular))
                                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.9))
                                .padding(.top, 2)
                            Text(prismaChecklistTitle)
                                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
        }
        .prismaDashboardCardUniformSurfaceStyle()
    }
}

private struct PrismaDashboardAdaptiveTagChipGridClusterView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaTagLabelCollection: [String]

    private let prismaAdaptiveTagChipGridColumnLayout: [GridItem] = [
        GridItem(.adaptive(minimum: 104), spacing: 8, alignment: .leading),
    ]

    var body: some View {
        LazyVGrid(columns: prismaAdaptiveTagChipGridColumnLayout, alignment: .leading, spacing: 8) {
            ForEach(prismaTagLabelCollection, id: \.self) { prismaTagLabel in
                Text(prismaTagLabel)
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        Capsule(style: .continuous)
                            .fill(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition).opacity(0.2))
                    )
            }
        }
    }
}
