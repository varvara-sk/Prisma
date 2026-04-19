import SwiftUI

struct PrismaDashboardSessionInsightClusterCardView: View {
    let prismaSessionInsightPayload: InsightData

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Главные инсайты сессии")
                .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                .foregroundStyle(PrismaColors.textPrimary)
            VStack(alignment: .leading, spacing: 6) {
                Text("Текущий статус")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary)
                Text(prismaSessionInsightPayload.currentConflictStatusNarrativeLine)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Выявленные триггеры")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary)
                PrismaDashboardAdaptiveTagChipGridClusterView(
                    prismaTagLabelCollection: prismaSessionInsightPayload.userOwnedTriggerDescriptorTags
                )
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Красные флаги партнера")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary)
                PrismaDashboardAdaptiveTagChipGridClusterView(
                    prismaTagLabelCollection: prismaSessionInsightPayload.partnerRedFlagDescriptorTags
                )
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Ошибки в коммуникации")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary)
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(prismaSessionInsightPayload.communicationMisalignmentBulletFragments, id: \.self) { prismaBulletLine in
                        HStack(alignment: .top, spacing: 10) {
                            Circle()
                                .fill(PrismaColors.primary.opacity(0.85))
                                .frame(width: 6, height: 6)
                                .padding(.top, 7)
                            Text(prismaBulletLine)
                                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                .foregroundStyle(PrismaColors.textPrimary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("План действий")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(prismaSessionInsightPayload.actionPlanChecklistItemTitles, id: \.self) { prismaChecklistTitle in
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "circle")
                                .font(.system(size: 18, weight: .regular))
                                .foregroundStyle(PrismaColors.primary.opacity(0.9))
                                .padding(.top, 2)
                            Text(prismaChecklistTitle)
                                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                .foregroundStyle(PrismaColors.textPrimary)
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
    let prismaTagLabelCollection: [String]

    private let prismaAdaptiveTagChipGridColumnLayout: [GridItem] = [
        GridItem(.adaptive(minimum: 104), spacing: 8, alignment: .leading),
    ]

    var body: some View {
        LazyVGrid(columns: prismaAdaptiveTagChipGridColumnLayout, alignment: .leading, spacing: 8) {
            ForEach(prismaTagLabelCollection, id: \.self) { prismaTagLabel in
                Text(prismaTagLabel)
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.accentRed)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        Capsule(style: .continuous)
                            .fill(PrismaColors.accentRed.opacity(0.2))
                    )
            }
        }
    }
}
