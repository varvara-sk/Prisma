import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Binding var prismaMainTabShellSegmentSelectionCoordinatorOrdinal: Int
    @AppStorage("prismaV1RelationshipOnboardingCompletionMarkerKey") private var prismaRelationshipOnboardingHasCompletedPreference = false
    @State private var hasChats = false
    @State private var prismaArchivedScenarioLedgerEntries: [PrismaArchivedUserScenarioLedgerEntry] = []
    @State private var prismaHydratedActiveUserProfileSnapshotForDashboardSurface = UserProfile()
    @State private var prismaDashboardSelectedContextFacetIdentifierEnumeration: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration =
        .activePrimaryUserProfileContextFacet
    @State private var prismaDashboardSituationPickerSheetPresentedFlag = false
    @State private var prismaPartnerPortraitFlowSheetPresentedFlag = false
    @State private var prismaDailyAnxietyCheckInSheetPresentedFlag = false
    @State private var prismaDailyAnxietyCheckInSelectedLevel = 5.0
    @State private var prismaDailyAnxietyCheckInSnapshots: [PrismaDailyAnxietyCheckInSnapshot] = []
    @StateObject private var prismaPartnerPortraitFlowViewModel = PrismaPartnerPsychologicalPortraitFlowViewModel()

    init(
        prismaMainTabShellSegmentSelectionCoordinatorOrdinal: Binding<Int>,
        prismaDashboardInitialConversationHistoryPresenceFlag: Bool = false
    ) {
        _prismaMainTabShellSegmentSelectionCoordinatorOrdinal = prismaMainTabShellSegmentSelectionCoordinatorOrdinal
        _hasChats = State(initialValue: prismaDashboardInitialConversationHistoryPresenceFlag)
    }

    private var prismaDashboardEffectiveShouldDisplayPopulatedInsightSurface: Bool {
        hasChats
            || prismaAnalyzerConversationReportSnapshotForSelectedScenario != nil
            || !prismaDailyAnxietyCheckInSnapshots.isEmpty
    }

    private var prismaDashboardAnxietyMoodDataPointCollection: [MoodData] {
        let prismaFormatter = DateFormatter()
        prismaFormatter.locale = Locale(identifier: "ru_RU")
        prismaFormatter.dateFormat = "EE"
        let prismaStoredData = prismaDailyAnxietyCheckInSnapshots.suffix(7).map {
            MoodData(
                weekdayOrdinalLabel: prismaFormatter.string(from: $0.createdAt).capitalized,
                anxietyIntensityLevelOneThroughTen: $0.anxietyLevelOneThroughTen
            )
        }
        return prismaStoredData.isEmpty
            ? PrismaDashboardMockSamplePayloadFactory.prismaWeekdayAnxietyTrendPreviewSeries
            : prismaStoredData
    }

    private var prismaResolvedAnalyticalPayloadBundleForCurrentSelection: PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor {
        if let prismaAnalyzerConversationReportSnapshotForSelectedScenario {
            return prismaAnalyticalPayloadBundleFromAnalyzerReport(prismaAnalyzerConversationReportSnapshotForSelectedScenario)
        }
        return PrismaDashboardMockSamplePayloadFactory.prismaAnalyticalPayloadBundleForDashboardAnalyticalContextFacetIsolationEnvelopeDescriptor(
            prismaDashboardSelectedContextFacetIdentifierEnumeration,
            prismaHydratedFallbackActiveUserProfileSnapshotStem: prismaHydratedActiveUserProfileSnapshotForDashboardSurface
        )
    }

    private var prismaAnalyzerConversationReportSnapshotForSelectedScenario: PrismaAnalyzerConversationReportSnapshot? {
        switch prismaDashboardSelectedContextFacetIdentifierEnumeration {
        case .activePrimaryUserProfileContextFacet:
            return prismaHydratedActiveUserProfileSnapshotForDashboardSurface.prismaRoutedAnalyzerConversationReportSnapshot
        case .archivedLedgerEmbeddedSnapshotContextFacet(let prismaSelectedLedgerEntry):
            return prismaArchivedScenarioLedgerEntries.first { $0.id == prismaSelectedLedgerEntry.id }?
                .prismaEmbeddedUserProfileSnapshot
                .prismaRoutedAnalyzerConversationReportSnapshot
        }
    }

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardYourInsights
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                )
                .font(PrismaTypography.prismaPremiumScreenTitleRoundedBold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 4)
                if prismaDashboardEffectiveShouldDisplayPopulatedInsightSurface {
                    List {
                        Section {
                            VStack(alignment: .leading, spacing: 20) {
                                PrismaDashboardHIGCinematicNucleusContextualSituationPillLatchedMenuDropDownChromaticControlView(
                                    prismaDashboardLatchedContextFacetNucleusSelectionBinding: $prismaDashboardSelectedContextFacetIdentifierEnumeration,
                                    prismaHydratedLatchedActiveUserProfileNucleusSnapshot: prismaHydratedActiveUserProfileSnapshotForDashboardSurface,
                                    prismaArchivedLatchedScenarioNucleusLedgerChamberCollection: prismaArchivedScenarioLedgerEntries,
                                    prismaSituationPickerTapAction: {
                                        prismaDashboardSituationPickerSheetPresentedFlag = true
                                    }
                                )
                                prismaPartnerPsychologicalPortraitDashboardCardChamber(language)
                                if let prismaAnalyzerConversationReportSnapshotForSelectedScenario {
                                    prismaAnalyzerConversationReportDashboardCardChamber(
                                        prismaAnalyzerConversationReportSnapshotForSelectedScenario,
                                        language
                                    )
                                }
                                PrismaDashboardMoodTrendChartCardView(
                                    prismaMoodDataPointCollection: prismaDashboardAnxietyMoodDataPointCollection
                                )
                                PrismaDashboardHIGNucleusQuadrupleChamberNotionCurationSessionInsightCurationView(
                                    prismaSessionCurationHIGNucleusInsightChamber: prismaResolvedAnalyticalPayloadBundleForCurrentSelection
                                        .prismaEmbeddedInsightDataSnapshot
                                )
                            }
                            .listRowInsets(EdgeInsets(top: 4, leading: 20, bottom: 4, trailing: 20))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .safeAreaInset(edge: .bottom) {
                        Color.clear.frame(height: 80)
                    }
                } else {
                    Spacer(minLength: 0)
                    PrismaDashboardEmptyInsightPlaceholderView(
                        prismaNavigateToChatConversationTabAction: {
                            prismaMainTabShellSegmentSelectionCoordinatorOrdinal = 0
                        }
                    )
                    Spacer(minLength: 0)
                }
            }
        }
        .onAppear {
            prismaRefreshActiveUserProfileSnapshotAndArchivedLedgerFromPersistentStore()
            prismaPresentDailyAnxietyCheckInIfNeeded()
            PrismaProductUsageTelemetrySignalRecorder.prismaIncrementOrdinalTallyForTelemetrySignal(
                .analyticalDashboardSurfaceDidAppear
            )
        }
        .onChange(of: prismaRelationshipOnboardingHasCompletedPreference) { _ in
            prismaRefreshActiveUserProfileSnapshotAndArchivedLedgerFromPersistentStore()
        }
        .onChange(of: prismaArchivedScenarioLedgerEntries) { _ in
            prismaReconcileArchivedSelectionIfLedgerEntryWasRemoved()
        }
        .sheet(isPresented: $prismaDashboardSituationPickerSheetPresentedFlag) {
            prismaDashboardSituationPickerSheetChamber(language)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $prismaPartnerPortraitFlowSheetPresentedFlag) {
            prismaPartnerPsychologicalPortraitFlowSheetChamber(language)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $prismaDailyAnxietyCheckInSheetPresentedFlag) {
            prismaDailyAnxietyCheckInSheetChamber(language)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }

    private func prismaPartnerPsychologicalPortraitDashboardCardChamber(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        let prismaPortrait = prismaHydratedActiveUserProfileSnapshotForDashboardSurface.prismaPartnerPsychologicalPortrait
        return VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: "wand.and.stars")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                    .frame(width: 44, height: 44)
                    .background(
                        Circle()
                            .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.14))
                    )
                VStack(alignment: .leading, spacing: 4) {
                    Text(prismaPortrait?.psychotype ?? "Создать психологический портрет партнера")
                        .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                        .fontWeight(.semibold)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .multilineTextAlignment(.leading)
                    Text(prismaPortrait == nil
                        ? "Загрузите кусочек вашей типичной переписки, и ИИ определит его психотип и скрытые мотивы."
                        : (prismaPortrait?.briefCharacteristic ?? "")
                    )
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineLimit(prismaPortrait == nil ? 3 : nil)
                    .fixedSize(horizontal: false, vertical: true)
                }
                Spacer(minLength: 0)
            }
            if let prismaPortrait {
                HStack(spacing: 8) {
                    ForEach(Array(prismaPortrait.dominantTraits.prefix(3)), id: \.self) { trait in
                        prismaPartnerPortraitTraitChipCurationHusk(trait)
                    }
                }
            }
            Button {
                prismaPartnerPortraitFlowViewModel.prismaResetFlow()
                prismaPartnerPortraitFlowSheetPresentedFlag = true
            } label: {
                HStack(spacing: 6) {
                    Text(prismaPortrait == nil ? "Создать портрет" : "Обновить портрет")
                        .font(.subheadline.bold())
                    Image(systemName: "chevron.right")
                        .font(.caption.bold())
                }
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .buttonStyle(.plain)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.18), lineWidth: 1)
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

    private func prismaPartnerPsychologicalPortraitFlowSheetChamber(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    switch prismaPartnerPortraitFlowViewModel.prismaCurrentStepIndex {
                    case 0:
                        prismaPartnerPsychologicalPortraitIdentityStepChamber(language)
                    case 1:
                        prismaPartnerPsychologicalPortraitConversationStepChamber(language)
                    default:
                        prismaPartnerPsychologicalPortraitResultStepChamber(language)
                    }
                }
                .padding(20)
                .padding(.bottom, 28)
            }
            .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
            .navigationTitle("Портрет партнера")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func prismaPartnerPortraitTraitChipCurationHusk(_ trait: String) -> some View {
        Text(prismaPartnerPortraitNormalizedTraitChipTitle(trait))
            .font(.caption.bold())
            .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .padding(.vertical, 7)
            .padding(.horizontal, 12)
            .background(
                Capsule(style: .continuous)
                    .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.15))
            )
    }

    private func prismaPartnerPortraitNormalizedTraitChipTitle(_ trait: String) -> String {
        let prismaTrimmedTrait = trait.trimmingCharacters(in: .whitespacesAndNewlines)
        if let prismaResolvedNoun = prismaPartnerPortraitSemanticTraitNounCurationHusk(prismaTrimmedTrait) {
            return prismaResolvedNoun
        }
        let prismaLowercasedTrait = prismaTrimmedTrait.lowercased()
        let prismaSemanticPrefixes = [
            "стремление к ",
            "склонность к ",
            "использование ",
            "использует ",
            "тенденция к "
        ]
        for prismaPrefix in prismaSemanticPrefixes where prismaLowercasedTrait.hasPrefix(prismaPrefix) {
            let prismaSemanticTail = prismaTrimmedTrait.dropFirst(prismaPrefix.count)
                .trimmingCharacters(in: .whitespacesAndNewlines)
            if !prismaSemanticTail.isEmpty {
                return prismaSemanticTail
            }
        }
        return prismaTrimmedTrait
    }

    private func prismaPartnerPortraitSemanticTraitNounCurationHusk(_ trait: String) -> String? {
        let prismaLowercasedTrait = trait.lowercased()
        if prismaLowercasedTrait.contains("доминир") {
            return "Доминирование"
        }
        if prismaLowercasedTrait.contains("контрол") {
            return "Контроль"
        }
        if prismaLowercasedTrait.contains("агресс") {
            return "Агрессия"
        }
        if prismaLowercasedTrait.contains("обесцен") {
            return "Обесценивание"
        }
        if prismaLowercasedTrait.contains("манипул") {
            return "Манипуляция"
        }
        if prismaLowercasedTrait.contains("закрыт") || prismaLowercasedTrait.contains("отстран") {
            return "Закрытость"
        }
        if prismaLowercasedTrait.contains("избег") {
            return "Избегание"
        }
        return nil
    }

    private func prismaAnalyzerConversationReportDashboardCardChamber(
        _ prismaReport: PrismaAnalyzerConversationReportSnapshot,
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: "doc.text.magnifyingglass")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                    .frame(width: 44, height: 44)
                    .background(
                        Circle()
                            .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.14))
                    )
                VStack(alignment: .leading, spacing: 4) {
                    Text(language == .russianCurationHuskLatchedMosaicNuclei ? "Последний разбор переписки" : "Latest Conversation Report")
                        .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                        .fontWeight(.semibold)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Text(prismaReport.createdAt.formatted(date: .abbreviated, time: .shortened))
                        .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
                Spacer(minLength: 0)
            }
            prismaAnalyzerReportPreviewRowCurationHusk(
                title: language == .russianCurationHuskLatchedMosaicNuclei ? "Тон" : "Tone",
                markdownText: prismaReport.toneMarkdownText
            )
            prismaAnalyzerReportPreviewRowCurationHusk(
                title: language == .russianCurationHuskLatchedMosaicNuclei ? "Красные флаги" : "Red Flags",
                markdownText: prismaReport.redFlagsMarkdownText
            )
            Button {
                prismaMainTabShellSegmentSelectionCoordinatorOrdinal = 1
            } label: {
                HStack(spacing: 6) {
                    Text(language == .russianCurationHuskLatchedMosaicNuclei ? "Открыть анализатор" : "Open Analyzer")
                        .font(.subheadline.bold())
                    Image(systemName: "chevron.right")
                        .font(.caption.bold())
                }
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .buttonStyle(.plain)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.18), lineWidth: 1)
        )
    }

    private func prismaAnalyticalPayloadBundleFromAnalyzerReport(
        _ prismaReport: PrismaAnalyzerConversationReportSnapshot
    ) -> PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor {
        PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor(
            prismaEmbeddedInsightDataSnapshot: InsightData(
                sessionSituationAwarenessNucleusLine: prismaDashboardPlainTextExcerptCurationHusk(
                    prismaReport.hiddenTensionMarkdownText,
                    fallback: prismaReport.rawMarkdownText
                ),
                relationalSynchronyStrengthHighlightDescriptorTags: [
                    "Есть материал для честного разговора",
                    "Диалог уже можно разложить по паттернам",
                ],
                relationalTensionAmplificationDescriptorTags: prismaDashboardInsightTagsFromMarkdownCurationHusk(
                    prismaReport.repeatedPatternsMarkdownText,
                    fallback: ["Повторяющийся конфликт", "Недосказанность"]
                ),
                counterpartBehavioralFrictionDescriptorTags: prismaDashboardInsightTagsFromMarkdownCurationHusk(
                    prismaReport.redFlagsMarkdownText,
                    fallback: ["Сигналы напряжения"]
                ),
                contactDriftObservationBulletFragments: prismaDashboardBulletRowsFromMarkdownCurationHusk(
                    prismaReport.toneMarkdownText,
                    fallback: ["Тон переписки сохранён из последнего анализа."]
                ),
                optionalGentleExperimentIdeaFragments: prismaDashboardBulletRowsFromMarkdownCurationHusk(
                    prismaReport.nextStepMarkdownText,
                    fallback: ["Откройте анализатор, чтобы посмотреть полный следующий шаг."]
                )
            ),
            prismaPairDynamicsSectionLocalizedTitle: "Последний разбор переписки",
            prismaPairDynamicsNarrativeBodyLine: prismaDashboardPlainTextExcerptCurationHusk(
                prismaReport.repeatedPatternsMarkdownText,
                fallback: "Dashboard построен по последнему сохранённому отчету анализатора."
            )
        )
    }

    private func prismaDashboardBulletRowsFromMarkdownCurationHusk(
        _ prismaMarkdownText: String,
        fallback: [String]
    ) -> [String] {
        let prismaRows = prismaMarkdownText
            .components(separatedBy: .newlines)
            .map {
                $0
                    .replacingOccurrences(of: "**", with: "")
                    .replacingOccurrences(of: "###", with: "")
                    .replacingOccurrences(of: ">", with: "")
                    .trimmingCharacters(in: CharacterSet(charactersIn: "-•* ").union(.whitespacesAndNewlines))
            }
            .filter { prismaDashboardInsightLineContainsMeaningfulText($0) }
        return Array((prismaRows.isEmpty ? fallback : prismaRows).prefix(3))
    }

    private func prismaDashboardInsightTagsFromMarkdownCurationHusk(
        _ prismaMarkdownText: String,
        fallback: [String]
    ) -> [String] {
        prismaDashboardBulletRowsFromMarkdownCurationHusk(prismaMarkdownText, fallback: fallback)
    }

    private func prismaDashboardPlainTextExcerptCurationHusk(
        _ prismaMarkdownText: String,
        fallback: String
    ) -> String {
        let prismaPlainText = prismaMarkdownText
            .replacingOccurrences(of: "**", with: "")
            .replacingOccurrences(of: "##", with: "")
            .replacingOccurrences(of: ">", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let prismaMeaningfulRows = prismaPlainText
            .components(separatedBy: .newlines)
            .map {
                $0.trimmingCharacters(in: CharacterSet(charactersIn: "-•* ").union(.whitespacesAndNewlines))
            }
            .filter { prismaDashboardInsightLineContainsMeaningfulText($0) }
        let prismaResolvedText = (prismaMeaningfulRows.isEmpty ? fallback : prismaMeaningfulRows.joined(separator: " "))
        return prismaDashboardWordBoundaryExcerptCurationHusk(prismaResolvedText, limit: 260)
    }

    private func prismaDashboardInsightLineContainsMeaningfulText(_ line: String) -> Bool {
        let prismaTrimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
        if prismaTrimmedLine.isEmpty || prismaTrimmedLine.hasPrefix("#") {
            return false
        }
        if prismaTrimmedLine.allSatisfy({ $0.isNumber || $0.isPunctuation || $0.isWhitespace }) {
            return false
        }
        let prismaLowercasedLine = prismaTrimmedLine.lowercased()
        let prismaBlockedStandaloneHeadings: Set<String> = [
            "что наблюдается:",
            "что наблюдается",
            "анализ ситуации:",
            "анализ ситуации",
            "суть:",
            "суть",
            "итог:",
            "итог"
        ]
        if prismaBlockedStandaloneHeadings.contains(prismaLowercasedLine) {
            return false
        }
        return prismaTrimmedLine.count > 3
    }

    private func prismaDashboardWordBoundaryExcerptCurationHusk(_ text: String, limit: Int) -> String {
        guard text.count > limit else {
            return text
        }
        let prismaLimitedText = String(text.prefix(limit))
        if let prismaLastSpaceIndex = prismaLimitedText.lastIndex(where: { $0.isWhitespace }) {
            return String(prismaLimitedText[..<prismaLastSpaceIndex])
        }
        return prismaLimitedText
    }

    private func prismaAnalyzerReportPreviewRowCurationHusk(
        title: String,
        markdownText: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 13, weight: .semibold, design: .rounded))
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
            prismaDashboardMarkdownRenderedTextCurationHusk(markdownText)
                .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .lineLimit(3)
        }
    }

    private func prismaPartnerPsychologicalPortraitIdentityStepChamber(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Кого анализируем?")
                .font(PrismaTypography.prismaOnboardingLargeTitleRoundedBold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            Text("Оставим только базовое: имя и возраст. Остальное Prisma вытащит из переписки.")
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .lineSpacing(4)
            PrismaPartnerPortraitTextInputChamber(
                title: "Имя",
                placeholder: "Как зовут партнера",
                text: $prismaPartnerPortraitFlowViewModel.prismaPartnerNameText
            )
            PrismaPartnerPortraitTextInputChamber(
                title: "Возраст",
                placeholder: "Например: 28",
                keyboardType: .numberPad,
                text: $prismaPartnerPortraitFlowViewModel.prismaPartnerAgeText
            )
            Button {
                prismaPartnerPortraitFlowViewModel.prismaCurrentStepIndex = 1
            } label: {
                prismaPartnerPortraitPrimaryButtonContentChamber(title: "Далее")
            }
            .buttonStyle(.plain)
            .disabled(!prismaPartnerPortraitFlowViewModel.prismaCanMovePastIdentityStep)
            .opacity(prismaPartnerPortraitFlowViewModel.prismaCanMovePastIdentityStep ? 1 : 0.42)
        }
    }

    private func prismaPartnerPsychologicalPortraitConversationStepChamber(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Добавьте переписку")
                .font(PrismaTypography.prismaOnboardingLargeTitleRoundedBold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            Text("Скопируйте сюда вашу типичную ссору или длинный диалог (от 10 сообщений). Чем больше текста, тем точнее анализ.")
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .lineSpacing(4)
            ZStack(alignment: .topLeading) {
                TextEditor(text: $prismaPartnerPortraitFlowViewModel.prismaConversationText)
                    .scrollContentBackground(.hidden)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .frame(minHeight: 260)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.18), lineWidth: 1)
                    )
                if prismaPartnerPortraitFlowViewModel.prismaConversationText.isEmpty {
                    Text("Вставьте переписку сюда")
                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition).opacity(0.72))
                        .padding(.horizontal, 18)
                        .padding(.vertical, 20)
                        .allowsHitTesting(false)
                }
            }
            if let error = prismaPartnerPortraitFlowViewModel.prismaVisibleErrorText {
                Text(error)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition))
            }
            Button {
                Task {
                    await prismaPartnerPortraitFlowViewModel.prismaAnalyzeConversation(
                        activeProfile: prismaHydratedActiveUserProfileSnapshotForDashboardSurface
                    )
                }
            } label: {
                HStack(spacing: 10) {
                    if prismaPartnerPortraitFlowViewModel.prismaIsAnalyzing {
                        ProgressView()
                            .tint(Color.white)
                    }
                    Text("Анализировать")
                }
                .frame(maxWidth: .infinity)
                .font(PrismaTypography.prismaCallToActionPrimaryEmphasisBodyRoundedSemibold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                )
            }
            .buttonStyle(.plain)
            .disabled(!prismaPartnerPortraitFlowViewModel.prismaCanAnalyzeConversation)
            .opacity(prismaPartnerPortraitFlowViewModel.prismaCanAnalyzeConversation ? 1 : 0.42)
        }
    }

    private func prismaPartnerPsychologicalPortraitResultStepChamber(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Портрет готов")
                .font(PrismaTypography.prismaOnboardingLargeTitleRoundedBold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            if let portrait = prismaPartnerPortraitFlowViewModel.prismaDraftPortrait {
                VStack(alignment: .leading, spacing: 14) {
                    Text(portrait.psychotype)
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    HStack(spacing: 8) {
                        ForEach(Array(portrait.dominantTraits.prefix(3)), id: \.self) { trait in
                            prismaPartnerPortraitTraitChipCurationHusk(trait)
                        }
                    }
                    Text(portrait.briefCharacteristic)
                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .lineSpacing(5)
                }
                .padding(18)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                )
                Button {
                    prismaPersistPartnerPsychologicalPortrait(portrait)
                    prismaPartnerPortraitFlowSheetPresentedFlag = false
                } label: {
                    prismaPartnerPortraitPrimaryButtonContentChamber(title: "Сохранить в профиль ситуации")
                }
                .buttonStyle(.plain)
            }
        }
    }

    private func prismaPartnerPortraitPrimaryButtonContentChamber(title: String) -> some View {
        Text(title)
            .font(PrismaTypography.prismaCallToActionPrimaryEmphasisBodyRoundedSemibold)
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
            )
    }

    private func prismaDashboardSituationPickerSheetChamber(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 14) {
                    prismaDashboardSituationPickerActiveRowChamber(language)
                    if !prismaArchivedScenarioLedgerEntries.isEmpty {
                        Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                            .dashboardSituationHistory
                            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                        )
                        .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                        .fontWeight(.semibold)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .padding(.top, 10)
                        ForEach(prismaArchivedScenarioLedgerEntries) { prismaLedgerEntry in
                            prismaDashboardSituationPickerArchivedRowChamber(prismaLedgerEntry, language)
                        }
                    }
                    Button {
                        prismaDashboardSituationPickerSheetPresentedFlag = false
                        prismaLaunchFreshOnboardingCycleArchivingCurrentProfileIfNeeded()
                    } label: {
                        Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                            .dashboardAddNewSituation
                            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                        )
                        .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                        .fontWeight(.semibold)
                        .foregroundStyle(PrismaColors.prismaDashboardHighContrastInteractivePillTextNucleus(prismaRuntimeActiveAppThemeComposition))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .fill(PrismaColors.prismaDashboardHighContrastInteractivePillFillNucleus(prismaRuntimeActiveAppThemeComposition))
                        )
                    }
                    .buttonStyle(.plain)
                    .padding(.top, 8)
                }
                .padding(20)
                .padding(.bottom, 20)
            }
            .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
            .navigationTitle(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .dashboardContextTitle
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
            )
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func prismaDashboardSituationPickerActiveRowChamber(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        let prismaTitle = prismaHydratedActiveUserProfileSnapshotForDashboardSurface.globalMode?
            .prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(language)
            ?? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardNowPrefix
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
        let prismaSelected = prismaDashboardSelectedContextFacetIdentifierEnumeration == .activePrimaryUserProfileContextFacet
        return Button {
            prismaDashboardSelectedContextFacetIdentifierEnumeration = .activePrimaryUserProfileContextFacet
            prismaDashboardSituationPickerSheetPresentedFlag = false
        } label: {
            prismaDashboardSituationPickerRowContentChamber(
                title: prismaTitle,
                subtitle: PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .dashboardNowPrefix
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language),
                selected: prismaSelected
            )
        }
        .buttonStyle(.plain)
    }

    private func prismaDashboardSituationPickerArchivedRowChamber(
        _ prismaLedgerEntry: PrismaArchivedUserScenarioLedgerEntry,
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        let prismaTitle = prismaLedgerEntry.prismaEmbeddedUserProfileSnapshot.globalMode?
            .prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(language)
            ?? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .dashboardSituationTypeFallback
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
        let prismaSelected: Bool = {
            if case .archivedLedgerEmbeddedSnapshotContextFacet(let prismaSelectedLedgerEntry) =
                prismaDashboardSelectedContextFacetIdentifierEnumeration {
                return prismaSelectedLedgerEntry.id == prismaLedgerEntry.id
            }
            return false
        }()
        return HStack(alignment: .center, spacing: 10) {
            Button {
                prismaDashboardSelectedContextFacetIdentifierEnumeration = .archivedLedgerEmbeddedSnapshotContextFacet(prismaLedgerEntry)
                prismaDashboardSituationPickerSheetPresentedFlag = false
            } label: {
                prismaDashboardSituationPickerRowContentChamber(
                    title: prismaTitle,
                    subtitle: prismaLedgerEntry.prismaScenarioCapturedTimestamp.formatted(date: .abbreviated, time: .shortened),
                    selected: prismaSelected
                )
            }
            .buttonStyle(.plain)
            Button(role: .destructive) {
                prismaCinematicHIGCurationDeleteLatchedScenarioLedgerNucleusChamber(prismaLedgerEntry)
            } label: {
                Image(systemName: "trash")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition))
                    .frame(width: 42, height: 42)
                    .background(
                        Circle()
                            .fill(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition).opacity(0.10))
                    )
            }
            .buttonStyle(.plain)
        }
    }

    private func prismaDashboardSituationPickerRowContentChamber(
        title: String,
        subtitle: String,
        selected: Bool
    ) -> some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                    .fontWeight(.semibold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                Text(subtitle)
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
            }
            Spacer(minLength: 0)
            Image(systemName: selected ? "checkmark.circle.fill" : "circle")
                .font(.title3)
                .foregroundStyle(selected ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition) : Color(.systemGray4))
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(selected ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.10) : PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(selected ? 0.72 : 0.14), lineWidth: selected ? 2 : 1)
        )
    }

    private func prismaCinematicHIGCurationDeleteLatchedScenarioLedgerNucleusChamber(
        _ prismaLatchedNucleusLedgerChamber: PrismaArchivedUserScenarioLedgerEntry
    ) {
        PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaRemoveSingleArchivedUserScenarioLedgerEntryByIdentifierIfPresent(prismaLatchedNucleusLedgerChamber.id)
        prismaRefreshActiveUserProfileSnapshotAndArchivedLedgerFromPersistentStore()
    }

    private func prismaDailyAnxietyCheckInSheetChamber(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        VStack(alignment: .leading, spacing: 22) {
            Text(language == .russianCurationHuskLatchedMosaicNuclei ? "Как ты сегодня?" : "How are you today?")
                .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            Text(language == .russianCurationHuskLatchedMosaicNuclei ? "Оцени уровень тревоги, чтобы график на дашборде отражал реальное состояние." : "Rate your anxiety so the dashboard trend reflects your real state.")
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .lineSpacing(4)
            VStack(alignment: .center, spacing: 12) {
                Text("\(Int(prismaDailyAnxietyCheckInSelectedLevel.rounded())) / 10")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                Slider(value: $prismaDailyAnxietyCheckInSelectedLevel, in: 1...10, step: 1)
                    .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                HStack {
                    Text(language == .russianCurationHuskLatchedMosaicNuclei ? "спокойно" : "calm")
                    Spacer()
                    Text(language == .russianCurationHuskLatchedMosaicNuclei ? "очень тревожно" : "very anxious")
                }
                .font(.system(size: 12, weight: .medium, design: .rounded))
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
            }
            Button {
                prismaPersistDailyAnxietyCheckInSelection()
            } label: {
                Text(language == .russianCurationHuskLatchedMosaicNuclei ? "Сохранить" : "Save")
                    .font(PrismaTypography.prismaCallToActionPrimaryEmphasisBodyRoundedSemibold)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                    )
            }
            .buttonStyle(.plain)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
    }

    private func prismaPersistPartnerPsychologicalPortrait(_ prismaPortrait: PrismaPartnerPsychologicalPortrait) {
        var prismaWorkingProfile = prismaHydratedActiveUserProfileSnapshotForDashboardSurface
        prismaWorkingProfile.prismaPartnerPsychologicalPortrait = prismaPortrait
        PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaPersistCodableUserProfileSnapshot(prismaWorkingProfile)
        prismaHydratedActiveUserProfileSnapshotForDashboardSurface = prismaWorkingProfile
    }

    private func prismaDashboardMarkdownRenderedTextCurationHusk(_ prismaMarkdownText: String) -> Text {
        let prismaNormalizedMarkdownText = prismaDashboardMarkdownBulletNormalizedTextCurationHusk(prismaMarkdownText)
        if let prismaAttributedMarkdown = try? AttributedString(
            markdown: prismaNormalizedMarkdownText,
            options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        ) {
            return Text(prismaAttributedMarkdown)
        }
        return Text(prismaNormalizedMarkdownText)
    }

    private func prismaDashboardMarkdownBulletNormalizedTextCurationHusk(_ prismaMarkdownText: String) -> String {
        prismaMarkdownText.components(separatedBy: .newlines).map { prismaLine in
            let prismaTrimmedLine = prismaLine.trimmingCharacters(in: .whitespaces)
            let prismaLeadingWhitespace = String(prismaLine.prefix { $0.isWhitespace })
            if prismaTrimmedLine.hasPrefix("* ") {
                return "\(prismaLeadingWhitespace)• \(prismaTrimmedLine.dropFirst(2))"
            }
            if prismaTrimmedLine.hasPrefix("- ") {
                return "\(prismaLeadingWhitespace)• \(prismaTrimmedLine.dropFirst(2))"
            }
            return prismaLine
        }
        .joined(separator: "\n")
    }

    private func prismaRefreshActiveUserProfileSnapshotAndArchivedLedgerFromPersistentStore() {
        prismaHydratedActiveUserProfileSnapshotForDashboardSurface = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaFabricateMergedUserProfileSnapshotAssimilatingLegacyIsolatedApplicationTabKeysIfNeeded()
        prismaArchivedScenarioLedgerEntries = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaLoadArchivedUserScenarioLedgerEntryCollection()
        prismaDailyAnxietyCheckInSnapshots = PrismaUserProfileLocalStorageService
            .prismaSharedSingletonInstance
            .prismaLoadDailyAnxietyCheckInSnapshotCollection()
    }

    private func prismaPresentDailyAnxietyCheckInIfNeeded() {
        let prismaAlreadyCheckedInToday = prismaDailyAnxietyCheckInSnapshots.contains {
            Calendar.current.isDateInToday($0.createdAt)
        }
        if !prismaAlreadyCheckedInToday {
            prismaDailyAnxietyCheckInSheetPresentedFlag = true
        }
    }

    private func prismaPersistDailyAnxietyCheckInSelection() {
        PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaUpsertDailyAnxietyCheckInSnapshotForToday(Int(prismaDailyAnxietyCheckInSelectedLevel.rounded()))
        prismaRefreshActiveUserProfileSnapshotAndArchivedLedgerFromPersistentStore()
        if let prismaTodaySnapshot = prismaDailyAnxietyCheckInSnapshots.first(where: { Calendar.current.isDateInToday($0.createdAt) }) {
            prismaDailyAnxietyCheckInSelectedLevel = Double(prismaTodaySnapshot.anxietyLevelOneThroughTen)
        }
        prismaDailyAnxietyCheckInSheetPresentedFlag = false
    }

    private func prismaReconcileArchivedSelectionIfLedgerEntryWasRemoved() {
        if case .archivedLedgerEmbeddedSnapshotContextFacet(let prismaPreviouslySelectedLedgerEntry) =
            prismaDashboardSelectedContextFacetIdentifierEnumeration {
            let prismaStillPresentFlag = prismaArchivedScenarioLedgerEntries.contains {
                $0.id == prismaPreviouslySelectedLedgerEntry.id
            }
            if !prismaStillPresentFlag {
                prismaDashboardSelectedContextFacetIdentifierEnumeration = .activePrimaryUserProfileContextFacet
            }
        }
    }

    private func prismaLaunchFreshOnboardingCycleArchivingCurrentProfileIfNeeded() {
        if let prismaActiveSnapshot = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaLoadLatestPersistedUserProfileSnapshot() {
            PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
                .prismaArchiveCurrentUserProfileSnapshotBeforeStartingFreshOnboardingCycle(prismaActiveSnapshot)
            let prismaFreshScenarioSnapshot = UserProfile(
                globalMode: nil,
                userGender: prismaActiveSnapshot.userGender,
                userAgeFreeformInputText: prismaActiveSnapshot.userAgeFreeformInputText,
                prismaPreferredCallsignForUserInterfaceDisplay: prismaActiveSnapshot.prismaPreferredCallsignForUserInterfaceDisplay,
                prismaUserProfileRelationshipStatusFacetSerializedRawValue: prismaActiveSnapshot
                    .prismaUserProfileRelationshipStatusFacetSerializedRawValue,
                prismaAttachmentStylePreferenceEnumerationSerializedRawValue: prismaActiveSnapshot
                    .prismaAttachmentStylePreferenceEnumerationSerializedRawValue,
                prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection: prismaActiveSnapshot
                    .prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection,
                prismaAIResponsePersonalizationNoteFreeformText: prismaActiveSnapshot.prismaAIResponsePersonalizationNoteFreeformText
            )
            PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
                .prismaPersistCodableUserProfileSnapshot(prismaFreshScenarioSnapshot)
        }
        prismaRefreshActiveUserProfileSnapshotAndArchivedLedgerFromPersistentStore()
        prismaRelationshipOnboardingHasCompletedPreference = false
    }

    private func prismaRestoreArchivedScenarioLedgerEntry(_ prismaTargetLedgerEntry: PrismaArchivedUserScenarioLedgerEntry) {
        PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance.prismaRestoreUserProfileSnapshotFromArchivedLedgerEntry(
            prismaTargetLedgerEntry
        )
        prismaRelationshipOnboardingHasCompletedPreference = true
        prismaRefreshActiveUserProfileSnapshotAndArchivedLedgerFromPersistentStore()
    }
}

