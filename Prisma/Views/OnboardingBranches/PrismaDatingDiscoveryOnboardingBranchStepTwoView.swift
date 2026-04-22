import SwiftUI

struct PrismaDatingDiscoveryOnboardingBranchStepTwoView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaDatingVettingGridColumnCuration: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]

    init(prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel) {
        _prismaRelationshipOnboardingFlowViewModel = ObservedObject(
            wrappedValue: prismaRelationshipOnboardingFlowViewModel
        )
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("What is most important in a partner?")
                        .font(.system(size: 22, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Text(
                        "Select exactly 3 priorities. (Note: Your age & gender are automatically applied from your global profile)."
                    )
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
                LazyVGrid(columns: prismaDatingVettingGridColumnCuration, alignment: .leading, spacing: 10) {
                    ForEach(PrismaCinematicDatingVettingPartnerPriorityAndRedFlagChamberLatchedCatalog
                        .prismaCinematicDatingVettingPriorityCurationLatchedChamberMosaic) { row in
                        let prismaTraitLabelCurationMosaic = row.id
                        let prismaTraitSelectedCurationMosaic = prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .topDesiredTraits
                            .contains(prismaTraitLabelCurationMosaic)
                        let prismaTraitTripleSealedCurationMosaic = prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .topDesiredTraits
                            .count >= 3
                        let prismaTraitUnselectedDimmedCurationMosaic = prismaTraitTripleSealedCurationMosaic
                            && !prismaTraitSelectedCurationMosaic
                        Button {
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaApplyDatingPriorityTripleTraitSelectionMutation(prismaTraitLabelCurationMosaic)
                        } label: {
                            HStack(alignment: .center, spacing: 10) {
                                Image(systemName: row.prismaCinematicDatingVettingMonochromeSFSymbolGlyphName)
                                    .font(.system(size: 18, weight: .semibold, design: .default))
                                    .symbolRenderingMode(.monochrome)
                                Text(row.id)
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.85)
                                Spacer(minLength: 0)
                                if prismaTraitSelectedCurationMosaic {
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
                                    .fill(
                                        prismaTraitSelectedCurationMosaic
                                            ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.1)
                                            : Color.white
                                    )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(
                                        PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                            prismaTraitSelectedCurationMosaic ? 0.7 : 0.14
                                        ),
                                        lineWidth: prismaTraitSelectedCurationMosaic ? 2 : 1
                                    )
                            )
                            .opacity(prismaTraitUnselectedDimmedCurationMosaic ? 0.42 : 1.0)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(24)
            .padding(.bottom, 8)
        }
        .background(PrismaColors.prismaDashboardInsightsHIGCalmingOffWhiteCanvasChromaticNucleus())
    }
}
