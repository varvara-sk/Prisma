import SwiftUI

struct PrismaDatingDiscoveryOnboardingBranchStepFourRedFlagsView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaDatingVettingRedFlagCurationLatchedGridColumn: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
    ]

    init(prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel) {
        _prismaRelationshipOnboardingFlowViewModel = ObservedObject(
            wrappedValue: prismaRelationshipOnboardingFlowViewModel
        )
    }

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .redFlagsHeader
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                }
                LazyVGrid(
                    columns: prismaDatingVettingRedFlagCurationLatchedGridColumn,
                    alignment: .leading,
                    spacing: 8
                ) {
                    ForEach(PrismaCinematicDatingVettingPartnerPriorityAndRedFlagChamberLatchedCatalog
                        .prismaCinematicDatingVettingRedFlagCurationLatchedMosaicChamberMosaic) { redFlagCurationLatchedMosaicNuclei in
                        let redFlagCurationLabeledMosaic = redFlagCurationLatchedMosaicNuclei.id
                        let redFlagCurationMosaicIsSelected = prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .prismaCinematicDatingRedFlagCurationVettingDescriptorTagNucleiCollection
                            .contains(redFlagCurationLabeledMosaic)
                        Button {
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaAttemptDatingVettingCategoricalRedFlagNucleiDescriptorKineticToggleMutation(
                                    desiredDatingVettingCategoricalRedFlagCurationLabeledNucleiDescriptor: redFlagCurationLabeledMosaic
                                )
                        } label: {
                            HStack {
                                Text(PrismaApplicationCinematicDatingCurationLatchedNucleiLabelLocalizationCasket
                                    .prismaCinematicLatchedNucleiDatingRedFlagCurationLabeledMosaic(
                                        redFlagStorageStabilityId: redFlagCurationLabeledMosaic,
                                        language
                                    )
                                )
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                Spacer(minLength: 0)
                                if redFlagCurationMosaicIsSelected {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 15, weight: .semibold, design: .default))
                                }
                            }
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .padding(.vertical, 11)
                            .padding(.horizontal, 12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(PrismaColors.prismaOnboardingSelectableSurfaceFillNucleus(
                                        prismaRuntimeActiveAppThemeComposition,
                                        selected: redFlagCurationMosaicIsSelected
                                    ))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(
                                        PrismaColors.prismaOnboardingSelectableStrokeNucleus(
                                            prismaRuntimeActiveAppThemeComposition,
                                            selected: redFlagCurationMosaicIsSelected
                                        ),
                                        lineWidth: redFlagCurationMosaicIsSelected ? 2 : 1
                                    )
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .redFlagsOther
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    TextField(
                        "",
                        text: Binding(
                            get: {
                                prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                    .datingRedFlagsFreeformText
                            },
                            set: { prismaRelationshipOnboardingFlowViewModel.prismaApplyDatingRedFlagsFreeformTextMutation($0) }
                        )
                    )
                    .textInputAutocapitalization(.sentences)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.16), lineWidth: 1)
                    )
                }
            }
            .padding(24)
            .padding(.bottom, 120)
        }
        .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
    }
}
