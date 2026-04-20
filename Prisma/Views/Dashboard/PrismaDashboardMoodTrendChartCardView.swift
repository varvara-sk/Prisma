import Charts
import SwiftUI

struct PrismaDashboardMoodTrendChartCardView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaMoodDataPointCollection: [MoodData]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Уровень тревоги (7 дней)")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                Text("Общий фон по вам — не привязан к полоске ситуаций выше.")
                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Chart(prismaMoodDataPointCollection) { prismaMoodDatum in
                AreaMark(
                    x: .value("День", prismaMoodDatum.weekdayOrdinalLabel),
                    y: .value("Тревога", prismaMoodDatum.anxietyIntensityLevelOneThroughTen)
                )
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.42),
                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0),
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
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                .lineStyle(StrokeStyle(lineWidth: 2.4, lineCap: .round, lineJoin: .round))
            }
            .chartYScale(domain: 0...10)
            .chartXAxis {
                AxisMarks(values: .automatic) { _ in
                    AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition).opacity(0.25))
                    AxisValueLabel()
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
            }
            .chartYAxis {
                AxisMarks(values: [0, 2, 4, 6, 8, 10]) { _ in
                    AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition).opacity(0.2))
                    AxisValueLabel()
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
            }
            .frame(height: 200)
        }
        .prismaDashboardCardUniformSurfaceStyle()
    }
}
