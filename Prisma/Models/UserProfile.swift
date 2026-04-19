import Foundation

enum GlobalMode: String, Codable, CaseIterable, Sendable {
    case separationLettingGo
    case committedRelationshipCare
    case datingDiscovery
}

enum PrismaOnboardingDynamicsPresetSelection: String, Codable, CaseIterable, Sendable {
    case equalPartnershipBalance
    case patriarchalStructureAxis
    case userDefinedFreeformNarrative
}

enum LivingStatus: String, Codable, CaseIterable, Sendable {
    case sharedHouseholdTogether
    case separateHouseholdsNearby
    case longDistanceRhythm
}

struct UserProfile: Codable, Equatable, Sendable {
    var globalMode: GlobalMode?
    var userGender: String
    var userAgeFreeformInputText: String
    var dynamicsPresetSelection: PrismaOnboardingDynamicsPresetSelection?
    var dynamicsCustomUserAuthoredNarrativeText: String
    var relationshipDurationFreeformNarrativeText: String
    var livingStatus: LivingStatus?
    var mutualBondingConnectionDescriptorTags: [String]
    var partnerConflictStyleDescriptorTags: [String]

    init(
        globalMode: GlobalMode? = nil,
        userGender: String = "Не указан",
        userAgeFreeformInputText: String = "",
        dynamicsPresetSelection: PrismaOnboardingDynamicsPresetSelection? = nil,
        dynamicsCustomUserAuthoredNarrativeText: String = "",
        relationshipDurationFreeformNarrativeText: String = "",
        livingStatus: LivingStatus? = nil,
        mutualBondingConnectionDescriptorTags: [String] = [],
        partnerConflictStyleDescriptorTags: [String] = []
    ) {
        self.globalMode = globalMode
        self.userGender = userGender
        self.userAgeFreeformInputText = userAgeFreeformInputText
        self.dynamicsPresetSelection = dynamicsPresetSelection
        self.dynamicsCustomUserAuthoredNarrativeText = dynamicsCustomUserAuthoredNarrativeText
        self.relationshipDurationFreeformNarrativeText = relationshipDurationFreeformNarrativeText
        self.livingStatus = livingStatus
        self.mutualBondingConnectionDescriptorTags = mutualBondingConnectionDescriptorTags
        self.partnerConflictStyleDescriptorTags = partnerConflictStyleDescriptorTags
    }
}