#Preview("Populated") {
    DashboardView(prismaMainTabShellSegmentSelectionCoordinatorOrdinal: .constant(2))
        .environmentObject(PrismaApplicationUserInterfaceLanguageCurationCasket())
}

#Preview("Empty") {
    DashboardView(
        prismaMainTabShellSegmentSelectionCoordinatorOrdinal: .constant(2),
        prismaDashboardInitialConversationHistoryPresenceFlag: false
    )
    .environmentObject(PrismaApplicationUserInterfaceLanguageCurationCasket())
}

private struct PrismaPartnerPortraitTextInputChamber: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let title: String
    let placeholder: String
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .textInputAutocapitalization(keyboardType == .numberPad ? .never : .sentences)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.18), lineWidth: 1)
                )
        }
    }
}

@MainActor
private final class PrismaPartnerPsychologicalPortraitFlowViewModel: ObservableObject {
    @Published var prismaCurrentStepIndex = 0
    @Published var prismaPartnerNameText = ""
    @Published var prismaPartnerAgeText = ""
    @Published var prismaConversationText = ""
    @Published var prismaIsAnalyzing = false
    @Published var prismaVisibleErrorText: String?
    @Published var prismaDraftPortrait: PrismaPartnerPsychologicalPortrait?
    private var prismaLlmGatewayMosaicTransportChamber: PrismaOpenAIGatewayLlmMosaicTransportChamberCuration?

