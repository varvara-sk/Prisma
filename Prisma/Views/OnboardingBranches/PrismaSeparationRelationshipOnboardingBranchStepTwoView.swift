import SwiftUI

struct PrismaSeparationRelationshipOnboardingBranchStepTwoView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private var prismaCinematicLatchedNucleiTemporalCurationChamberedTwoColumnCurationLatchedGrid: [GridItem] {
        [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
        ]
    }

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .separationTellStory
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .kerning(0.15)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                Text(language == .russianCurationHuskLatchedMosaicNuclei
                    ? "Нам нужен короткий контекст, чтобы разбор был точнее и бережнее."
                    : "A short context helps us make the analysis more precise and gentle."
                )
                .font(.system(size: 15, weight: .regular, design: .default))
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
                .lineSpacing(3)
                PrismaOnboardingSharedGenderAgeOnlySurfaceView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel,
                    prismaCinematicLatchedNucleiExteriorPrimaryNucleiTitleOmissionChamberFlag: true
                )
                VStack(alignment: .leading, spacing: 12) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .separationWhoInit
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei
                            .primalCinematicLatchedNucleiInitiatorCurationDescriptorRowChamber(
                                userGender: prismaRelationshipOnboardingFlowViewModel
                                    .prismaMutableUserRelationshipProfileSnapshot
                                    .userGender
                            ), id: \.prismaCinematicLatchedNucleiPrimaryCurationTitle) { row in
                            let label = row.prismaCinematicLatchedNucleiPrimaryCurationTitle
                            let flag = prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                .prismaBreakupCinematicLatchedNucleiInitiatorAttributionSerializedGenuRawValue
                                == label
                            Button {
                                prismaRelationshipOnboardingFlowViewModel
                                    .prismaApplySeparationCinematicLatchedNucleiInitiatorAttributionPatternMutation(label)
                            } label: {
                                HStack(spacing: 12) {
                                    Image(systemName: row.prismaCinematicLatchedNucleiSymbolName)
                                        .font(.system(size: 18, weight: .semibold, design: .default))
                                        .frame(width: 24)
                                    Text(label)
                                        .font(.system(size: 16, weight: .medium, design: .default))
                                        .multilineTextAlignment(.leading)
                                    Spacer(minLength: 0)
                                }
                                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(16)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .stroke(
                                                PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(flag ? 0.9 : 0.18),
                                                lineWidth: flag ? 2 : 1
                                            )
                                    )
                                    .shadow(
                                        color: PrismaColors.prismaDashboardInsightsHIGNotionStyleCardDropShadowLuminanceFragment(
                                            prismaRuntimeActiveAppThemeComposition
                                        ),
                                        radius: 8,
                                        x: 0,
                                        y: 2
                                    )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .separationWhen
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    LazyVGrid(columns: prismaCinematicLatchedNucleiTemporalCurationChamberedTwoColumnCurationLatchedGrid, alignment: .leading, spacing: 10) {
                        ForEach(PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei
                            .primalCinematicLatchedNucleiElapsedTemporalCurationChamber, id: \.self) { label in
                            let flag = prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                .timeSinceBreakup == label
                            Button {
                                if prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                    .timeSinceBreakup
                                    == label
                                {
                                    prismaRelationshipOnboardingFlowViewModel
                                        .prismaApplyTimeSinceBreakupFreeformTextMutation("")
                                } else {
                                    prismaRelationshipOnboardingFlowViewModel
                                        .prismaApplyTimeSinceBreakupFreeformTextMutation(label)
                                }
                            } label: {
                                Text(label)
                                    .font(.system(size: 15, weight: .medium, design: .default))
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .padding(.horizontal, 8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .fill(
                                                flag
                                                    ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.3)
                                                    : PrismaColors.prismaDashboardContextSwitcherPillMutedChromeFillNucleus()
                                            )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(flag ? 0.55 : 0), lineWidth: 1.2)
                                    )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 120)
        }
    }
}
