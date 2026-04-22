import Charts
import SwiftUI

struct PrismaDashboardMoodTrendChartCardView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaMoodDataPointCollection: [MoodData]

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        let dayAxis = PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardChartAxisDay
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
        let anxietyAxis = PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardChartAxisAnxiety
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardMoodAnxiety
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                .font(PrismaDashboardInsightsHIGSurfaceTypography.cardBlockTitleNucleus)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardMoodLast7Days
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
            }
            Chart(prismaMoodDataPointCollection) { prismaMoodDatum in
                AreaMark(
                    x: .value(dayAxis, prismaMoodDatum.weekdayOrdinalLabel),
                    y: .value(anxietyAxis, prismaMoodDatum.anxietyIntensityLevelOneThroughTen)
                )
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            PrismaColors.prismaDashboardInsightsAnxietyAreaGradientPastelLavenderTopNucleus()
                                .opacity(
                                    prismaRuntimeActiveAppThemeComposition
                                        == .lightTranslucentLavender ? 0.62 : 0.38
                                ),
                            Color.clear,
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .interpolationMethod(.catmullRom)
                LineMark(
                    x: .value(dayAxis, prismaMoodDatum.weekdayOrdinalLabel),
                    y: .value(anxietyAxis, prismaMoodDatum.anxietyIntensityLevelOneThroughTen)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.92))
                .lineStyle(StrokeStyle(lineWidth: 2.1, lineCap: .round, lineJoin: .round))
            }
            .chartYScale(domain: 0...10)
            .chartXAxis {
                AxisMarks(values: .automatic) { _ in
                    AxisValueLabel()
                        .font(PrismaDashboardInsightsHIGSurfaceTypography.microCaptionAxisNucleus)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
            }
            .chartYAxis {
                AxisMarks { _ in
                    AxisValueLabel {
                        EmptyView()
                    }
                }
            }
            .frame(height: 200)
        }
        .prismaDashboardInsightsHIGNotionCinematicNucleusDocumentaryCardChromaticDropShadowChamberSurfaceStyle()
    }
}
