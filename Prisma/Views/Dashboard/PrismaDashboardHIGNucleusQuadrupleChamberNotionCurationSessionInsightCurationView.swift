import SwiftUI

struct PrismaDashboardHIGNucleusQuadrupleChamberNotionCurationSessionInsightCurationView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaSessionCurationHIGNucleusInsightChamber: InsightData

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        VStack(alignment: .leading, spacing: 24) {
            Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardSessionMain
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
            )
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
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "text.alignleft")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardSessionEssence
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            VStack(alignment: .leading, spacing: 10) {
                ForEach(
                    prismaCinematicHignucleusDottedCappedCurationNarrativeBulletRows(
                        prismaSessionCurationHIGNucleusInsightChamber.sessionSituationAwarenessNucleusLine
                    ),
                    id: \.self
                ) { row in
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6, weight: .semibold, design: .default))
                            .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.72))
                            .padding(.top, 8)
                        Text(row)
                            .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .prismaComfortableMultilineReadableTextBlockModifierChain()
                            .lineSpacing(5)
                    }
                }
            }
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
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(PrismaColors.accentGreen(prismaRuntimeActiveAppThemeComposition).opacity(0.85))
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardSessionAnchors
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
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
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition).opacity(0.88))
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardSessionTriggers
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
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
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        VStack(alignment: .leading, spacing: 10) {
            Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardSessionTry
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
            )
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
        prismaSessionCurationHIGNucleusInsightChamber.counterpartBehavioralFrictionDescriptorTags
    }

    private func prismaCinematicHignucleusDottedCappedCurationNarrativeBulletRows(
        _ prismaCinematicHIGNucleusRawCurationLabeledMosaic: String
    ) -> [String] {
        let normalized = prismaCinematicHIGNucleusRawCurationLabeledMosaic
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let fragments = normalized
            .components(separatedBy: ".")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        if fragments.isEmpty {
            return []
        }
        return Array(fragments.prefix(3))
    }
}
