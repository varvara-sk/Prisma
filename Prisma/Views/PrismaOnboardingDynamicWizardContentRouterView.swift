import SwiftUI

struct PrismaOnboardingDynamicWizardContentRouterView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel
    let prismaTargetWizardStepIndex: Int

    var body: some View {
        Group {
            let prismaOptionalGlobalMode = prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.globalMode
            let prismaScenarioStepIndex = prismaTargetWizardStepIndex - PrismaRelationshipOnboardingFlowViewModel
                .prismaRelationshipOnboardingPreludeStepQuantity
            switch (prismaOptionalGlobalMode, prismaScenarioStepIndex) {
            case (.some(.committedRelationshipCare), 1):
                PrismaCommittedRelationshipOnboardingBranchStepTwoView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.committedRelationshipCare), 2):
                PrismaCommittedRelationshipOnboardingBranchStepThreeView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.committedRelationshipCare), 3):
                PrismaCommittedRelationshipOnboardingBranchStepFourView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.committedRelationshipCare), 4):
                PrismaCommittedRelationshipOnboardingBranchStepFiveTemperatureView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.separationLettingGo), 1):
                PrismaSeparationRelationshipOnboardingBranchStepTwoView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.separationLettingGo), 2):
                PrismaSeparationRelationshipOnboardingBranchStepThreeView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.separationLettingGo), 3):
                PrismaSeparationRelationshipOnboardingBranchStepFourView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.separationLettingGo), 4):
                PrismaSeparationRelationshipOnboardingBranchStepFiveGoalView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.datingDiscovery), 1):
                PrismaDatingDiscoveryOnboardingBranchStepTwoView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.datingDiscovery), 2):
                PrismaDatingDiscoveryOnboardingBranchStepFourRedFlagsView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.communicationFriendshipAndPeers), 1):
                PrismaFriendshipSocialOnboardingBranchStepTwoView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            case (.some(.communicationFriendshipAndPeers), 2):
                PrismaFriendshipSocialOnboardingBranchStepFourDifficultiesView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                )
            default:
                Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
