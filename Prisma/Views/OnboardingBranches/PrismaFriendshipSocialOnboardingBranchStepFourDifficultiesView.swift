import SwiftUI

struct PrismaFriendshipSocialOnboardingBranchStepFourDifficultiesView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaCinematicFriendshipPeerLatchedNucleiFrictionCurationLatchedGridColumn: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
    ]

    init(prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel) {
        _prismaRelationshipOnboardingFlowViewModel = ObservedObject(
            wrappedValue: prismaRelationshipOnboardingFlowViewModel
        )
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("What are the main communication difficulties?")
                        .font(.system(size: 22, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Text("Сложности в общении")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
                LazyVGrid(
                    columns: prismaCinematicFriendshipPeerLatchedNucleiFrictionCurationLatchedGridColumn,
                    alignment: .leading,
                    spacing: 8
                ) {
                    ForEach(PrismaCinematicFriendshipPeerLatchedNucleiVettingCurationMosaicChamberCatalog
                        .prismaCinematicFriendshipPeerLatchedNucleiCommunicationFrictionCurationChamberLabeledNucleiMosaic,
                        id: \.self) { frictionCurationLatchedNucleiMosaic in
                        let frictionCurationLatchedMosaicIsSelected = prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .prismaCinematicFriendshipPeerLatchedNucleiFrictionCurationDescriptorTagCuration
                            .contains(frictionCurationLatchedNucleiMosaic)
                        Button {
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaAttemptFriendshipCinematicLatchedNucleiFrictionCurationKineticNucleiToggleMutation(
                                    desiredFriendshipCinematicLatchedNucleiFrictionCurationLabeledMosaic: frictionCurationLatchedNucleiMosaic
                                )
                        } label: {
                            HStack {
                                Text(frictionCurationLatchedNucleiMosaic)
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                Spacer(minLength: 0)
                                if frictionCurationLatchedMosaicIsSelected {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 15, weight: .semibold, design: .default))
                                }
                            }
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .padding(.vertical, 10)
                            .padding(.horizontal, 11)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(
                                        frictionCurationLatchedMosaicIsSelected
                                            ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.1)
                                            : Color.white
                                    )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(
                                        PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                            frictionCurationLatchedMosaicIsSelected ? 0.7 : 0.14
                                        ),
                                        lineWidth: frictionCurationLatchedMosaicIsSelected ? 2 : 1
                                    )
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Other (Optional)")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Text("Свой вариант")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    TextField(
                        "",
                        text: Binding(
                            get: {
                                prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                    .friendshipCommunicationDifficultiesFreeformText
                            },
                            set: { prismaRelationshipOnboardingFlowViewModel
                                .prismaApplyFriendshipCommunicationDifficultiesFreeformTextMutation($0) }
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
                            .fill(Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.16), lineWidth: 1)
                    )
                }
            }
            .padding(24)
            .padding(.bottom, 8)
        }
        .background(PrismaColors.prismaDashboardInsightsHIGCalmingOffWhiteCanvasChromaticNucleus())
    }
}
