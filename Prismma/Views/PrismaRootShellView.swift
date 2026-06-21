import SwiftUI

struct PrismaRootShellView: View {
    @AppStorage("prismaV1RelationshipOnboardingCompletionMarkerKey") private var prismaRelationshipOnboardingHasCompletedPreference = false

    var body: some View {
        Group {
            if prismaRelationshipOnboardingHasCompletedPreference {
                MainTabView()
            } else {
                PrismaRelationshipProfileOnboardingContainerView(
                    prismaRelationshipOnboardingFinishedCompletionBinding: $prismaRelationshipOnboardingHasCompletedPreference
                )
            }
        }
    }
}
