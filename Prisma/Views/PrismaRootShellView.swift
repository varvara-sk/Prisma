import SwiftUI

struct PrismaRootShellView: View {
    @AppStorage("prismaV1RelationshipOnboardingCompletionMarkerKey") private var prismaRelationshipOnboardingHasCompletedPreference = false
    @AppStorage("appTheme") private var prismaApplicationThemeUserDefaultsSerializedRawValue = AppTheme.darkLavender.rawValue

    private var prismaSynthesizedRuntimeThemeDescriptorFromPersistentPreference: AppTheme {
        AppTheme(rawValue: prismaApplicationThemeUserDefaultsSerializedRawValue) ?? .darkLavender
    }

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
        .environment(\.prismaRuntimeActiveAppThemeComposition, prismaSynthesizedRuntimeThemeDescriptorFromPersistentPreference)
        .preferredColorScheme(prismaSynthesizedRuntimeThemeDescriptorFromPersistentPreference.prismaDerivedPreferredAppleSystemColorSchemeValue)
    }
}
