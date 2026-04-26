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
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration,
        userPerspective: Bool
    ) -> String {
        guard language == .russianCurationHuskLatchedMosaicNuclei else {
            return storageLabel
        }
        if userPerspective {
            switch storageLabel {
            case "Explosive": return "Взрываюсь"
            case "Avoidant / Silent": return "Ухожу в молчанку"
            case "Defensive / Blames": return "Перевожу стрелки"
            case "Ultra-logical": return "Сыплю фактами"
            case "Devalues feelings": return "Обесцениваю чувства"
            case "Collaborative": return "Пытаюсь обсудить"
            default: return storageLabel
            }
        } else {
            switch storageLabel {
            case "Explosive": return "Взрывается"
            case "Avoidant / Silent": return "Уходит в молчанку"
            case "Defensive / Blames": return "Переводит стрелки"
            case "Ultra-logical": return "Сыплет фактами"
            case "Devalues feelings": return "Обесценивает чувства"
            case "Collaborative": return "Пытается обсудить"
            default: return storageLabel
            }
        }
    }

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        let prismaUserSelectedCount = prismaRelationshipOnboardingFlowViewModel
            .prismaMutableUserRelationshipProfileSnapshot
            .prismaCommittedRelationshipUserConflictPatternDescriptorTags
            .count
        let prismaPartnerSelectedCount = prismaRelationshipOnboardingFlowViewModel
            .prismaMutableUserRelationshipProfileSnapshot
            .prismaCommittedRelationshipPartnerConflictPatternDescriptorTags
            .count
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                Text(language == .russianCurationHuskLatchedMosaicNuclei ? "Поведение в ссорах" : "Conflict behavior")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                Text(language == .russianCurationHuskLatchedMosaicNuclei
                    ? "Выберите 1–2 реакции в каждом блоке."
                    : "Choose 1–2 reactions in each block."
                )
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                VStack(alignment: .leading, spacing: 32) {
                    prismaCommittedConflictPatternSection(
                        title: language == .russianCurationHuskLatchedMosaicNuclei ? "Как обычно реагируете вы?" : "How do you usually react?",
                        selectedLabels: prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .prismaCommittedRelationshipUserConflictPatternDescriptorTags,
                        selectedCount: prismaUserSelectedCount,
                        language: language,
                        userPerspective: true,
                        toggleAction: { label in
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaAttemptCommittedRelationshipUserConflictPatternTagToggleMutation(
                                    desiredUserReactionTagDisplayLabel: label
                                )
                        }
                    )
                    prismaCommittedConflictPatternSection(
                        title: language == .russianCurationHuskLatchedMosaicNuclei ? "А как реагирует партнёр?" : "And how does your partner react?",
                        selectedLabels: prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .prismaCommittedRelationshipPartnerConflictPatternDescriptorTags,
                        selectedCount: prismaPartnerSelectedCount,
                        language: language,
                        userPerspective: false,
                        toggleAction: { label in
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaAttemptPartnerConflictStyleDescriptorTagToggleMutation(
                                    desiredPartnerReactionTagDisplayLabel: label
                                )
                        }
                    )
                }
            }
            .padding(24)
            .padding(.bottom, 120)
        }
        .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
    }

    private func prismaCommittedConflictPatternSection(
        title: String,
        selectedLabels: [String],
        selectedCount: Int,
        language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration,
        userPerspective: Bool,
        toggleAction: @escaping (String) -> Void
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            LazyVGrid(columns: prismaCurationLatchedPartnerConflictNucleiGridChamber, alignment: .leading, spacing: 10) {
                ForEach(PrismaCinematicLatchedNucleiCommittedRelationshipScenarioOnboardingDescriptorChamberLatchedCatalog
                    .prismaCinematicLatchedNucleiCommittedCohabitingRelationshipPartnerConflictCurationChamber) { row in
                    let label = prismaLocalizedCommittedConflictLabel(row.id, language, userPerspective: userPerspective)
                    let selected = selectedLabels.contains(label)
                    let dimUnselected = selectedCount == 2 && !selected
                    Button {
                        toggleAction(label)
                    } label: {
                        VStack(alignment: .center, spacing: 10) {
                            Image(systemName: row.prismaCinematicLatchedNucleiVectorMonochromeSFSymbolGlyphName)
                                .font(.title2)
                                .symbolRenderingMode(.monochrome)
                            Text(label)
                                .font(.system(size: 13, weight: .medium, design: .default))
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                                .minimumScaleFactor(0.9)
                        }
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .frame(maxWidth: .infinity, minHeight: 96)
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(
                                    selected
                                        ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.1)
                                        : PrismaColors.surface(prismaRuntimeActiveAppThemeComposition)
                                )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(
                                    PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(selected ? 0.78 : 0.16),
                                    lineWidth: selected ? 2 : 1
                                )
                        )
                        .overlay(alignment: .topTrailing) {
                            if selected {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 18, weight: .semibold, design: .default))
                                    .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                    .padding(8)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                    .opacity(dimUnselected ? 0.42 : 1.0)
                }
            }
        }
    }
}

struct PrismaCommittedRelationshipOnboardingBranchStepFiveTemperatureView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("В какой точке вы сейчас находитесь?")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .multilineTextAlignment(.leading)
                    Text("Это поможет Prisma выбрать нужный фокус для анализа.")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(3)
                }
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(
                        PrismaCinematicLatchedNucleiCommittedRelationshipScenarioOnboardingDescriptorChamberLatchedCatalog
                            .prismaCommittedRelationshipTemperatureCardRows,
                        id: \.temperature
                    ) { row in
                        let selected = prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .prismaCommittedRelationshipCurrentTemperature == row.temperature
                        Button {
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaApplyCommittedRelationshipCurrentTemperatureMutation(row.temperature)
                        } label: {
                            HStack(alignment: .center, spacing: 14) {
                                ZStack {
                                    Circle()
                                        .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.14))
                                        .frame(width: 42, height: 42)
                                    Image(systemName: row.symbolName)
                                        .font(.system(size: 18, weight: .semibold, design: .default))
                                        .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                }
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(row.title)
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                        .multilineTextAlignment(.leading)
                                    Text(row.subtitle)
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
                            .overlay(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .stroke(
                                        PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(selected ? 0.85 : 0.0),
                                        lineWidth: 2
                                    )
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
