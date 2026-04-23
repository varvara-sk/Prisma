import Foundation

enum PrismaPrimaryChatChronicleAuthorRoleCurationEnumeration: String, Codable, Sendable, CaseIterable {
    case user
    case assistant
}

struct PrismaPrimaryChatConversationChronicleNucleusPersistedLineFragment: Codable, Identifiable, Hashable, Sendable {
    var id: UUID
    var prismaPrimaryChatChronicleAuthorRoleCurationLabel: PrismaPrimaryChatChronicleAuthorRoleCurationEnumeration
    var prismaPrimaryChatChroniclePayloadTextualBody: String
    var prismaPrimaryChatChronicleAnchoredTimestamp: Date
}
