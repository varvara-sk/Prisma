import SwiftUI

struct PrismaDashboardHIGNucleusQuadrupleChamberNotionCurationSessionInsightCurationView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaSessionCurationHIGNucleusInsightChamber: InsightData

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Главное по сессии")
                .font(PrismaDashboardInsightsHIGSurfaceTypography.cardBlockTitleNucleus)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            prismaCinematicHIGNucleusCurationEssenceCinematicTopPinBlockChamber
            if !prismaCinematicHIGNucleusStrengthPillCurationCollectionChamber().isEmpty {
                prismaCinematicHIGNucleusCurationStrengthPastelCinematicGreenCurationBlockChamber
            }
            if !prismaCinematicHIGNucleusTriggerCurationPastelCinematicRoseCurationPillNucleusChamber().isEmpty {
                prismaCinematicHIGNucleusCurationTensionCinematicRedRoseCurationBlockChamber
            }
            if !prismaSessionCurationHIGNucleusInsightChamber.optionalGentleExperimentIdeaFragments.isEmpty {
                prismaCinematicHIGNucleusCurationActionableAdviceCinematicCurationChamber
            }
        }
        .prismaDashboardInsightsHIGNotionCinematicNucleusDocumentaryCardChromaticDropShadowChamberSurfaceStyle()
    }

    @ViewBuilder
    private var prismaCinematicHIGNucleusCurationEssenceCinematicTopPinBlockChamber: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "text.alignleft")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                Text("Суть")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            Text(prismaCinematicHignucleusDottedCappedCurationNarrativeChamberExcerpt(
                prismaSessionCurationHIGNucleusInsightChamber.sessionSituationAwarenessNucleusLine
            ))
            .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            .prismaComfortableMultilineReadableTextBlockModifierChain()
            .lineSpacing(6)
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(PrismaColors.prismaFormFieldMutedFillSurface(prismaRuntimeActiveAppThemeComposition).opacity(0.6))
            )
        }
    }

    @ViewBuilder
    private var prismaCinematicHIGNucleusCurationStrengthPastelCinematicGreenCurationBlockChamber: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(PrismaColors.accentGreen(prismaRuntimeActiveAppThemeComposition).opacity(0.85))
                Text("Точки опоры")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            VStack(alignment: .leading, spacing: 8) {
                ForEach(
                    Array(prismaCinematicHIGNucleusStrengthPillCurationCollectionChamber().prefix(2)),
                    id: \.self
                ) { row in
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(PrismaColors.accentGreen(prismaRuntimeActiveAppThemeComposition).opacity(0.9))
                        Text(row)
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .prismaComfortableMultilineReadableTextBlockModifierChain()
                    }
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(PrismaColors.accentGreen(prismaRuntimeActiveAppThemeComposition).opacity(0.12))
                    )
                }
            }
        }
    }

    @ViewBuilder
    private var prismaCinematicHIGNucleusCurationTensionCinematicRedRoseCurationBlockChamber: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition).opacity(0.88))
                Text("Триггеры")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            VStack(alignment: .leading, spacing: 8) {
                ForEach(
                    Array(prismaCinematicHIGNucleusTriggerCurationPastelCinematicRoseCurationPillNucleusChamber().prefix(2)),
                    id: \.self
                ) { row in
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "exclamationmark.circle")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition).opacity(0.9))
                        Text(row)
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .prismaComfortableMultilineReadableTextBlockModifierChain()
                    }
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition).opacity(0.1))
                    )
                }
            }
        }
    }

    @ViewBuilder
    private var prismaCinematicHIGNucleusCurationActionableAdviceCinematicCurationChamber: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Что попробовать")
                .font(.system(size: 18, weight: .semibold, design: .default))
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            VStack(alignment: .leading, spacing: 10) {
                ForEach(prismaSessionCurationHIGNucleusInsightChamber.optionalGentleExperimentIdeaFragments, id: \.self) { line in
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .symbolRenderingMode(.monochrome)
                            .foregroundStyle(PrismaColors.accentGreen(prismaRuntimeActiveAppThemeComposition).opacity(0.8))
                        Text(line)
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .prismaComfortableMultilineReadableTextBlockModifierChain()
                    }
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(PrismaColors.prismaFormFieldMutedFillSurface(prismaRuntimeActiveAppThemeComposition))
                    )
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
