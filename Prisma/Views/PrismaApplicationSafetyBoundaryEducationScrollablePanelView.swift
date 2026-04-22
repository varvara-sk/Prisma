import SwiftUI

struct PrismaApplicationSafetyBoundaryEducationScrollablePanelView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Environment(\.dismiss) private var prismaSheetDismissEnvironmentAction

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 16) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .safetyDisclosure1
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .prismaComfortableMultilineReadableTextBlockModifierChain()
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .safetyDisclosure2
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .prismaComfortableMultilineReadableTextBlockModifierChain()
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .safetyDisclosure3
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .prismaComfortableMultilineReadableTextBlockModifierChain()
                }
                .padding(20)
            }
            .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
            .navigationTitle(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .profileSafetySheetTitle
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .doneKeyboard
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    ) {
                        prismaSheetDismissEnvironmentAction()
                    }
                    .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                    .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                }
            }
        }
    }
}
