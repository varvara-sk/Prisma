import SwiftUI

struct PrismaDashboardHorizontalContextFacetSelectionStripView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Binding var prismaDashboardSelectedContextFacetIdentifierBinding: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration
    let prismaActivePrimaryUserProfileSnapshotForLabelFabrication: UserProfile
    let prismaArchivedScenarioLedgerEntryCollection: [PrismaArchivedUserScenarioLedgerEntry]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("О чём смотрим")
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            Text("Сначала выберите ситуацию — инсайты ниже не смешивают разные истории в одну.")
                .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    prismaFabricateContextSelectionCapsuleButton(
                        prismaLocalizedCapsuleTitle: prismaFabricateActivePrimaryContextCapsuleTitleLine(),
                        prismaSelectionTargetIdentifier: .activePrimaryUserProfileContextFacet
                    )
                    ForEach(prismaArchivedScenarioLedgerEntryCollection) { prismaLedgerEntry in
                        prismaFabricateContextSelectionCapsuleButton(
                            prismaLocalizedCapsuleTitle: prismaFabricateArchivedContextCapsuleTitleLine(prismaLedgerEntry),
                            prismaSelectionTargetIdentifier: .archivedLedgerEmbeddedSnapshotContextFacet(prismaLedgerEntry)
                        )
                    }
                }
                .padding(.vertical, 2)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
        .shadow(
            color: PrismaColors.prismaElevatedCardShadowColor(prismaRuntimeActiveAppThemeComposition),
            radius: prismaRuntimeActiveAppThemeComposition == .lightTranslucentLavender ? 10 : 14,
            x: 0,
            y: prismaRuntimeActiveAppThemeComposition == .lightTranslucentLavender ? 4 : 8
        )
    }

    private func prismaFabricateActivePrimaryContextCapsuleTitleLine() -> String {
        let prismaModeLabel = prismaActivePrimaryUserProfileSnapshotForLabelFabrication.globalMode?
            .prismaCompactRussianScenarioDescriptorLabel ?? "Сейчас"
        return "Сейчас · \(prismaModeLabel)"
    }

    private func prismaFabricateArchivedContextCapsuleTitleLine(
        _ prismaLedgerEntry: PrismaArchivedUserScenarioLedgerEntry
    ) -> String {
        let prismaModeLabel = prismaLedgerEntry.prismaEmbeddedUserProfileSnapshot.globalMode?
            .prismaCompactRussianScenarioDescriptorLabel ?? "Сохранено"
        let prismaShortDateFragment = prismaLedgerEntry.prismaScenarioCapturedTimestamp.formatted(date: .abbreviated, time: .omitted)
        return "\(prismaModeLabel) · \(prismaShortDateFragment)"
    }

    private func prismaFabricateContextSelectionCapsuleButton(
        prismaLocalizedCapsuleTitle: String,
        prismaSelectionTargetIdentifier: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration
    ) -> some View {
        let prismaIsCurrentlySelectedFlag = prismaDashboardSelectedContextFacetIdentifierBinding == prismaSelectionTargetIdentifier
        return Button {
            prismaDashboardSelectedContextFacetIdentifierBinding = prismaSelectionTargetIdentifier
        } label: {
            Text(prismaLocalizedCapsuleTitle)
                .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                .foregroundStyle(
                    prismaIsCurrentlySelectedFlag
                        ? PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition)
                        : PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition)
                )
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(
                    Capsule(style: .continuous)
                        .fill(
                            prismaIsCurrentlySelectedFlag
                                ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.35)
                                : PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.12)
                        )
                )
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(
                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(prismaIsCurrentlySelectedFlag ? 0.55 : 0.2),
                            lineWidth: 1
                        )
                )
        }
        .buttonStyle(.plain)
    }
}