    init() {
        do {
            let prismaTransportCasket = try PrismaOpenAIGatewayLlmProxyTransportSessionConfigurationCasket
                .prismaCurationMosaicRoutableHuskForSupabaseLatchedProjectCurationChamber(
                    supabaseCinematicCurationMosaicProjectReference: PrismaLlmGatewayMosaicSupabaseEdgeRoutableCredentialsCurationManifest
                        .prismaLlmSupabaseCurationMosaicProjectReferenceHusk,
                    supabaseCinematicCurationMosaicFunctionSlug: PrismaLlmGatewayMosaicSupabaseEdgeRoutableCredentialsCurationManifest
                        .prismaLlmSupabaseEdgeCurationMosaicFunctionSlugHusk,
                    supabaseCinematicCurationMosaicClientSharedProxyInvocationSecret: PrismaLlmGatewayMosaicSupabaseEdgeRoutableCredentialsCurationManifest
                        .prismaLlmEdgeProxySharedPlaintextSecretInvocationCurationHusk,
                    prismaCinematicCurationMosaicChamberUrlSessionTimeout: PrismaLlmGatewayMosaicSupabaseEdgeRoutableCredentialsCurationManifest
                        .prismaLlmRoutableGatewayHttpTimeoutIntervalSeconds
                )
            prismaLlmGatewayMosaicTransportChamber = PrismaOpenAIGatewayLlmMosaicTransportChamberCuration(
                prismaCinematicLatchedCurationSession: .prismaCinematicLatchedCurationHusk,
                prismaCinematicLatchedCurationMosaic: prismaTransportCasket
            )
        } catch {
            prismaLlmGatewayMosaicTransportChamber = nil
        }
    }

