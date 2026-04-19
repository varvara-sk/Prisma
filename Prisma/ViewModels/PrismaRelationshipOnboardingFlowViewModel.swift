import Combine
import Foundation

enum PrismaRelationshipOnboardingFooterMutationOutcome: Sendable {
    case remainedOnSameStepDueToIncompleteRequirements
    case advancedToSubsequentWizardStep
    case finishedPersistingProfileSnapshot
}

@MainActor
final class PrismaRelationshipOnboardingFlowViewModel: ObservableObject {
    static let prismaRelationshipOnboardingWizardTotalStepQuantity: Int = 4

    @Published var prismaMutableUserRelationshipProfileSnapshot: UserProfile
    @Published private(set) var prismaCurrentRelationshipOnboardingWizardStepIndex: Int
    @Published private(set) var prismaTransientRelationshipOnboardingSubmissionLoadingFlag: Bool

    init() {
        prismaMutableUserRelationshipProfileSnapshot = UserProfile()
        prismaCurrentRelationshipOnboardingWizardStepIndex = 0
        prismaTransientRelationshipOnboardingSubmissionLoadingFlag = false
    }

    var prismaPrimaryFooterAdvancementCallToActionTitle: String {
        prismaCurrentRelationshipOnboardingWizardStepIndex == Self.prismaRelationshipOnboardingWizardTotalStepQuantity - 1
            ? "Начать анализ"
            : "Далее"
    }

    var prismaEvaluateCurrentRelationshipOnboardingStepAllowsForwardProgression: Bool {
        let prismaSnapshot = prismaMutableUserRelationshipProfileSnapshot
        let prismaStepIndex = prismaCurrentRelationshipOnboardingWizardStepIndex
        guard let prismaActiveGlobalMode = prismaSnapshot.globalMode else {
            return false
        }
        switch prismaStepIndex {
        case 0:
            return prismaSnapshot.globalMode != nil
        case 1:
            return prismaEvaluateWizardStepOneForwardEligibilityForGlobalMode(prismaSnapshot, prismaActiveGlobalMode)
        case 2:
            return prismaEvaluateWizardStepTwoForwardEligibilityForGlobalMode(prismaSnapshot, prismaActiveGlobalMode)
        case 3:
            return true
        default:
            return false
        }
    }

    private func prismaEvaluateWizardStepOneForwardEligibilityForGlobalMode(
        _ prismaSnapshot: UserProfile,
        _ prismaMode: GlobalMode
    ) -> Bool {
        let prismaGenderReadyFlag = prismaSnapshot.userGender != "Не указан"
        switch prismaMode {
        case .committedRelationshipCare:
            guard let prismaDynamicsPreset = prismaSnapshot.dynamicsPresetSelection else {
                return false
            }
            if prismaDynamicsPreset == .userDefinedFreeformNarrative {
                let prismaTrimmedCustomBody = prismaSnapshot.dynamicsCustomUserAuthoredNarrativeText
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                return prismaGenderReadyFlag && !prismaTrimmedCustomBody.isEmpty
            }
            return prismaGenderReadyFlag
        case .separationLettingGo, .datingDiscovery, .communicationFriendshipAndPeers:
            return prismaGenderReadyFlag
        }
    }

