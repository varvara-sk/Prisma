import Foundation

enum GlobalMode: String, Codable, CaseIterable, Sendable {
    case separationLettingGo
    case committedRelationshipCare
    case datingDiscovery
    case communicationFriendshipAndPeers
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

struct UserProfile: Equatable, Hashable, Sendable {
    var globalMode: GlobalMode?
    var userGender: String
    var userAgeFreeformInputText: String
    var prismaPreferredCallsignForUserInterfaceDisplay: String
    var prismaAttachmentStylePreferenceEnumerationSerializedRawValue: String
    var prismaAIResponsePersonalizationNoteFreeformText: String
    var dynamicsPresetSelection: PrismaOnboardingDynamicsPresetSelection?
    var dynamicsCustomUserAuthoredNarrativeText: String
    var relationshipDurationFreeformNarrativeText: String
    var livingStatus: LivingStatus?
    var mutualBondingConnectionDescriptorTags: [String]
    var partnerConflictStyleDescriptorTags: [String]
    var timeSinceBreakup: String
    var topDesiredTraits: [String]
    var socialContext: String
    var datingRedFlagsFreeformText: String
    var friendshipCommunicationDifficultiesFreeformText: String

    init(
        globalMode: GlobalMode? = nil,
        userGender: String = "Не указан",
        userAgeFreeformInputText: String = "",
        prismaPreferredCallsignForUserInterfaceDisplay: String = "",
        prismaAttachmentStylePreferenceEnumerationSerializedRawValue: String = "",
        prismaAIResponsePersonalizationNoteFreeformText: String = "",
        dynamicsPresetSelection: PrismaOnboardingDynamicsPresetSelection? = nil,
        dynamicsCustomUserAuthoredNarrativeText: String = "",
        relationshipDurationFreeformNarrativeText: String = "",
        livingStatus: LivingStatus? = nil,
        mutualBondingConnectionDescriptorTags: [String] = [],
        partnerConflictStyleDescriptorTags: [String] = [],
        timeSinceBreakup: String = "",
        topDesiredTraits: [String] = [],
        socialContext: String = "",
        datingRedFlagsFreeformText: String = "",
        friendshipCommunicationDifficultiesFreeformText: String = ""
    ) {
        self.globalMode = globalMode
        self.userGender = userGender
        self.userAgeFreeformInputText = userAgeFreeformInputText
        self.prismaPreferredCallsignForUserInterfaceDisplay = prismaPreferredCallsignForUserInterfaceDisplay
        self.prismaAttachmentStylePreferenceEnumerationSerializedRawValue = prismaAttachmentStylePreferenceEnumerationSerializedRawValue
        self.prismaAIResponsePersonalizationNoteFreeformText = prismaAIResponsePersonalizationNoteFreeformText
        self.dynamicsPresetSelection = dynamicsPresetSelection
        self.dynamicsCustomUserAuthoredNarrativeText = dynamicsCustomUserAuthoredNarrativeText
        self.relationshipDurationFreeformNarrativeText = relationshipDurationFreeformNarrativeText
        self.livingStatus = livingStatus
        self.mutualBondingConnectionDescriptorTags = mutualBondingConnectionDescriptorTags
        self.partnerConflictStyleDescriptorTags = partnerConflictStyleDescriptorTags
        self.timeSinceBreakup = timeSinceBreakup
        self.topDesiredTraits = topDesiredTraits
        self.socialContext = socialContext
        self.datingRedFlagsFreeformText = datingRedFlagsFreeformText
        self.friendshipCommunicationDifficultiesFreeformText = friendshipCommunicationDifficultiesFreeformText
    }
}

extension UserProfile: Codable {
    enum PrismaUserProfileCodingKeyEnumeration: String, CodingKey {
        case globalMode
        case userGender
        case userAgeFreeformInputText
        case prismaPreferredCallsignForUserInterfaceDisplay
        case prismaAttachmentStylePreferenceEnumerationSerializedRawValue
        case prismaAIResponsePersonalizationNoteFreeformText
        case dynamicsPresetSelection
        case dynamicsCustomUserAuthoredNarrativeText
        case relationshipDurationFreeformNarrativeText
        case livingStatus
        case mutualBondingConnectionDescriptorTags
        case partnerConflictStyleDescriptorTags
        case timeSinceBreakup
        case topDesiredTraits
        case socialContext
        case datingRedFlagsFreeformText
        case friendshipCommunicationDifficultiesFreeformText
    }

