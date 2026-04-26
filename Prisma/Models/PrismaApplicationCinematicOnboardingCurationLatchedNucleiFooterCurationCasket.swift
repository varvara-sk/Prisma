import Foundation

enum PrismaApplicationCinematicOnboardingCurationLatchedNucleiFooterCurationCasket: Sendable {
    static func prismaCinematicLatchedNucleiPrimaryCallToActionMosaic(
        currentWizardStepIndex: Int,
        activeGlobalMode: GlobalMode?,
        userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration,
        activeRelationshipOnboardingWizardTotalStepQuantity: Int
    ) -> String {
        let terminal = currentWizardStepIndex == activeRelationshipOnboardingWizardTotalStepQuantity - 1
        guard terminal, let mode = activeGlobalMode else {
            return PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .relationshipOnboardingNext
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        }
        switch mode {
        case .separationLettingGo, .committedRelationshipCare:
            return PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .relationshipOnboardingStartAnalysisWithSparkle
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        case .datingDiscovery:
            return userInterfaceActiveLanguage == .russianCurationHuskLatchedMosaicNuclei
                ? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .relationshipOnboardingStartAnalysis
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
                : PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .relationshipOnboardingStartAnalysisEnglish
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        case .communicationFriendshipAndPeers:
            return PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .relationshipOnboardingStartAnalysis
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
        }
    }
}
