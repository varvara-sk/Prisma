import Foundation

extension GlobalMode {
    var prismaCinematicLatchedNucleiGlobalModeCardRowEmojiGlyph: String {
        switch self {
        case .separationLettingGo: return "💔"
        case .committedRelationshipCare: return "❤️"
        case .datingDiscovery: return "✨"
        case .communicationFriendshipAndPeers: return "🤝"
        }
    }

    func prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch (self, language) {
        case (.separationLettingGo, .russianCurationHuskLatchedMosaicNuclei):
            return "Расставание"
        case (.separationLettingGo, .englishCurationHuskLatchedMosaicNuclei):
            return "Breakup / Letting go"
        case (.committedRelationshipCare, .russianCurationHuskLatchedMosaicNuclei):
            return "В отношениях"
        case (.committedRelationshipCare, .englishCurationHuskLatchedMosaicNuclei):
            return "In a relationship"
        case (.datingDiscovery, .russianCurationHuskLatchedMosaicNuclei):
            return "Свидания"
        case (.datingDiscovery, .englishCurationHuskLatchedMosaicNuclei):
            return "Dating"
        case (.communicationFriendshipAndPeers, .russianCurationHuskLatchedMosaicNuclei):
            return "Дружба и общение"
        case (.communicationFriendshipAndPeers, .englishCurationHuskLatchedMosaicNuclei):
            return "Friendship & communication"
        }
    }

    var prismaCompactRussianScenarioDescriptorLabel: String {
        prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(
            .russianCurationHuskLatchedMosaicNuclei
        )
    }

    static func prismaCinematicLatchedNucleiGlobalModeCurationLatchedCardCurationLabeledMosaicNuclei(
        forMode: GlobalMode,
        lineOnePrimaryTitleChamber: Bool,
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch (forMode, lineOnePrimaryTitleChamber, language) {
        case (.separationLettingGo, true, .russianCurationHuskLatchedMosaicNuclei):
            return "Расставание"
        case (.separationLettingGo, true, .englishCurationHuskLatchedMosaicNuclei):
            return "Breakup / Letting go"
        case (.separationLettingGo, false, .russianCurationHuskLatchedMosaicNuclei):
            return "Пройти через боль и отпустить"
        case (.separationLettingGo, false, .englishCurationHuskLatchedMosaicNuclei):
            return "Process pain and let go"
        case (.committedRelationshipCare, true, .russianCurationHuskLatchedMosaicNuclei):
            return "В отношениях"
        case (.committedRelationshipCare, true, .englishCurationHuskLatchedMosaicNuclei):
            return "In a relationship"
        case (.committedRelationshipCare, false, .russianCurationHuskLatchedMosaicNuclei):
            return "Разобраться в конфликтах и улучшить связь"
        case (.committedRelationshipCare, false, .englishCurationHuskLatchedMosaicNuclei):
            return "Work through conflict and improve connection"
        case (.datingDiscovery, true, .russianCurationHuskLatchedMosaicNuclei):
            return "Знакомства (свидания)"
        case (.datingDiscovery, true, .englishCurationHuskLatchedMosaicNuclei):
            return "Dating"
        case (.datingDiscovery, false, .russianCurationHuskLatchedMosaicNuclei):
            return "Анализ мэтчей и свиданий"
        case (.datingDiscovery, false, .englishCurationHuskLatchedMosaicNuclei):
            return "Reflect on matches and dates"
        case (.communicationFriendshipAndPeers, true, .russianCurationHuskLatchedMosaicNuclei):
            return "Общение и дружба"
        case (.communicationFriendshipAndPeers, true, .englishCurationHuskLatchedMosaicNuclei):
            return "Friendship & work"
        case (.communicationFriendshipAndPeers, false, .russianCurationHuskLatchedMosaicNuclei):
            return "Выстраивание дружеских отношений, разобраться в конфликте, улучшить связь"
        case (.communicationFriendshipAndPeers, false, .englishCurationHuskLatchedMosaicNuclei):
            return "Build friendships, understand conflict, improve connection"
        }
    }
}
