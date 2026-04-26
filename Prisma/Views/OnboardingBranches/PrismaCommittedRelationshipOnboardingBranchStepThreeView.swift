import SwiftUI

struct PrismaCommittedRelationshipOnboardingBranchStepThreeView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private func prismaLivingFormatCurationLatchedChamberedNucleiRow(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> [(LivingStatus, String)] {
        language == .russianCurationHuskLatchedMosaicNuclei
            ? [(.sharedHouseholdTogether, "Живём вместе"), (.separateHouseholdsNearby, "Живём отдельно"), (.longDistanceRhythm, "На расстоянии")]
            : [(.sharedHouseholdTogether, "Living together"), (.separateHouseholdsNearby, "Living apart"), (.longDistanceRhythm, "Long distance")]
    }

    private func prismaLocalizedCommittedDurationLabel(
        _ storageLabel: String,
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        guard language == .russianCurationHuskLatchedMosaicNuclei else {
            return storageLabel
        }
        switch storageLabel {
        case "< 6 months": return "Меньше 6 месяцев"
        case "1–3 years": return "1–3 года"
        case "3+ years": return "Больше 3 лет"
        default: return storageLabel
        }
    }

    private func prismaLocalizedCommittedSharedTieLabel(
        _ storageLabel: String,
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        guard language == .russianCurationHuskLatchedMosaicNuclei else {
            return storageLabel
        }
        switch storageLabel {
        case "Shared children": return "Общие дети"
        case "Mortgage / Finances": return "Ипотека / финансы"
        case "Shared business": return "Общий бизнес"
        case "Pets": return "Питомцы"
        default: return storageLabel
        }
    }

    private let prismaBondingCurationLatchedGridColumnChamber: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .durationLogisticsHeader
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                VStack(alignment: .leading, spacing: 12) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .relDuration
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(PrismaCinematicLatchedNucleiCommittedRelationshipScenarioOnboardingDescriptorChamberLatchedCatalog
                            .prismaCinematicLatchedNucleiRelationshipDurationCurationChipLabeledNucleiRow, id: \.self) { label in
                            let prismaCinematicLatchedNucleiSelectedChamber = prismaRelationshipOnboardingFlowViewModel
                                .prismaMutableUserRelationshipProfileSnapshot
                                .relationshipDurationFreeformNarrativeText == label
                            Button {
                                if prismaCinematicLatchedNucleiSelectedChamber {
                                    prismaRelationshipOnboardingFlowViewModel
                                        .prismaApplyRelationshipDurationFreeformNarrativeTextMutation("")
                                } else {
                                    prismaRelationshipOnboardingFlowViewModel
                                        .prismaApplyRelationshipDurationFreeformNarrativeTextMutation(label)
                                }
                            } label: {
                                HStack(spacing: 6) {
                                    Text(prismaLocalizedCommittedDurationLabel(label, language))
                                        .font(.system(size: 14, weight: .medium, design: .default))
                                    if prismaCinematicLatchedNucleiSelectedChamber {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.system(size: 16, weight: .semibold, design: .default))
                                    }
                                }
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .padding(.vertical, 12)
                                .padding(.horizontal, 12)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(PrismaColors.prismaOnboardingSelectableSurfaceFillNucleus(
                                            prismaRuntimeActiveAppThemeComposition,
                                            selected: prismaCinematicLatchedNucleiSelectedChamber
                                        ))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .stroke(
                                            PrismaColors.prismaOnboardingSelectableStrokeNucleus(
                                                prismaRuntimeActiveAppThemeComposition,
                                                selected: prismaCinematicLatchedNucleiSelectedChamber
                                            ),
                                            lineWidth: prismaCinematicLatchedNucleiSelectedChamber ? 2 : 1
                                        )
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .livingFormat
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(prismaLivingFormatCurationLatchedChamberedNucleiRow(language), id: \.0) { row in
                            let prismaCinematicLatchedNucleiStatusChamber = row.0
                            let prismaCinematicLatchedNucleiLabelChamber = row.1
                            let prismaCinematicLatchedNucleiSelectedChamber = prismaRelationshipOnboardingFlowViewModel
                                .prismaMutableUserRelationshipProfileSnapshot.livingStatus
                                == prismaCinematicLatchedNucleiStatusChamber
                            Button {
                                prismaRelationshipOnboardingFlowViewModel
                                    .prismaApplyLivingStatusSelectionMutation(prismaCinematicLatchedNucleiStatusChamber)
                            } label: {
                                HStack(spacing: 6) {
                                    Text(prismaCinematicLatchedNucleiLabelChamber)
                                        .font(.system(size: 14, weight: .medium, design: .default))
                                        .multilineTextAlignment(.center)
                                    if prismaCinematicLatchedNucleiSelectedChamber {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.system(size: 16, weight: .semibold, design: .default))
                                    }
                                }
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .padding(.vertical, 12)
                                .padding(.horizontal, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(PrismaColors.prismaOnboardingSelectableSurfaceFillNucleus(
                                            prismaRuntimeActiveAppThemeComposition,
                                            selected: prismaCinematicLatchedNucleiSelectedChamber
                                        ))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .stroke(
                                            PrismaColors.prismaOnboardingSelectableStrokeNucleus(
                                                prismaRuntimeActiveAppThemeComposition,
                                                selected: prismaCinematicLatchedNucleiSelectedChamber
                                            ),
                                            lineWidth: prismaCinematicLatchedNucleiSelectedChamber ? 2 : 1
                                        )
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .sharedTies
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    LazyVGrid(columns: prismaBondingCurationLatchedGridColumnChamber, alignment: .leading, spacing: 10) {
                        ForEach(PrismaCinematicLatchedNucleiCommittedRelationshipScenarioOnboardingDescriptorChamberLatchedCatalog
                            .prismaCinematicLatchedNucleiMutualBondingCurationLatchedChamberedDescriptorNucleiRow) { descriptor in
                            let prismaCinematicLatchedNucleiSelectedChamber = prismaRelationshipOnboardingFlowViewModel
                                .prismaMutableUserRelationshipProfileSnapshot
                                .mutualBondingConnectionDescriptorTags
                                .contains(descriptor.id)
                            Button {
                                prismaRelationshipOnboardingFlowViewModel
                                    .prismaToggleMutualBondingConnectionDescriptorTagMutation(descriptor.id)
                            } label: {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack(alignment: .top) {
                                        Image(systemName: descriptor.prismaCinematicLatchedNucleiVectorMonochromeSFSymbolGlyphName)
                                            .font(.system(size: 18, weight: .semibold, design: .default))
                                            .symbolRenderingMode(.monochrome)
                                        Spacer(minLength: 0)
                                        if prismaCinematicLatchedNucleiSelectedChamber {
                                            Image(systemName: "checkmark.circle.fill")
                                                .font(.system(size: 16, weight: .semibold, design: .default))
                                        }
                                    }
                                    Text(prismaLocalizedCommittedSharedTieLabel(descriptor.id, language))
                                        .font(.system(size: 14, weight: .medium, design: .default))
                                        .multilineTextAlignment(.leading)
                                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                }
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .padding(14)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(PrismaColors.prismaOnboardingSelectableSurfaceFillNucleus(
                                            prismaRuntimeActiveAppThemeComposition,
                                            selected: prismaCinematicLatchedNucleiSelectedChamber
                                        ))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .stroke(
                                            PrismaColors.prismaOnboardingSelectableStrokeNucleus(
                                                prismaRuntimeActiveAppThemeComposition,
                                                selected: prismaCinematicLatchedNucleiSelectedChamber
                                            ),
                                            lineWidth: prismaCinematicLatchedNucleiSelectedChamber ? 2 : 1
                                        )
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(24)
            .padding(.bottom, 120)
        }
        .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
    }
}
