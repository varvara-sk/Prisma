import SwiftUI

struct PrismaFriendshipSocialOnboardingBranchStepTwoView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            PrismaOnboardingSharedGenderAgeOnlySurfaceView(
                prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
            )
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }
}
