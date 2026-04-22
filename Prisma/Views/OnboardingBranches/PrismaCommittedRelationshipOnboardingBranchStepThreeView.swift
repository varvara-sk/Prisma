import SwiftUI

struct PrismaCommittedRelationshipOnboardingBranchStepThreeView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaLivingFormatCurationLatchedChamberedNucleiRow: [(LivingStatus, String)] = [
        (.sharedHouseholdTogether, "Living together"),
        (.separateHouseholdsNearby, "Living apart"),
        (.longDistanceRhythm, "Long distance"),
    ]

    private let prismaBondingCurationLatchedGridColumnChamber: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Duration, logistics & ties")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                VStack(alignment: .leading, spacing: 12) {
                    Text("Relationship duration")
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
                                    Text(label)
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
                                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .stroke(
                                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                                prismaCinematicLatchedNucleiSelectedChamber ? 0.7 : 0.14
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
                    Text("Living format")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(prismaLivingFormatCurationLatchedChamberedNucleiRow, id: \.0) { row in
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
                                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .stroke(
                                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                                prismaCinematicLatchedNucleiSelectedChamber ? 0.7 : 0.14
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
                    Text("Shared ties (select any)")
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
                                    Text(descriptor.id)
                                        .font(.system(size: 14, weight: .medium, design: .default))
                                        .multilineTextAlignment(.leading)
                                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                }
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .padding(14)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .stroke(
                                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                                prismaCinematicLatchedNucleiSelectedChamber ? 0.75 : 0.18
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
            .padding(.bottom, 8)
        }
        .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
    }
}
