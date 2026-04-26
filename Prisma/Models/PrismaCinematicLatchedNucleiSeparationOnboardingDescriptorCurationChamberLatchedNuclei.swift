import Foundation

enum PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei {
    static func primalCinematicLatchedNucleiInitiatorCurationDescriptorRowChamber(
        userGender: String
    ) -> [(prismaCinematicLatchedNucleiPrimaryCurationTitle: String, prismaCinematicLatchedNucleiSymbolName: String)] {
        let prismaSelfInitiatedTitle: String
        if userGender == "Мужской" || userGender == "Male" {
            prismaSelfInitiatedTitle = "Я ушёл сам"
        } else if userGender == "Женский" || userGender == "Female" {
            prismaSelfInitiatedTitle = "Я ушла сама"
        } else {
            prismaSelfInitiatedTitle = "Я завершил(а) отношения"
        }
        return [
            ("Со мной расстались", "heart.slash"),
            (prismaSelfInitiatedTitle, "figure.walk"),
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
    ]

    static let primalCinematicLatchedNucleiExPartnerCinematicCurationConflictCurationLatchedGrid: [(prismaCinematicLatchedNucleiPrimaryCurationTitle: String, prismaCinematicLatchedNucleiSymbolName: String)] = [
        ("Взрывается", "flame"),
        ("Уходит в молчанку", "eye.slash"),
        ("Переводит стрелки", "arrow.turn.up.left"),
        ("Сыплет фактами", "cpu"),
        ("Обесценивает чувства", "heart.slash"),
        ("Пытается обсудить", "bubble.left.and.bubble.right"),
    ]
}
