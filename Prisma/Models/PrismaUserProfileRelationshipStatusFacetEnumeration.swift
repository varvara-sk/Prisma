import Foundation

enum PrismaUserProfileRelationshipStatusFacetEnumeration: String, CaseIterable, Codable, Sendable, Identifiable {
    case unspecifiedSelfIdentificationPlaceholderNucleus
    case singleOrActivelySeekingPartnershipAxisNucleus
    case committedNonMaritalPartnershipAxisNucleus
    case maritalCovenantAxisNucleus
    case separationOrDivorceProcessingAxisNucleus
    case acuteInterpersonalConflictCrisisAxisNucleus

    var id: String { rawValue }

    var prismaLocalizedRussianCompactProfilePickerTitleLine: String {
        prismaCinematicLatchedNucleiCompactProfilePickerTitleForApplicationInterfaceLanguage(
            .russianCurationHuskLatchedMosaicNuclei
        )
    }

    func prismaCinematicLatchedNucleiCompactProfilePickerTitleForApplicationInterfaceLanguage(
        _ userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch (self, userInterfaceActiveLanguage) {
        case (.unspecifiedSelfIdentificationPlaceholderNucleus, .russianCurationHuskLatchedMosaicNuclei):
            return "Выберите вариант"
        case (.unspecifiedSelfIdentificationPlaceholderNucleus, .englishCurationHuskLatchedMosaicNuclei):
            return "Choose an option"
        case (.singleOrActivelySeekingPartnershipAxisNucleus, .russianCurationHuskLatchedMosaicNuclei):
            return "Свободен(на) / Ищу отношения"
        case (.singleOrActivelySeekingPartnershipAxisNucleus, .englishCurationHuskLatchedMosaicNuclei):
            return "Single / open to dating"
        case (.committedNonMaritalPartnershipAxisNucleus, .russianCurationHuskLatchedMosaicNuclei):
            return "В отношениях"
        case (.committedNonMaritalPartnershipAxisNucleus, .englishCurationHuskLatchedMosaicNuclei):
            return "In a relationship"
        case (.maritalCovenantAxisNucleus, .russianCurationHuskLatchedMosaicNuclei):
            return "В браке"
        case (.maritalCovenantAxisNucleus, .englishCurationHuskLatchedMosaicNuclei):
            return "Married"
        case (.separationOrDivorceProcessingAxisNucleus, .russianCurationHuskLatchedMosaicNuclei):
            return "Переживаю расставание / развод"
        case (.separationOrDivorceProcessingAxisNucleus, .englishCurationHuskLatchedMosaicNuclei):
            return "Separation or divorce"
        case (.acuteInterpersonalConflictCrisisAxisNucleus, .russianCurationHuskLatchedMosaicNuclei):
            return "В сложном конфликте"
        case (.acuteInterpersonalConflictCrisisAxisNucleus, .englishCurationHuskLatchedMosaicNuclei):
            return "In an acute conflict"
        }
    }
}
