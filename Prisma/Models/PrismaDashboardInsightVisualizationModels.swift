import Foundation

struct MoodData: Identifiable, Hashable, Sendable {
    let id: UUID
    let weekdayOrdinalLabel: String
    let anxietyIntensityLevelOneThroughTen: Int

    init(
        id: UUID = UUID(),
        weekdayOrdinalLabel: String,
        anxietyIntensityLevelOneThroughTen: Int
    ) {
        self.id = id
        self.weekdayOrdinalLabel = weekdayOrdinalLabel
        self.anxietyIntensityLevelOneThroughTen = anxietyIntensityLevelOneThroughTen
    }
}

struct InsightData: Hashable, Sendable {
    let currentConflictStatusNarrativeLine: String
    let userOwnedTriggerDescriptorTags: [String]
    let partnerRedFlagDescriptorTags: [String]
    let communicationMisalignmentBulletFragments: [String]
    let actionPlanChecklistItemTitles: [String]
}

enum PrismaDashboardMockSamplePayloadFactory {
    static let prismaWeekdayAnxietyTrendPreviewSeries: [MoodData] = [
        MoodData(weekdayOrdinalLabel: "Пн", anxietyIntensityLevelOneThroughTen: 4),
        MoodData(weekdayOrdinalLabel: "Вт", anxietyIntensityLevelOneThroughTen: 5),
        MoodData(weekdayOrdinalLabel: "Ср", anxietyIntensityLevelOneThroughTen: 3),
        MoodData(weekdayOrdinalLabel: "Чт", anxietyIntensityLevelOneThroughTen: 6),
        MoodData(weekdayOrdinalLabel: "Пт", anxietyIntensityLevelOneThroughTen: 7),
        MoodData(weekdayOrdinalLabel: "Сб", anxietyIntensityLevelOneThroughTen: 8),
        MoodData(weekdayOrdinalLabel: "Вс", anxietyIntensityLevelOneThroughTen: 6),
    ]

    static let prismaSessionInsightPreviewSnapshot: InsightData = InsightData(
        currentConflictStatusNarrativeLine: "Холодная война. Вы не общаетесь 2 дня.",
        userOwnedTriggerDescriptorTags: [
            "Страх отвержения",
            "Обесценивание",
        ],
        partnerRedFlagDescriptorTags: [
            "Сарказм под давлением",
            "Игнор сообщений",
        ],
        communicationMisalignmentBulletFragments: [
            "Вы оба уходите в защиту вместо того, чтобы описывать чувства.",
            "Партнёр воспринимает паузу как наказание.",
            "Тон сообщений стал короче и резче за три дня.",
        ],
        actionPlanChecklistItemTitles: [
            "Написать Я-сообщение",
            "Дать партнеру 24 часа на остывание",
            "Зафиксировать одну просьбу без обвинений",
        ]
    )

    static let prismaPairDynamicsCompatibilityNarrativeLine: String =
        "Твоя реакция: Тревожность. Реакция партнера: Избегание. Рекомендация: не дави эмоциями, когда он отдаляется."
}
