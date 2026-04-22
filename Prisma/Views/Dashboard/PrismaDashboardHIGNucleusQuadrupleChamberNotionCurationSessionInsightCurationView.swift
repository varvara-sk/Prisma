import SwiftUI

struct PrismaDashboardHIGNucleusQuadrupleChamberNotionCurationSessionInsightCurationView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaSessionCurationHIGNucleusInsightChamber: InsightData

    var body: some View {
        VStack(alignment: .leading, spacing: 22) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Главное по сессии")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.cardBlockTitleNucleus)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            prismaCinematicHIGNucleusCurationEssenceCinematicTopPinBlockChamber
            if !prismaCinematicHIGNucleusStrengthPillCurationCollectionChamber().isEmpty {
                prismaCinematicHIGNucleusCurationStrengthPastelCinematicGreenCurationBlockChamber
            }
            if !prismaCinematicHIGNucleusTriggerCurationPastelCinematicRoseCurationPillNucleusChamber().isEmpty {
                prismaCinematicHIGNucleusCurationTensionCinematicRedRoseCurationBlockChamber
            }
            if !prismaSessionCurationHIGNucleusInsightChamber.optionalGentleExperimentIdeaFragments.isEmpty {
                prismaCinematicHIGNucleusCurationLeafBulletedCinematicCurationAdviceBlockChamber
            }
        }
        .prismaDashboardInsightsHIGNotionCinematicNucleusDocumentaryCardChromaticDropShadowChamberSurfaceStyle()
    }

    @ViewBuilder
    private var prismaCinematicHIGNucleusCurationEssenceCinematicTopPinBlockChamber: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 10) {
                Text(verbatim: "📌")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                Text("Суть")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            Text(prismaCinematicHignucleusDottedCappedCurationNarrativeChamberExcerpt(
                prismaSessionCurationHIGNucleusInsightChamber.sessionSituationAwarenessNucleusLine
            ))
            .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            .prismaComfortableMultilineReadableTextBlockModifierChain()
            .lineSpacing(5)
        }
    }

    @ViewBuilder
    private var prismaCinematicHIGNucleusCurationStrengthPastelCinematicGreenCurationBlockChamber: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Text(verbatim: "🟢")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                Text("Точки опоры")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            VStack(alignment: .leading, spacing: 8) {
                ForEach(
                    Array(prismaCinematicHIGNucleusStrengthPillCurationCollectionChamber().prefix(2)),
                    id: \.self
                ) { row in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                            .foregroundStyle(PrismaColors.accentGreen(prismaRuntimeActiveAppThemeComposition).opacity(0.85))
                            .padding(.top, 1)
                        Text(row)
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .prismaComfortableMultilineReadableTextBlockModifierChain()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(PrismaColors.accentGreen(prismaRuntimeActiveAppThemeComposition).opacity(0.14))
                    )
                }
            }
        }
    }

    @ViewBuilder
    private var prismaCinematicHIGNucleusCurationTensionCinematicRedRoseCurationBlockChamber: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Text(verbatim: "🔴")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                Text("Триггеры")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            VStack(alignment: .leading, spacing: 8) {
                ForEach(
                    Array(prismaCinematicHIGNucleusTriggerCurationPastelCinematicRoseCurationPillNucleusChamber().prefix(2)),
                    id: \.self
                ) { row in
                    HStack(alignment: .top, spacing: 8) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                            .foregroundStyle(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition).opacity(0.9))
                            .padding(.top, 1)
                        Text(row)
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .prismaComfortableMultilineReadableTextBlockModifierChain()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition).opacity(0.14))
                    )
                }
            }
        }
    }

    @ViewBuilder
    private var prismaCinematicHIGNucleusCurationLeafBulletedCinematicCurationAdviceBlockChamber: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Text(verbatim: "💡")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                Text("Что попробовать")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            VStack(alignment: .leading, spacing: 10) {
                ForEach(prismaSessionCurationHIGNucleusInsightChamber.optionalGentleExperimentIdeaFragments, id: \.self) { line in
                    HStack(alignment: .top, spacing: 8) {
                        Text(verbatim: "🍃")
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                            .foregroundStyle(PrismaColors.accentGreen(prismaRuntimeActiveAppThemeComposition).opacity(0.9))
                        Text(line)
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .prismaComfortableMultilineReadableTextBlockModifierChain()
                    }
                }
            }
        }
    }

    private func prismaCinematicHIGNucleusStrengthPillCurationCollectionChamber() -> [String] {
        prismaSessionCurationHIGNucleusInsightChamber.relationalSynchronyStrengthHighlightDescriptorTags
    }

    private func prismaCinematicHIGNucleusTriggerCurationPastelCinematicRoseCurationPillNucleusChamber() -> [String] {
        Array(
            (
                prismaSessionCurationHIGNucleusInsightChamber.relationalTensionAmplificationDescriptorTags +
                    prismaSessionCurationHIGNucleusInsightChamber
                        .counterpartBehavioralFrictionDescriptorTags
            ).prefix(2)
        )
    }

    private func prismaCinematicHignucleusDottedCappedCurationNarrativeChamberExcerpt(_ full: String) -> String {
        let t = full.trimmingCharacters(in: .whitespacesAndNewlines)
        if t.isEmpty {
            return "—"
        }
        let w = t
            .components(separatedBy: ". ")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        if w.isEmpty { return t }
        if w.count == 1 {
            let a = w[0]
            if a.hasSuffix("!") || a.hasSuffix("?") || a.hasSuffix("…") {
                return a
            }
            if a.hasSuffix(".") { return a }
            return a + "."
        }
        let a = w[0]
        let b = w[1]
        let s = a + ". " + b
        if s.count > 240 {
            return String(s.prefix(237)) + "…"
        }
        return s
    }
}
