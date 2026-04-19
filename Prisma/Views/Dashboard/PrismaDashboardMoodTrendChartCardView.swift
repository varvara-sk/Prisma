import Charts
import SwiftUI

struct PrismaDashboardMoodTrendChartCardView: View {
    let prismaMoodDataPointCollection: [MoodData]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Уровень тревоги (7 дней)")
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textPrimary)
            Chart(prismaMoodDataPointCollection) { prismaMoodDatum in
                AreaMark(
                    x: .value("День", prismaMoodDatum.weekdayOrdinalLabel),
                    y: .value("Тревога", prismaMoodDatum.anxietyIntensityLevelOneThroughTen)
                )
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            PrismaColors.primary.opacity(0.42),
                            PrismaColors.primary.opacity(0),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .interpolationMethod(.catmullRom)
                LineMark(
                    x: .value("День", prismaMoodDatum.weekdayOrdinalLabel),
                    y: .value("Тревога", prismaMoodDatum.anxietyIntensityLevelOneThroughTen)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(PrismaColors.primary)
                .lineStyle(StrokeStyle(lineWidth: 2.4, lineCap: .round, lineJoin: .round))
            }
            .chartYScale(domain: 0...10)
            .chartXAxis {
                AxisMarks(values: .automatic) { _ in
                    AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                        .foregroundStyle(PrismaColors.textSecondary.opacity(0.25))
                    AxisValueLabel()
                        .foregroundStyle(PrismaColors.textSecondary)
                }
            }
            .chartYAxis {
                AxisMarks(values: [0, 2, 4, 6, 8, 10]) { _ in
                    AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                        .foregroundStyle(PrismaColors.textSecondary.opacity(0.2))
                    AxisValueLabel()
                        .foregroundStyle(PrismaColors.textSecondary)
                }
            }
            .frame(height: 200)
        }
        .prismaDashboardCardUniformSurfaceStyle()
    }
}
