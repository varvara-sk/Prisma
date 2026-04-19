import Foundation

enum GlobalMode: String, Codable, CaseIterable, Sendable {
    case separationLettingGo
    case committedRelationshipCare
    case datingDiscovery
}

enum RelationshipDynamics: String, Codable, CaseIterable, Sendable {
    case equalPartnershipBalance
    case patriarchalStructure
    case attachmentDependencySelf
}

enum RelationshipDuration: String, Codable, CaseIterable, Sendable {
    case underSixMonthsHorizon
    case oneThroughThreeYearsHorizon
    case beyondThreeYearsHorizon
}

enum LivingStatus: String, Codable, CaseIterable, Sendable {
    case sharedHouseholdTogether
    case separateHouseholdsNearby
    case longDistanceRhythm
}

struct UserProfile: Codable, Equatable, Sendable {
    var globalMode: GlobalMode?
    var userAge: Int
    var userGender: String
    var dynamics: RelationshipDynamics?
    var duration: RelationshipDuration?
    var livingStatus: LivingStatus?
    var hasObligations: Bool
    var partnerReactionTags: [String]

    init(
        globalMode: GlobalMode? = nil,
        userAge: Int = 25,
        userGender: String = "Не указан",
        dynamics: RelationshipDynamics? = nil,
        duration: RelationshipDuration? = nil,
        livingStatus: LivingStatus? = nil,
        hasObligations: Bool = false,
        partnerReactionTags: [String] = []
    ) {
        self.globalMode = globalMode
        self.userAge = userAge
        self.userGender = userGender
        self.dynamics = dynamics
        self.duration = duration
        self.livingStatus = livingStatus
        self.hasObligations = hasObligations
        self.partnerReactionTags = partnerReactionTags
    }
}
