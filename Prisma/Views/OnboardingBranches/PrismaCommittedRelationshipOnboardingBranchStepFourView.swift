import SwiftUI

struct PrismaCommittedRelationshipOnboardingBranchStepFourView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private var prismaCurationLatchedPartnerConflictNucleiGridChamber: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]

    init(prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel) {
        _prismaRelationshipOnboardingFlowViewModel = ObservedObject(
            wrappedValue: prismaRelationshipOnboardingFlowViewModel
        )
    }

    private func prismaLocalizedCommittedConflictLabel(
        _ storageLabel: String,
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        guard language == .russianCurationHuskLatchedMosaicNuclei else {
            return storageLabel
        }
        switch storageLabel {
        case "Explosive": return "Взрывается"
        case "Avoidant / Silent": return "Избегает / молчит"
        case "Defensive / Blames": return "Защищается / обвиняет"
        case "Ultra-logical": return "Уходит в логику"
        case "Collaborative": return "Пытается обсудить"
        default: return storageLabel
        }
    }

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .partnerConflictTitle
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .partnerConflictSub
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                LazyVGrid(columns: prismaCurationLatchedPartnerConflictNucleiGridChamber, alignment: .leading, spacing: 10) {
                    ForEach(PrismaCinematicLatchedNucleiCommittedRelationshipScenarioOnboardingDescriptorChamberLatchedCatalog
                        .prismaCinematicLatchedNucleiCommittedCohabitingRelationshipPartnerConflictCurationChamber) { row in
                        let prismaCinematicLatchedNucleiTagChamber = row.id
                        let prismaCinematicLatchedNucleiSelectedChamber = prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .partnerConflictStyleDescriptorTags
                            .contains(prismaCinematicLatchedNucleiTagChamber)
                        Button {
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaAttemptPartnerConflictStyleDescriptorTagToggleMutation(
                                    desiredPartnerReactionTagDisplayLabel: prismaCinematicLatchedNucleiTagChamber
                                )
                        } label: {
                            VStack(alignment: .center, spacing: 10) {
                                Image(systemName: row.prismaCinematicLatchedNucleiVectorMonochromeSFSymbolGlyphName)
                                    .font(.system(size: 22, weight: .semibold, design: .default))
                                    .symbolRenderingMode(.monochrome)
                                Text(prismaLocalizedCommittedConflictLabel(row.id, language))
                                    .font(.system(size: 13, weight: .medium, design: .default))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(3)
                                    .minimumScaleFactor(0.9)
                            }
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .frame(maxWidth: .infinity, minHeight: 92)
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(
                                        PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                            prismaCinematicLatchedNucleiSelectedChamber ? 0.78 : 0.16
                                        ),
                                        lineWidth: prismaCinematicLatchedNucleiSelectedChamber ? 2 : 1
                                    )
                            )
                            .overlay(alignment: .topTrailing) {
                                if prismaCinematicLatchedNucleiSelectedChamber {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 18, weight: .semibold, design: .default))
                                        .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                        .padding(8)
                                }
                            }
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
