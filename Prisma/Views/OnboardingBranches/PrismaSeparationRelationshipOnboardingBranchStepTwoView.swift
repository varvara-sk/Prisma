import SwiftUI

struct PrismaSeparationRelationshipOnboardingBranchStepTwoView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private var prismaCinematicLatchedNucleiTemporalCurationChamberedTwoColumnCurationLatchedGrid: [GridItem] {
        [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10),
        ]
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Расскажи, как всё прошло")
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .kerning(0.15)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                PrismaOnboardingSharedGenderAgeOnlySurfaceView(
                    prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel,
                    prismaCinematicLatchedNucleiExteriorPrimaryNucleiTitleOmissionChamberFlag: true
                )
                VStack(alignment: .leading, spacing: 12) {
                    Text("Кто стал инициатором?")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei
                            .primalCinematicLatchedNucleiInitiatorCurationDescriptorRowChamber, id: \.self) { label in
                            let flag = prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                .prismaBreakupCinematicLatchedNucleiInitiatorAttributionSerializedGenuRawValue
                                == label
                            Button {
                                prismaRelationshipOnboardingFlowViewModel
                                    .prismaApplySeparationCinematicLatchedNucleiInitiatorAttributionPatternMutation(label)
                            } label: {
                                Text(label)
                                    .font(.system(size: 16, weight: .medium, design: .default))
                                    .multilineTextAlignment(.leading)
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
                    Text("Как давно это случилось?")
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
            .padding(.bottom, 24)
        }
    }
}