    var prismaCanMovePastIdentityStep: Bool {
        !prismaPartnerNameText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !prismaPartnerAgeText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var prismaCanAnalyzeConversation: Bool {
        !prismaConversationText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !prismaIsAnalyzing
    }

    func prismaResetFlow() {
        prismaCurrentStepIndex = 0
        prismaPartnerNameText = ""
        prismaPartnerAgeText = ""
        prismaConversationText = ""
        prismaIsAnalyzing = false
        prismaVisibleErrorText = nil
        prismaDraftPortrait = nil
    }

    func prismaAnalyzeConversation(activeProfile: UserProfile) async {
        guard let prismaTransport = prismaLlmGatewayMosaicTransportChamber else {
            prismaVisibleErrorText = "Не удалось подготовить анализ. Проверьте подключение и попробуйте снова."
            return
        }
        let prismaTrimmedConversation = prismaConversationText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !prismaTrimmedConversation.isEmpty else {
            return
        }
        prismaVisibleErrorText = nil
        prismaIsAnalyzing = true
        let prismaPayload = PrismaOpenAIGatewayLlmProxyCurationMosaicInvocationRoutableRequestPayload(
            prismaOpenAIInvocationSystemPromptCurationHusk: Self.prismaPartnerProfilerSystemPrompt,
            prismaOpenAIChronicleMessageCurationHusk: [
                PrismaOpenAIGatewayLlmMosaicChronicleNucleusUserAssistantLineFragment(
                    prismaOpenAIWireProtocolRoleCurationLabel: .user,
                    prismaOpenAIPayloadContentChronicleLatchedLine: prismaUserPrompt(
                        activeProfile: activeProfile,
                        conversation: prismaTrimmedConversation
                    )
                ),
            ]
        )
        do {
            let prismaResponse = try await prismaTransport.prismaDispatchOpenAIProxyCurationLlmMosaicRoutableInvocation(
                prismaCinematicLatchedCurationHusk: prismaPayload
            )
            let prismaDecoded = try Self.prismaDecodePartnerProfilerPayload(prismaResponse)
            prismaDraftPortrait = PrismaPartnerPsychologicalPortrait(
                partnerName: prismaPartnerNameText.trimmingCharacters(in: .whitespacesAndNewlines),
                partnerAge: prismaPartnerAgeText.trimmingCharacters(in: .whitespacesAndNewlines),
                psychotype: prismaDecoded.psychotype,
                dominantTraits: Array(prismaDecoded.dominantTraits.map(Self.prismaNormalizedProfilerTrait).prefix(3)),
                briefCharacteristic: prismaDecoded.briefCharacteristic
            )
            prismaCurrentStepIndex = 2
        } catch {
            prismaVisibleErrorText = "Не удалось разобрать ответ ИИ. Попробуйте отправить переписку ещё раз."
        }
        prismaIsAnalyzing = false
    }

    private func prismaUserPrompt(activeProfile: UserProfile, conversation: String) -> String {
        var fragments: [String] = []
        fragments.append("Возраст: \(prismaPartnerAgeText.trimmingCharacters(in: .whitespacesAndNewlines)).")
        if let dynamics = activeProfile.dynamicsPresetSelection {
            fragments.append("Модель: \(dynamics.prismaPartnerProfilerPromptLabel).")
        }
        if !activeProfile.relationshipDurationFreeformNarrativeText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            fragments.append("Срок отношений: \(activeProfile.relationshipDurationFreeformNarrativeText).")
        }
        return """
        Контекст: \(fragments.joined(separator: " "))
        Переписка для анализа:
        \(conversation)
        """
    }

