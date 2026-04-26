import SwiftUI

struct PrismaFriendshipSocialOnboardingBranchStepTwoView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaCinematicFriendshipPeerLatchedNucleiGridColumnCuration: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
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
                        .friendshipRoleTitle
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .friendshipRoleSub
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
                LazyVGrid(
                    columns: prismaCinematicFriendshipPeerLatchedNucleiGridColumnCuration,
                    alignment: .leading,
                    spacing: 10
                ) {
                    ForEach(PrismaCinematicFriendshipPeerLatchedNucleiVettingCurationMosaicChamberCatalog
                        .prismaCinematicFriendshipPeerLatchedNucleiPeerSocialRoleCurationMosaic) { row in
                        let prismaCinematicLatchedNucleiRoleCurationMosaic = row.id
                        let prismaCinematicLatchedNucleiRoleCurationMosaicIsSelected = prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .socialContext == prismaCinematicLatchedNucleiRoleCurationMosaic
                        Button {
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaApplySocialPeerSingleRoleDescriptorSelectionMutation(
                                    prismaCinematicLatchedNucleiRoleCurationMosaic
                                )
                        } label: {
                            HStack(alignment: .center, spacing: 10) {
                                Image(systemName: row.prismaCinematicFriendshipPeerLatchedNucleiMonochromeSFSymbolGlyphName)
                                    .font(.system(size: 18, weight: .semibold, design: .default))
                                    .symbolRenderingMode(.monochrome)
                                Text(PrismaApplicationCinematicFriendshipCurationLatchedNucleiLabelLocalizationCasket
                                    .prismaCinematicLatchedNucleiSocialRoleCurationLabeledMosaic(
                                        roleStorageStabilityId: row.id,
                                        language
                                    )
                                )
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                Spacer(minLength: 0)
                                if prismaCinematicLatchedNucleiRoleCurationMosaicIsSelected {
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
                                        prismaCinematicLatchedNucleiRoleCurationMosaicIsSelected
                                            ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.1)
                                            : PrismaColors.surface(prismaRuntimeActiveAppThemeComposition)
                                    )
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(
                                        PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                            prismaCinematicLatchedNucleiRoleCurationMosaicIsSelected ? 0.7 : 0.14
                                        ),
                                        lineWidth: prismaCinematicLatchedNucleiRoleCurationMosaicIsSelected ? 2 : 1
                                    )
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(24)
            .padding(.bottom, 8)
        }
        .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
    }
}