    private func prismaEvaluateWizardStepTwoForwardEligibilityForGlobalMode(
        _ prismaSnapshot: UserProfile,
        _ prismaMode: GlobalMode
    ) -> Bool {
        switch prismaMode {
        case .committedRelationshipCare:
            return prismaSnapshot.livingStatus != nil
        case .separationLettingGo:
            return !prismaSnapshot.timeSinceBreakup.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        case .datingDiscovery:
            return prismaSnapshot.topDesiredTraits.count == 3
        case .communicationFriendshipAndPeers:
            return !prismaSnapshot.socialContext.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    }

    func prismaHandleBackNavigationChevronTapAction() {
        guard prismaCurrentRelationshipOnboardingWizardStepIndex > 0 else {
            return
        }
        prismaCurrentRelationshipOnboardingWizardStepIndex -= 1
    }

    func prismaHandlePrimaryFooterAdvancementTapAction() async -> PrismaRelationshipOnboardingFooterMutationOutcome {
        guard prismaEvaluateCurrentRelationshipOnboardingStepAllowsForwardProgression else {
            return .remainedOnSameStepDueToIncompleteRequirements
        }
        return await prismaPerformUnvalidatedWizardForwardTransitionIncludingLastStepPersistence()
    }

    func prismaHandleToolbarSkipForwardAction() async -> PrismaRelationshipOnboardingFooterMutationOutcome {
        await prismaPerformUnvalidatedWizardForwardTransitionIncludingLastStepPersistence()
    }

    private func prismaPerformUnvalidatedWizardForwardTransitionIncludingLastStepPersistence(
    ) async -> PrismaRelationshipOnboardingFooterMutationOutcome {
        let prismaLastStepIndexValue = Self.prismaRelationshipOnboardingWizardTotalStepQuantity - 1
        if prismaCurrentRelationshipOnboardingWizardStepIndex < prismaLastStepIndexValue {
            prismaCurrentRelationshipOnboardingWizardStepIndex += 1
            return .advancedToSubsequentWizardStep
        }
        prismaTransientRelationshipOnboardingSubmissionLoadingFlag = true
        try? await Task.sleep(nanoseconds: 450_000_000)
        PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance.prismaPersistCodableUserProfileSnapshot(
            prismaMutableUserRelationshipProfileSnapshot
        )
        prismaTransientRelationshipOnboardingSubmissionLoadingFlag = false
        return .finishedPersistingProfileSnapshot
    }

    func prismaApplyGlobalModeSelectionMutation(_ prismaIncomingGlobalMode: GlobalMode) {
        let prismaPreviousGlobalMode = prismaMutableUserRelationshipProfileSnapshot.globalMode
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.globalMode = prismaIncomingGlobalMode
        if prismaPreviousGlobalMode != prismaIncomingGlobalMode {
            let prismaPreservedGenderLabel = prismaWorkingSnapshot.userGender
            let prismaPreservedAgeText = prismaWorkingSnapshot.userAgeFreeformInputText
            let prismaPreservedCallsignFragment = prismaWorkingSnapshot.prismaPreferredCallsignForUserInterfaceDisplay
            let prismaPreservedAttachmentRawFragment = prismaWorkingSnapshot.prismaAttachmentStylePreferenceEnumerationSerializedRawValue
            let prismaPreservedAiNoteFragment = prismaWorkingSnapshot.prismaAIResponsePersonalizationNoteFreeformText
            prismaWorkingSnapshot = UserProfile(
                globalMode: prismaIncomingGlobalMode,
                userGender: prismaPreservedGenderLabel,
                userAgeFreeformInputText: prismaPreservedAgeText,
                prismaPreferredCallsignForUserInterfaceDisplay: prismaPreservedCallsignFragment,
                prismaAttachmentStylePreferenceEnumerationSerializedRawValue: prismaPreservedAttachmentRawFragment,
                prismaAIResponsePersonalizationNoteFreeformText: prismaPreservedAiNoteFragment
            )
        }
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyUserGenderSelectionMutation(_ prismaIncomingGenderLabel: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.userGender = prismaIncomingGenderLabel
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyUserAgeFreeformInputTextMutation(_ prismaIncomingAgeText: String) {
        let prismaFilteredDigitsOnly = prismaIncomingAgeText.filter { $0.isNumber }
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.userAgeFreeformInputText = String(prismaFilteredDigitsOnly.prefix(3))
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyDynamicsPresetSelectionMutation(_ prismaIncomingPreset: PrismaOnboardingDynamicsPresetSelection) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.dynamicsPresetSelection = prismaIncomingPreset
        if prismaIncomingPreset != .userDefinedFreeformNarrative {
            prismaWorkingSnapshot.dynamicsCustomUserAuthoredNarrativeText = ""
        }
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyDynamicsCustomUserAuthoredNarrativeTextMutation(_ prismaIncomingNarrativeBody: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.dynamicsCustomUserAuthoredNarrativeText = prismaIncomingNarrativeBody
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyRelationshipDurationFreeformNarrativeTextMutation(_ prismaIncomingDurationBody: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.relationshipDurationFreeformNarrativeText = prismaIncomingDurationBody
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyLivingStatusSelectionMutation(_ prismaIncomingLivingStatus: LivingStatus) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.livingStatus = prismaIncomingLivingStatus
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaToggleMutualBondingConnectionDescriptorTagMutation(_ prismaBondingDescriptorTagLabel: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        var prismaWorkingCollection = prismaWorkingSnapshot.mutualBondingConnectionDescriptorTags
        if let prismaExistingIndex = prismaWorkingCollection.firstIndex(of: prismaBondingDescriptorTagLabel) {
            prismaWorkingCollection.remove(at: prismaExistingIndex)
        } else {
            prismaWorkingCollection.append(prismaBondingDescriptorTagLabel)
        }
        prismaWorkingSnapshot.mutualBondingConnectionDescriptorTags = prismaWorkingCollection
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaAttemptPartnerConflictStyleDescriptorTagToggleMutation(desiredPartnerReactionTagDisplayLabel: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        var prismaWorkingCollection = prismaWorkingSnapshot.partnerConflictStyleDescriptorTags
        if let prismaExistingIndex = prismaWorkingCollection.firstIndex(of: desiredPartnerReactionTagDisplayLabel) {
            prismaWorkingCollection.remove(at: prismaExistingIndex)
        } else {
            prismaWorkingCollection.append(desiredPartnerReactionTagDisplayLabel)
        }
        prismaWorkingSnapshot.partnerConflictStyleDescriptorTags = prismaWorkingCollection
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyTimeSinceBreakupFreeformTextMutation(_ prismaIncomingBody: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.timeSinceBreakup = prismaIncomingBody
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyDatingPriorityTripleTraitSelectionMutation(_ prismaTraitLabel: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        var prismaTraitCollection = prismaWorkingSnapshot.topDesiredTraits
        if let prismaExistingIndex = prismaTraitCollection.firstIndex(of: prismaTraitLabel) {
            prismaTraitCollection.remove(at: prismaExistingIndex)
        } else if prismaTraitCollection.count < 3 {
            prismaTraitCollection.append(prismaTraitLabel)
        } else {
            prismaTraitCollection.removeFirst()
            prismaTraitCollection.append(prismaTraitLabel)
        }
        prismaWorkingSnapshot.topDesiredTraits = prismaTraitCollection
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplySocialPeerSingleRoleDescriptorSelectionMutation(_ prismaRoleDescriptorLabel: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        if prismaWorkingSnapshot.socialContext == prismaRoleDescriptorLabel {
            prismaWorkingSnapshot.socialContext = ""
        } else {
            prismaWorkingSnapshot.socialContext = prismaRoleDescriptorLabel
        }
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyDatingRedFlagsFreeformTextMutation(_ prismaIncomingBody: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.datingRedFlagsFreeformText = prismaIncomingBody
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyFriendshipCommunicationDifficultiesFreeformTextMutation(_ prismaIncomingBody: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.friendshipCommunicationDifficultiesFreeformText = prismaIncomingBody
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }
}