    private static let prismaPartnerProfilerSystemPrompt = """
    Ты — эксперт-профайлер и семейный психолог. Твоя задача — составить объективный психологический портрет человека на основе фрагмента его переписки и базовых данных.
    Правила:
    Не ставь клинических диагнозов (нарцисс, психопат). Используй описательные поведенческие термины (например: "Контролирующий стиль", "Избегающий тип", "Холодный логик", "Тревожный эмпат").
    Будь объективен. Описывай как сильные стороны, так и зоны риска.
    Массив dominant_traits должен содержать существительные в именительном падеже, строго 1-2 слова максимум. Нельзя писать "стремление к", "склонность к", "агрессии для контроля", "доминированию". Примеры: "Доминирование", "Контроль", "Агрессия", "Обесценивание", "Закрытость".
    brief_characteristic должен быть одним коротким абзацем до 140 символов: только самое важное, без длинного объяснения и без обрезанных мыслей.
    Твой ответ ДОЛЖЕН БЫТЬ строго в формате JSON, без лишнего текста до или после.
    Структура JSON:
    {
    "psychotype": "Короткое название психотипа (1-3 слова)",
    "dominant_traits": ["Существительное 1", "Существительное 2", "Существительное 3"],
    "brief_characteristic": "Один короткий абзац до 140 символов."
    }
    """

