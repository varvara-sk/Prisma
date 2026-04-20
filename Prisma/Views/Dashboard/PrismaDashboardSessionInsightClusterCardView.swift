import SwiftUI

struct PrismaDashboardSessionInsightClusterCardView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaSessionInsightPayload: InsightData

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Главное по этой сессии")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                Text("Здесь рядом и опоры, и зоны внимания — без одностороннего списка «ошибок».")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            VStack(alignment: .leading, spacing: 6) {
                Text("Как сейчас")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                Text(prismaSessionInsightPayload.sessionSituationAwarenessNucleusLine)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            if !prismaSessionInsightPayload.relationalSynchronyStrengthHighlightDescriptorTags.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Что опирается на плюсы")
                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    PrismaDashboardTintedSemanticDescriptorTagCapsuleGridClusterView(
                        prismaTagLabelCollection: prismaSessionInsightPayload.relationalSynchronyStrengthHighlightDescriptorTags,
                        prismaTagCapsuleForegroundTintColorResolver: { PrismaColors.accentGreen($0) },
                        prismaTagCapsuleBackgroundTintOpacityResolver: { PrismaColors.accentGreen($0).opacity(0.2) }
                    )
                }
            }
            if !prismaSessionInsightPayload.relationalTensionAmplificationDescriptorTags.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Где откликается сильнее")
                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    PrismaDashboardTintedSemanticDescriptorTagCapsuleGridClusterView(
                        prismaTagLabelCollection: prismaSessionInsightPayload.relationalTensionAmplificationDescriptorTags,
                        prismaTagCapsuleForegroundTintColorResolver: { PrismaColors.primary($0) },
                        prismaTagCapsuleBackgroundTintOpacityResolver: { PrismaColors.primary($0).opacity(0.22) }
                    )
                }
            }
            if !prismaSessionInsightPayload.counterpartBehavioralFrictionDescriptorTags.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Наблюдаемые сигналы у другого человека")
                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    PrismaDashboardTintedSemanticDescriptorTagCapsuleGridClusterView(
                        prismaTagLabelCollection: prismaSessionInsightPayload.counterpartBehavioralFrictionDescriptorTags,
                        prismaTagCapsuleForegroundTintColorResolver: { PrismaColors.accentRed($0) },
                        prismaTagCapsuleBackgroundTintOpacityResolver: { PrismaColors.accentRed($0).opacity(0.2) }
                    )
                }
            }
            if !prismaSessionInsightPayload.contactDriftObservationBulletFragments.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Где контакт звучит иначе, чем хотелось бы")
                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(prismaSessionInsightPayload.contactDriftObservationBulletFragments, id: \.self) { prismaBulletLine in
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
            }
            if !prismaSessionInsightPayload.optionalGentleExperimentIdeaFragments.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Что можно попробовать — по желанию")
                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(prismaSessionInsightPayload.optionalGentleExperimentIdeaFragments, id: \.self) { prismaGentleLine in
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: "leaf.fill")
                                    .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                                    .foregroundStyle(PrismaColors.accentGreen(prismaRuntimeActiveAppThemeComposition).opacity(0.95))
                                    .padding(.top, 2)
                                Text(prismaGentleLine)
                                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                }
            }
        }
        .prismaDashboardCardUniformSurfaceStyle()
    }
}

private struct PrismaDashboardTintedSemanticDescriptorTagCapsuleGridClusterView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaTagLabelCollection: [String]
    let prismaTagCapsuleForegroundTintColorResolver: (AppTheme) -> Color
    let prismaTagCapsuleBackgroundTintOpacityResolver: (AppTheme) -> Color

    var body: some View {
        let prismaVisualThemeDescriptor = prismaRuntimeActiveAppThemeComposition
        VStack(alignment: .center, spacing: 8) {
            ForEach(prismaTagLabelCollection, id: \.self) { prismaTagLabel in
                Text(prismaTagLabel)
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(prismaTagCapsuleForegroundTintColorResolver(prismaVisualThemeDescriptor))
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                    .minimumScaleFactor(0.88)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(
                        Capsule(style: .continuous)
                            .fill(prismaTagCapsuleBackgroundTintOpacityResolver(prismaVisualThemeDescriptor))
                    )
            }
        }
        .frame(maxWidth: .infinity)
    }
}
