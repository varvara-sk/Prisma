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
        switch self {
        case .unspecifiedSelfIdentificationPlaceholderNucleus:
            return "Выберите вариант"
        case .singleOrActivelySeekingPartnershipAxisNucleus:
            return "Свободен(на) / Ищу отношения"
        case .committedNonMaritalPartnershipAxisNucleus:
            return "В отношениях"
        case .maritalCovenantAxisNucleus:
            return "В браке"
        case .separationOrDivorceProcessingAxisNucleus:
            return "Переживаю расставание / развод"
        case .acuteInterpersonalConflictCrisisAxisNucleus:
            return "В сложном конфликте"
        }
    }
}
