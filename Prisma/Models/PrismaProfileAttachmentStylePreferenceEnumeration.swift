import Foundation

enum PrismaProfileAttachmentStylePreferenceEnumeration: String, CaseIterable, Identifiable, Sendable {
    case secureStableBondingAxis
    case anxiousPreoccupiedBondingAxis
    case dismissiveAvoidantBondingAxis
    case fearfulAnxiousAvoidantBondingAxis
    case attachmentSelfKnowledgeUnknownPlaceholder

    var id: String { rawValue }

    var prismaLocalizedRussianReadableMenuTitle: String {
        prismaCinematicLatchedNucleiReadableMenuTitleForApplicationInterfaceLanguage(
            .russianCurationHuskLatchedMosaicNuclei
        )
    }

    func prismaCinematicLatchedNucleiReadableMenuTitleForApplicationInterfaceLanguage(
        _ userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch (self, userInterfaceActiveLanguage) {
        case (.secureStableBondingAxis, .russianCurationHuskLatchedMosaicNuclei):
            return "Надежный"
        case (.secureStableBondingAxis, .englishCurationHuskLatchedMosaicNuclei):
            return "Secure"
        case (.anxiousPreoccupiedBondingAxis, .russianCurationHuskLatchedMosaicNuclei):
            return "Тревожный"
        case (.anxiousPreoccupiedBondingAxis, .englishCurationHuskLatchedMosaicNuclei):
            return "Anxious"
        case (.dismissiveAvoidantBondingAxis, .russianCurationHuskLatchedMosaicNuclei):
            return "Избегающий"
        case (.dismissiveAvoidantBondingAxis, .englishCurationHuskLatchedMosaicNuclei):
            return "Avoidant"
        case (.fearfulAnxiousAvoidantBondingAxis, .russianCurationHuskLatchedMosaicNuclei):
            return "Тревожно-избегающий"
        case (.fearfulAnxiousAvoidantBondingAxis, .englishCurationHuskLatchedMosaicNuclei):
            return "Fearful-avoidant"
        case (.attachmentSelfKnowledgeUnknownPlaceholder, .russianCurationHuskLatchedMosaicNuclei):
            return "Не знаю свой тип"
        case (.attachmentSelfKnowledgeUnknownPlaceholder, .englishCurationHuskLatchedMosaicNuclei):
            return "I do not know my type"
        }
    }
}
