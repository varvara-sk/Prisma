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
        let prismaHasSingleMoodPoint = prismaMoodDataPointCollection.count == 1
        let prismaLatestMoodLevel = prismaMoodDataPointCollection.last?.anxietyIntensityLevelOneThroughTen
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 10) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .dashboardMoodAnxiety
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.cardBlockTitleNucleus)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Spacer(minLength: 0)
                    if let prismaLatestMoodLevel {
                        Text("\(prismaLatestMoodLevel)/10")
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                            .padding(.horizontal, 9)
                            .padding(.vertical, 5)
                            .background(
                                Capsule(style: .continuous)
                                    .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.12))
                            )
                    }
                }
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardMoodLast7Days
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
            }
            Chart(prismaMoodDataPointCollection) { prismaMoodDatum in
                RuleMark(y: .value(anxietyAxis, 5))
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition).opacity(0.16))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [4, 5]))
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
                PointMark(
                    x: .value(dayAxis, prismaMoodDatum.weekdayOrdinalLabel),
                    y: .value(anxietyAxis, prismaMoodDatum.anxietyIntensityLevelOneThroughTen)
                )
                .symbolSize(56)
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
            }
            .chartYScale(domain: 0...10)
            .chartPlotStyle { prismaPlotArea in
                prismaPlotArea
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(PrismaColors.prismaFormFieldMutedFillSurface(prismaRuntimeActiveAppThemeComposition).opacity(0.45))
                    )
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { _ in
                    AxisGridLine()
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition).opacity(0.12))
                    AxisValueLabel()
                        .font(PrismaDashboardInsightsHIGSurfaceTypography.microCaptionAxisNucleus)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading, values: [0, 5, 10]) { _ in
                    AxisGridLine()
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition).opacity(0.12))
                    AxisValueLabel()
                        .font(PrismaDashboardInsightsHIGSurfaceTypography.microCaptionAxisNucleus)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
            }
            .frame(height: 140)
            if prismaHasSingleMoodPoint {
                HStack(spacing: 8) {
                    Circle()
                        .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                        .frame(width: 7, height: 7)
                    Text(language == .russianCurationHuskLatchedMosaicNuclei
                        ? "Первая отметка сохранена. Линия появится после следующего чек-ина."
                        : "First check-in saved. The line appears after the next check-in."
                    )
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .prismaDashboardInsightsHIGNotionCinematicNucleusDocumentaryCardChromaticDropShadowChamberSurfaceStyle()
    }
}
