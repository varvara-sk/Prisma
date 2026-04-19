import Foundation

enum PrismaProfileAttachmentStylePreferenceEnumeration: String, CaseIterable, Identifiable, Sendable {
    case secureStableBondingAxis
    case anxiousPreoccupiedBondingAxis
    case dismissiveAvoidantBondingAxis
    case fearfulAnxiousAvoidantBondingAxis
    case attachmentSelfKnowledgeUnknownPlaceholder

    var id: String { rawValue }

    var prismaLocalizedRussianReadableMenuTitle: String {
        switch self {
        case .secureStableBondingAxis:
            return "Надежный"
        case .anxiousPreoccupiedBondingAxis:
            return "Тревожный"
        case .dismissiveAvoidantBondingAxis:
            return "Избегающий"
        case .fearfulAnxiousAvoidantBondingAxis:
            return "Тревожно-избегающий"
        case .attachmentSelfKnowledgeUnknownPlaceholder:
            return "Не знаю свой тип"
        }
    }
}
