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

    var prismaActiveRelationshipOnboardingWizardTotalStepQuantity: Int {
        switch prismaMutableUserRelationshipProfileSnapshot.globalMode {
        case .some(.datingDiscovery), .some(.communicationFriendshipAndPeers):
            return 3
        default:
            return Self.prismaRelationshipOnboardingWizardTotalStepQuantity
        }
    }

    var prismaActiveRelationshipOnboardingTerminalStepIndex: Int {
        prismaActiveRelationshipOnboardingWizardTotalStepQuantity - 1
    }

    @Published var prismaMutableUserRelationshipProfileSnapshot: UserProfile
    @Published private(set) var prismaCurrentRelationshipOnboardingWizardStepIndex: Int
    @Published private(set) var prismaTransientRelationshipOnboardingSubmissionLoadingFlag: Bool

    init() {
        let prismaMergedApplicationIdentitySnapshotStem = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaFabricateMergedUserProfileSnapshotAssimilatingLegacyIsolatedApplicationTabKeysIfNeeded()
        prismaMutableUserRelationshipProfileSnapshot = UserProfile(
            globalMode: nil,
            userGender: prismaMergedApplicationIdentitySnapshotStem.userGender,
            userAgeFreeformInputText: prismaMergedApplicationIdentitySnapshotStem.userAgeFreeformInputText,
            prismaPreferredCallsignForUserInterfaceDisplay: prismaMergedApplicationIdentitySnapshotStem
                .prismaPreferredCallsignForUserInterfaceDisplay,
            prismaUserProfileRelationshipStatusFacetSerializedRawValue: prismaMergedApplicationIdentitySnapshotStem
                .prismaUserProfileRelationshipStatusFacetSerializedRawValue,
            prismaAttachmentStylePreferenceEnumerationSerializedRawValue: prismaMergedApplicationIdentitySnapshotStem
                .prismaAttachmentStylePreferenceEnumerationSerializedRawValue,
            prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection: prismaMergedApplicationIdentitySnapshotStem
                .prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection,
            prismaAIResponsePersonalizationNoteFreeformText: prismaMergedApplicationIdentitySnapshotStem
                .prismaAIResponsePersonalizationNoteFreeformText
        )
        prismaCurrentRelationshipOnboardingWizardStepIndex = 0
        prismaTransientRelationshipOnboardingSubmissionLoadingFlag = false
    }

    var prismaOnboardingBypassIdentityDemographicsCaptureSurfaceBecauseMergedProfileContainsMinimumFieldsFlag: Bool {
        let prismaSnapshot = prismaMutableUserRelationshipProfileSnapshot
        return prismaSnapshot.userGender != "Не указан"
            && !prismaSnapshot.userAgeFreeformInputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var prismaPrimaryFooterAdvancementCallToActionTitle: String {
        let prismaIsTerminalWizardStepLatchedChamberedFlag = prismaCurrentRelationshipOnboardingWizardStepIndex
            == prismaActiveRelationshipOnboardingTerminalStepIndex
        if prismaIsTerminalWizardStepLatchedChamberedFlag, prismaMutableUserRelationshipProfileSnapshot.globalMode == .separationLettingGo {
            return "✨ Начать анализ"
        }
        if prismaIsTerminalWizardStepLatchedChamberedFlag, prismaMutableUserRelationshipProfileSnapshot.globalMode == .committedRelationshipCare {
            return "Start Analysis"
        }
        if prismaIsTerminalWizardStepLatchedChamberedFlag, prismaMutableUserRelationshipProfileSnapshot.globalMode == .datingDiscovery {
            return "Start Analysis"
        }
        if prismaIsTerminalWizardStepLatchedChamberedFlag, prismaMutableUserRelationshipProfileSnapshot.globalMode
            == .communicationFriendshipAndPeers
        {
            return "Начать анализ"
        }
        if prismaIsTerminalWizardStepLatchedChamberedFlag { return "Начать анализ" }
        return "Далее"
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
            return prismaEvaluateWizardStepThreeForwardEligibilityForGlobalMode(prismaSnapshot, prismaActiveGlobalMode)
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
            let prismaCinematicLatchedNucleiAgeCurationNonVacuousChamberFlag = !prismaSnapshot.userAgeFreeformInputText
                .trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            let prismaCinematicLatchedNucleiDemographicBypassCurationChamberFlag = prismaSnapshot.userGender != "Не указан"
                && !prismaSnapshot.userAgeFreeformInputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            let prismaCinematicLatchedNucleiIdentityCurationReadyChamberFlag = prismaGenderReadyFlag
                && (prismaCinematicLatchedNucleiDemographicBypassCurationChamberFlag
                    || prismaCinematicLatchedNucleiAgeCurationNonVacuousChamberFlag)
            if prismaDynamicsPreset == .userDefinedFreeformNarrative {
                let prismaTrimmedCustomBody = prismaSnapshot.dynamicsCustomUserAuthoredNarrativeText
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                return prismaCinematicLatchedNucleiIdentityCurationReadyChamberFlag && !prismaTrimmedCustomBody.isEmpty
            }
            return prismaCinematicLatchedNucleiIdentityCurationReadyChamberFlag
        case .datingDiscovery:
            return prismaGenderReadyFlag && prismaSnapshot.topDesiredTraits.count == 3
        case .communicationFriendshipAndPeers:
            return !prismaSnapshot.socialContext.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        case .separationLettingGo:
            let prismaCinematicLatchedNucleiAgeCurationNonVacuousChamberFlag = !prismaSnapshot.userAgeFreeformInputText
                .trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            let prismaCinematicLatchedNucleiDemographicBypassCurationChamberFlag = prismaSnapshot.userGender != "Не указан"
                && !prismaSnapshot.userAgeFreeformInputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            return prismaGenderReadyFlag
                && (prismaCinematicLatchedNucleiDemographicBypassCurationChamberFlag
                    || prismaCinematicLatchedNucleiAgeCurationNonVacuousChamberFlag)
                && !prismaSnapshot.prismaBreakupCinematicLatchedNucleiInitiatorAttributionSerializedGenuRawValue
                .trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                && !prismaSnapshot.timeSinceBreakup.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    }

    private func prismaEvaluateWizardStepTwoForwardEligibilityForGlobalMode(
        _ prismaSnapshot: UserProfile,
        _ prismaMode: GlobalMode
    ) -> Bool {
        switch prismaMode {
        case .committedRelationshipCare:
            let prismaCinematicLatchedNucleiDurationCurationNonVacuousChamberFlag = !prismaSnapshot
                .relationshipDurationFreeformNarrativeText
                .trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            return prismaCinematicLatchedNucleiDurationCurationNonVacuousChamberFlag
                && prismaSnapshot.livingStatus != nil
        case .separationLettingGo:
            return !prismaSnapshot.prismaPostBreakupCinematicLatchedNucleiInterpersonalContactRhythmSerializedGenuKey
                .trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        case .datingDiscovery:
            return true
        case .communicationFriendshipAndPeers:
            return true
        }
    }

    private func prismaEvaluateWizardStepThreeForwardEligibilityForGlobalMode(
        _ prismaSnapshot: UserProfile,
        _ prismaMode: GlobalMode
    ) -> Bool {
        switch prismaMode {
        case .separationLettingGo:
            let prismaCinematicLatchedNucleiCurationDescriptorCurationCurationCountChamber = prismaSnapshot
                .partnerConflictStyleDescriptorTags.count
            return prismaCinematicLatchedNucleiCurationDescriptorCurationCurationCountChamber >= 1
                && prismaCinematicLatchedNucleiCurationDescriptorCurationCurationCountChamber <= 2
        case .committedRelationshipCare:
            return !prismaSnapshot.partnerConflictStyleDescriptorTags.isEmpty
        case .datingDiscovery, .communicationFriendshipAndPeers:
            return true
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
        let prismaLastStepIndexValue = prismaActiveRelationshipOnboardingTerminalStepIndex
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
            let prismaPreservedRelationshipStatusFragment = prismaWorkingSnapshot.prismaUserProfileRelationshipStatusFacetSerializedRawValue
            let prismaPreservedEmpathyTagKeyCollectionFragment = prismaWorkingSnapshot
                .prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection
            prismaWorkingSnapshot = UserProfile(
                globalMode: prismaIncomingGlobalMode,
                userGender: prismaPreservedGenderLabel,
                userAgeFreeformInputText: prismaPreservedAgeText,
                prismaPreferredCallsignForUserInterfaceDisplay: prismaPreservedCallsignFragment,
                prismaUserProfileRelationshipStatusFacetSerializedRawValue: prismaPreservedRelationshipStatusFragment,
                prismaAttachmentStylePreferenceEnumerationSerializedRawValue: prismaPreservedAttachmentRawFragment,
                prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection: prismaPreservedEmpathyTagKeyCollectionFragment,
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

    func prismaAttemptDatingVettingCategoricalRedFlagNucleiDescriptorKineticToggleMutation(
        desiredDatingVettingCategoricalRedFlagCurationLabeledNucleiDescriptor: String
    ) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        var prismaNucleiWorkingDescriptorCollection = prismaWorkingSnapshot
            .prismaCinematicDatingRedFlagCurationVettingDescriptorTagNucleiCollection
        if let prismaExistingRedFlagCurationNucleiIndex = prismaNucleiWorkingDescriptorCollection
            .firstIndex(of: desiredDatingVettingCategoricalRedFlagCurationLabeledNucleiDescriptor) {
            prismaNucleiWorkingDescriptorCollection.remove(at: prismaExistingRedFlagCurationNucleiIndex)
        } else {
            prismaNucleiWorkingDescriptorCollection.append(desiredDatingVettingCategoricalRedFlagCurationLabeledNucleiDescriptor)
        }
        prismaWorkingSnapshot.prismaCinematicDatingRedFlagCurationVettingDescriptorTagNucleiCollection =
            prismaNucleiWorkingDescriptorCollection
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyFriendshipCommunicationDifficultiesFreeformTextMutation(_ prismaIncomingBody: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.friendshipCommunicationDifficultiesFreeformText = prismaIncomingBody
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaAttemptFriendshipCinematicLatchedNucleiFrictionCurationKineticNucleiToggleMutation(
        desiredFriendshipCinematicLatchedNucleiFrictionCurationLabeledMosaic: String
    ) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        var prismaNucleiWorkingCollection = prismaWorkingSnapshot
            .prismaCinematicFriendshipPeerLatchedNucleiFrictionCurationDescriptorTagCuration
        if let prismaCinematicLatchedNucleiExistingCurationMosaic = prismaNucleiWorkingCollection
            .firstIndex(of: desiredFriendshipCinematicLatchedNucleiFrictionCurationLabeledMosaic) {
            prismaNucleiWorkingCollection.remove(at: prismaCinematicLatchedNucleiExistingCurationMosaic)
        } else {
            prismaNucleiWorkingCollection.append(desiredFriendshipCinematicLatchedNucleiFrictionCurationLabeledMosaic)
        }
        prismaWorkingSnapshot.prismaCinematicFriendshipPeerLatchedNucleiFrictionCurationDescriptorTagCuration =
            prismaNucleiWorkingCollection
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplySeparationCinematicLatchedNucleiInitiatorAttributionPatternMutation(
        _ prismaIncomingInitiatorCurationLabeledNucleiRow: String
    ) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        if prismaWorkingSnapshot.prismaBreakupCinematicLatchedNucleiInitiatorAttributionSerializedGenuRawValue
            == prismaIncomingInitiatorCurationLabeledNucleiRow
        {
            prismaWorkingSnapshot.prismaBreakupCinematicLatchedNucleiInitiatorAttributionSerializedGenuRawValue = ""
        } else {
            prismaWorkingSnapshot.prismaBreakupCinematicLatchedNucleiInitiatorAttributionSerializedGenuRawValue =
                prismaIncomingInitiatorCurationLabeledNucleiRow
        }
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyPostBreakupCinematicLatchedNucleiInterpersonalContactRhythmMutation(
        _ prismaIncomingContactCurationPrimaryLabeledNucleiKey: String
    ) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        if prismaWorkingSnapshot.prismaPostBreakupCinematicLatchedNucleiInterpersonalContactRhythmSerializedGenuKey
            == prismaIncomingContactCurationPrimaryLabeledNucleiKey
        {
            prismaWorkingSnapshot.prismaPostBreakupCinematicLatchedNucleiInterpersonalContactRhythmSerializedGenuKey = ""
        } else {
            prismaWorkingSnapshot.prismaPostBreakupCinematicLatchedNucleiInterpersonalContactRhythmSerializedGenuKey =
                prismaIncomingContactCurationPrimaryLabeledNucleiKey
        }
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaAttemptPostSeparationCinematicDualCapPartnerNucleusLatchedChamberedTagToggleMutation(
        desiredCinematicLatchedNucleiPartnerCurationLabeledNucleiDescriptor: String
    ) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        var prismaWorkingCurationCollection = prismaWorkingSnapshot.partnerConflictStyleDescriptorTags
        if let prismaCinematicLatchedNucleiExistingCurationChamberedIndex = prismaWorkingCurationCollection
            .firstIndex(of: desiredCinematicLatchedNucleiPartnerCurationLabeledNucleiDescriptor) {
            prismaWorkingCurationCollection.remove(at: prismaCinematicLatchedNucleiExistingCurationChamberedIndex)
        } else {
            if prismaWorkingCurationCollection.count >= 2 { return }
            prismaWorkingCurationCollection.append(desiredCinematicLatchedNucleiPartnerCurationLabeledNucleiDescriptor)
        }
        prismaWorkingSnapshot.partnerConflictStyleDescriptorTags = prismaWorkingCurationCollection
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }
}
