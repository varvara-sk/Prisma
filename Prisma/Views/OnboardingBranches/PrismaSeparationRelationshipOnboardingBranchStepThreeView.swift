import SwiftUI

struct PrismaSeparationRelationshipOnboardingBranchStepThreeView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Вы сейчас общаетесь?")
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .kerning(0.12)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(
                        PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei
                            .primalCinematicLatchedNucleiPostInterpersonalCurationLatchedCardRow,
                        id: \.prismaCinematicLatchedNucleiPrimaryCurationTitle
                    ) { card in
                        let title = card.prismaCinematicLatchedNucleiPrimaryCurationTitle
                        let selected = prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                            .prismaPostBreakupCinematicLatchedNucleiInterpersonalContactRhythmSerializedGenuKey
                            == title
                        Button {
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaApplyPostBreakupCinematicLatchedNucleiInterpersonalContactRhythmMutation(title)
                        } label: {
                            HStack(alignment: .center, spacing: 12) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(title)
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                        .multilineTextAlignment(.leading)
                                    Text(card.prismaCinematicLatchedNucleiSecondaryCurationNucleiSubtitle)
                                        .font(.system(size: 14, weight: .regular, design: .default))
                                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(2)
                                }
                                Spacer(minLength: 0)
                                Image(systemName: selected ? "checkmark.circle.fill" : "circle")
                                    .font(.title3)
                                    .foregroundStyle(
                                        selected
                                            ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition)
                                            : Color(.systemGray4)
                                    )
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                            )
                            .shadow(
                                color: PrismaColors.prismaDashboardInsightsHIGNotionStyleCardDropShadowLuminanceFragment(
                                    prismaRuntimeActiveAppThemeComposition
                                ),
                                radius: 10,
                                x: 0,
                                y: 3
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 120)
        }
    }
}