    private static func prismaDecodePartnerProfilerPayload(_ rawResponse: String) throws -> PrismaPartnerProfilerDecodedPayload {
        let trimmed = rawResponse.trimmingCharacters(in: .whitespacesAndNewlines)
        let jsonString: String
        if let startIndex = trimmed.firstIndex(of: "{"),
           let endIndex = trimmed.lastIndex(of: "}"),
           startIndex <= endIndex {
            jsonString = String(trimmed[startIndex...endIndex])
        } else {
            jsonString = trimmed
        }
        let data = Data(jsonString.utf8)
        return try JSONDecoder().decode(PrismaPartnerProfilerDecodedPayload.self, from: data)
    }

    private static func prismaNormalizedProfilerTrait(_ trait: String) -> String {
        let trimmed = trait.trimmingCharacters(in: .whitespacesAndNewlines)
        if let semanticNoun = prismaSemanticProfilerTraitNoun(trimmed) {
            return semanticNoun
        }
        let lowercased = trimmed.lowercased()
        let prefixes = [
            "стремление к ",
            "склонность к ",
            "использование ",
            "использует ",
            "тенденция к "
        ]
        for prefix in prefixes where lowercased.hasPrefix(prefix) {
            let tail = trimmed.dropFirst(prefix.count)
                .trimmingCharacters(in: .whitespacesAndNewlines)
            if !tail.isEmpty {
                return tail
            }
        }
        return trimmed
    }

