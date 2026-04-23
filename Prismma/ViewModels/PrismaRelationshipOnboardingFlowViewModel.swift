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
        switch prismaCurrentRelationshipOnboardingWizardStepIndex {
        case 0:
            return prismaMutableUserRelationshipProfileSnapshot.globalMode != nil
        case 1:
            let prismaGenderSelectionValidFlag = prismaMutableUserRelationshipProfileSnapshot.userGender != "Не указан"
            let prismaDynamicsSelectionValidFlag = prismaMutableUserRelationshipProfileSnapshot.dynamics != nil
            return prismaGenderSelectionValidFlag && prismaDynamicsSelectionValidFlag
        case 2:
            let prismaDurationSelectionValidFlag = prismaMutableUserRelationshipProfileSnapshot.duration != nil
            let prismaLivingSelectionValidFlag = prismaMutableUserRelationshipProfileSnapshot.livingStatus != nil
            return prismaDurationSelectionValidFlag && prismaLivingSelectionValidFlag
        case 3:
            let prismaTagQuantity = prismaMutableUserRelationshipProfileSnapshot.partnerReactionTags.count
            return prismaTagQuantity >= 1 && prismaTagQuantity <= 2
        default:
            return false
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

    func prismaAttemptPartnerReactionTagSelectionMutation(desiredPartnerReactionTagDisplayLabel: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        var prismaWorkingPartnerReactionTagCollection = prismaWorkingSnapshot.partnerReactionTags
        if let prismaExistingTagIndex = prismaWorkingPartnerReactionTagCollection.firstIndex(of: desiredPartnerReactionTagDisplayLabel) {
            prismaWorkingPartnerReactionTagCollection.remove(at: prismaExistingTagIndex)
        } else if prismaWorkingPartnerReactionTagCollection.count < 2 {
            prismaWorkingPartnerReactionTagCollection.append(desiredPartnerReactionTagDisplayLabel)
        } else {
            prismaWorkingPartnerReactionTagCollection.removeFirst()
            prismaWorkingPartnerReactionTagCollection.append(desiredPartnerReactionTagDisplayLabel)
        }
        prismaWorkingSnapshot.partnerReactionTags = prismaWorkingPartnerReactionTagCollection
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyGlobalModeSelectionMutation(_ prismaIncomingGlobalMode: GlobalMode) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.globalMode = prismaIncomingGlobalMode
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyUserGenderSelectionMutation(_ prismaIncomingGenderLabel: String) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.userGender = prismaIncomingGenderLabel
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyUserAgeSliderMutation(_ prismaIncomingAgeValue: Int) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.userAge = prismaIncomingAgeValue
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyRelationshipDynamicsSelectionMutation(_ prismaIncomingDynamics: RelationshipDynamics) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.dynamics = prismaIncomingDynamics
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyRelationshipDurationSelectionMutation(_ prismaIncomingDuration: RelationshipDuration) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.duration = prismaIncomingDuration
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplyLivingStatusSelectionMutation(_ prismaIncomingLivingStatus: LivingStatus) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.livingStatus = prismaIncomingLivingStatus
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }

    func prismaApplySharedObligationsToggleMutation(_ prismaIncomingObligationsFlag: Bool) {
        var prismaWorkingSnapshot = prismaMutableUserRelationshipProfileSnapshot
        prismaWorkingSnapshot.hasObligations = prismaIncomingObligationsFlag
        prismaMutableUserRelationshipProfileSnapshot = prismaWorkingSnapshot
    }
}
