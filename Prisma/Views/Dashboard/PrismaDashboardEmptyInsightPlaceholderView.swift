import SwiftUI

struct PrismaDashboardEmptyInsightPlaceholderView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaNavigateToChatConversationTabAction: () -> Void

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        VStack(spacing: 20) {
            Image(systemName: "sparkles")
                .font(PrismaTypography.prismaEmptyStateHeroOrnamentalSymbolDimensionalLargeTitleRoundedMedium)
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                .symbolRenderingMode(.hierarchical)
            Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardEmptyInsightsPlaceholderBody
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
            )
            .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
            .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
            .multilineTextAlignment(.leading)
            .lineSpacing(4)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, 24)
            Button(action: prismaNavigateToChatConversationTabAction) {
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardStartAnalysisEmpty
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                .font(PrismaTypography.prismaCallToActionPrimaryEmphasisBodyRoundedSemibold)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                )
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 32)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