    private static func prismaSemanticProfilerTraitNoun(_ trait: String) -> String? {
        let lowercased = trait.lowercased()
        if lowercased.contains("доминир") {
            return "Доминирование"
        }
        if lowercased.contains("контрол") {
            return "Контроль"
        }
        if lowercased.contains("агресс") {
            return "Агрессия"
        }
        if lowercased.contains("обесцен") {
            return "Обесценивание"
        }
        if lowercased.contains("манипул") {
            return "Манипуляция"
        }
        if lowercased.contains("закрыт") || lowercased.contains("отстран") {
            return "Закрытость"
        }
        if lowercased.contains("избег") {
            return "Избегание"
        }
        return nil
    }
}

private struct PrismaPartnerProfilerDecodedPayload: Decodable {
    let psychotype: String
    let dominantTraits: [String]
    let briefCharacteristic: String

    private enum CodingKeys: String, CodingKey {
        case psychotype
        case dominantTraits = "dominant_traits"
        case briefCharacteristic = "brief_characteristic"
    }
}

private extension PrismaOnboardingDynamicsPresetSelection {
    var prismaPartnerProfilerPromptLabel: String {
        switch self {
        case .equalPartnershipBalance:
            return "Партнерство на равных"
        case .patriarchalStructureAxis:
            return "Один чаще ведет"
        case .userInitiativeLead:
            return "Пользователь чаще берет инициативу"
        case .partnerDecisionLead:
            return "Партнер чаще все решает"
        case .relationalAmbiguityUnclearDynamicsNucleus:
            return "Сложно или непонятно"
        case .userDefinedFreeformNarrative:
            return "Своя модель отношений"
        }
    }
}