    init(from prismaDecoderInstance: Decoder) throws {
        let prismaKeyedContainerInstance = try prismaDecoderInstance.container(keyedBy: PrismaUserProfileCodingKeyEnumeration.self)
        globalMode = try prismaKeyedContainerInstance.decodeIfPresent(GlobalMode.self, forKey: .globalMode)
        userGender = try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .userGender) ?? "Не указан"
        userAgeFreeformInputText = try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .userAgeFreeformInputText) ?? ""
        prismaPreferredCallsignForUserInterfaceDisplay =
            try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .prismaPreferredCallsignForUserInterfaceDisplay) ?? ""
        prismaAttachmentStylePreferenceEnumerationSerializedRawValue =
            try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .prismaAttachmentStylePreferenceEnumerationSerializedRawValue) ?? ""
        prismaAIResponsePersonalizationNoteFreeformText =
            try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .prismaAIResponsePersonalizationNoteFreeformText) ?? ""
        dynamicsPresetSelection = try prismaKeyedContainerInstance.decodeIfPresent(
            PrismaOnboardingDynamicsPresetSelection.self,
            forKey: .dynamicsPresetSelection
        )
        dynamicsCustomUserAuthoredNarrativeText =
            try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .dynamicsCustomUserAuthoredNarrativeText) ?? ""
        relationshipDurationFreeformNarrativeText =
            try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .relationshipDurationFreeformNarrativeText) ?? ""
        livingStatus = try prismaKeyedContainerInstance.decodeIfPresent(LivingStatus.self, forKey: .livingStatus)
        mutualBondingConnectionDescriptorTags =
            try prismaKeyedContainerInstance.decodeIfPresent([String].self, forKey: .mutualBondingConnectionDescriptorTags) ?? []
        partnerConflictStyleDescriptorTags =
            try prismaKeyedContainerInstance.decodeIfPresent([String].self, forKey: .partnerConflictStyleDescriptorTags) ?? []
        timeSinceBreakup = try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .timeSinceBreakup) ?? ""
        topDesiredTraits = try prismaKeyedContainerInstance.decodeIfPresent([String].self, forKey: .topDesiredTraits) ?? []
        socialContext = try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .socialContext) ?? ""
        datingRedFlagsFreeformText = try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .datingRedFlagsFreeformText) ?? ""
        friendshipCommunicationDifficultiesFreeformText =
            try prismaKeyedContainerInstance.decodeIfPresent(String.self, forKey: .friendshipCommunicationDifficultiesFreeformText) ?? ""
    }

    func encode(to prismaEncoderInstance: Encoder) throws {
        var prismaKeyedContainerInstance = prismaEncoderInstance.container(keyedBy: PrismaUserProfileCodingKeyEnumeration.self)
        try prismaKeyedContainerInstance.encodeIfPresent(globalMode, forKey: .globalMode)
        try prismaKeyedContainerInstance.encode(userGender, forKey: .userGender)
        try prismaKeyedContainerInstance.encode(userAgeFreeformInputText, forKey: .userAgeFreeformInputText)
        try prismaKeyedContainerInstance.encode(prismaPreferredCallsignForUserInterfaceDisplay, forKey: .prismaPreferredCallsignForUserInterfaceDisplay)
        try prismaKeyedContainerInstance.encode(
            prismaAttachmentStylePreferenceEnumerationSerializedRawValue,
            forKey: .prismaAttachmentStylePreferenceEnumerationSerializedRawValue
        )
        try prismaKeyedContainerInstance.encode(prismaAIResponsePersonalizationNoteFreeformText, forKey: .prismaAIResponsePersonalizationNoteFreeformText)
        try prismaKeyedContainerInstance.encodeIfPresent(dynamicsPresetSelection, forKey: .dynamicsPresetSelection)
        try prismaKeyedContainerInstance.encode(dynamicsCustomUserAuthoredNarrativeText, forKey: .dynamicsCustomUserAuthoredNarrativeText)
        try prismaKeyedContainerInstance.encode(relationshipDurationFreeformNarrativeText, forKey: .relationshipDurationFreeformNarrativeText)
        try prismaKeyedContainerInstance.encodeIfPresent(livingStatus, forKey: .livingStatus)
        try prismaKeyedContainerInstance.encode(mutualBondingConnectionDescriptorTags, forKey: .mutualBondingConnectionDescriptorTags)
        try prismaKeyedContainerInstance.encode(partnerConflictStyleDescriptorTags, forKey: .partnerConflictStyleDescriptorTags)
        try prismaKeyedContainerInstance.encode(timeSinceBreakup, forKey: .timeSinceBreakup)
        try prismaKeyedContainerInstance.encode(topDesiredTraits, forKey: .topDesiredTraits)
        try prismaKeyedContainerInstance.encode(socialContext, forKey: .socialContext)
        try prismaKeyedContainerInstance.encode(datingRedFlagsFreeformText, forKey: .datingRedFlagsFreeformText)
        try prismaKeyedContainerInstance.encode(friendshipCommunicationDifficultiesFreeformText, forKey: .friendshipCommunicationDifficultiesFreeformText)
    }
}

extension UserProfile {
    mutating func prismaAssimilateApplicationProfileTabObservablePreferenceCluster(
        prismaPreferredCallsignPayload: String,
        prismaAgeNumericOrFreeformPayload: String,
        prismaGenderSegmentSelectionPayload: String,
        prismaAttachmentStyleEnumerationRawPayload: String,
        prismaAiPersonalizationFreeformNotePayload: String
    ) {
        prismaPreferredCallsignForUserInterfaceDisplay = prismaPreferredCallsignPayload
        userAgeFreeformInputText = prismaAgeNumericOrFreeformPayload
        userGender = prismaGenderSegmentSelectionPayload
        prismaAttachmentStylePreferenceEnumerationSerializedRawValue = prismaAttachmentStyleEnumerationRawPayload
        prismaAIResponsePersonalizationNoteFreeformText = prismaAiPersonalizationFreeformNotePayload
    }
}

extension GlobalMode {
    var prismaCompactRussianScenarioDescriptorLabel: String {
        switch self {
        case .separationLettingGo:
            return "Расставание"
        case .committedRelationshipCare:
            return "В отношениях"
        case .datingDiscovery:
            return "Свидания"
        case .communicationFriendshipAndPeers:
            return "Дружба и общение"
        }
    }
}

struct PrismaArchivedUserScenarioLedgerEntry: Codable, Equatable, Hashable, Identifiable, Sendable {
    var id: UUID
    var prismaScenarioCapturedTimestamp: Date
    var prismaEmbeddedUserProfileSnapshot: UserProfile

    init(
        id: UUID = UUID(),
        prismaScenarioCapturedTimestamp: Date = Date(),
        prismaEmbeddedUserProfileSnapshot: UserProfile
    ) {
        self.id = id
        self.prismaScenarioCapturedTimestamp = prismaScenarioCapturedTimestamp
        self.prismaEmbeddedUserProfileSnapshot = prismaEmbeddedUserProfileSnapshot
    }
}
