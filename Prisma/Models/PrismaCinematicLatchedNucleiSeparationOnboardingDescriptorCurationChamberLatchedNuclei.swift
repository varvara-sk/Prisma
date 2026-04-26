import Foundation

enum PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei {
    static func primalCinematicLatchedNucleiInitiatorCurationDescriptorRowChamber(
        userGender: String
    ) -> [(prismaCinematicLatchedNucleiPrimaryCurationTitle: String, prismaCinematicLatchedNucleiSymbolName: String)] {
        return [
            ("Со мной расстались", "heart.slash"),
            ("Мое решение", "figure.walk"),
            ("Это обоюдное решение", "person.2"),
        ]
    }

    static let primalCinematicLatchedNucleiElapsedTemporalCurationChamber: [String] = [
        "На днях",
        "Пару недель назад",
        "Месяц-два",
        "Больше полугода",
    ]

    static let primalCinematicLatchedNucleiPostInterpersonalCurationLatchedCardRow: [(prismaCinematicLatchedNucleiPrimaryCurationTitle: String, prismaCinematicLatchedNucleiSecondaryCurationNucleiSubtitle: String)] = [
        ("Тотальный игнор", "Везде блок или просто не пишем друг другу"),
        ("Вынужденный контакт", "Общие дети, работа, вещи, квартира"),
        ("Пытаемся дружить", "Иногда переписываемся, скидываем мемы"),
        ("Качели", "То сходимся, то расходимся, ссоримся и миримся"),
        ("Односторонняя связь", "Кто-то один пишет или смотрит сторис, другой молчит"),
    ]

    static let primalCinematicLatchedNucleiUserCinematicCurationConflictCurationLatchedGrid: [(prismaCinematicLatchedNucleiPrimaryCurationTitle: String, prismaCinematicLatchedNucleiSymbolName: String)] = [
        ("Взрываюсь", "flame"),
        ("Ухожу в молчанку", "eye.slash"),
        ("Перевожу стрелки", "arrow.turn.up.left"),
        ("Сыплю фактами", "cpu"),
        ("Обесцениваю чувства", "heart.slash"),
        ("Пытаюсь обсудить", "bubble.left.and.bubble.right"),
    ]

    static let primalCinematicLatchedNucleiExPartnerCinematicCurationConflictCurationLatchedGrid: [(prismaCinematicLatchedNucleiPrimaryCurationTitle: String, prismaCinematicLatchedNucleiSymbolName: String)] = [
        ("Взрывается", "flame"),
        ("Уходит в молчанку", "eye.slash"),
        ("Переводит стрелки", "arrow.turn.up.left"),
        ("Сыплет фактами", "cpu"),
        ("Обесценивает чувства", "heart.slash"),
        ("Пытается обсудить", "bubble.left.and.bubble.right"),
    ]

    static let prismaPostSeparationSupportGoalCardRows: [(goal: PrismaSeparationSupportGoal, title: String, subtitle: String, symbolName: String)] = [
        (.letGoAndForget, "Отпустить и забыть", "Найти опору в себе и двигаться дальше", "leaf.fill"),
        (.understandMistakes, "Разобрать ошибки", "Понять, что пошло не так в отношениях", "magnifyingglass"),
        (.ventAndBeHeard, "Просто выговориться", "Мне нужна поддержка и жилетка", "bubble.left.and.bubble.right.fill"),
        (.tryToReconnect, "Попытаться всё вернуть", "Как экологично наладить контакт", "arrow.uturn.backward.circle.fill"),
    ]
}
