import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Binding var prismaMainTabShellSegmentSelectionCoordinatorOrdinal: Int
    @AppStorage("prismaV1RelationshipOnboardingCompletionMarkerKey") private var prismaRelationshipOnboardingHasCompletedPreference = false
    @State private var hasChats = false
    @State private var prismaDashboardDeveloperPopulatedInsightDatasetPreviewActiveFlag: Bool
    @State private var prismaArchivedScenarioLedgerEntries: [PrismaArchivedUserScenarioLedgerEntry] = []
    @State private var prismaHydratedActiveUserProfileSnapshotForDashboardSurface = UserProfile()
    @State private var prismaDashboardSelectedContextFacetIdentifierEnumeration: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration =
        .activePrimaryUserProfileContextFacet
    @State private var prismaDashboardSituationPickerSheetPresentedFlag = false
    @State private var prismaPartnerPortraitFlowSheetPresentedFlag = false
    @StateObject private var prismaPartnerPortraitFlowViewModel = PrismaPartnerPsychologicalPortraitFlowViewModel()

    init(
        prismaMainTabShellSegmentSelectionCoordinatorOrdinal: Binding<Int>,
        prismaDashboardInitialConversationHistoryPresenceFlag: Bool = false,
        prismaDashboardInitialDeveloperPopulatedDatasetPreviewActiveFlag: Bool = true
    ) {
        _prismaMainTabShellSegmentSelectionCoordinatorOrdinal = prismaMainTabShellSegmentSelectionCoordinatorOrdinal
        _hasChats = State(initialValue: prismaDashboardInitialConversationHistoryPresenceFlag)
        _prismaDashboardDeveloperPopulatedInsightDatasetPreviewActiveFlag = State(
            initialValue: prismaDashboardInitialDeveloperPopulatedDatasetPreviewActiveFlag
        )
    }

    private var prismaDashboardEffectiveShouldDisplayPopulatedInsightSurface: Bool {
        hasChats || prismaDashboardDeveloperPopulatedInsightDatasetPreviewActiveFlag
    }

    private var prismaResolvedAnalyticalPayloadBundleForCurrentSelection: PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor {
        PrismaDashboardMockSamplePayloadFactory.prismaAnalyticalPayloadBundleForDashboardAnalyticalContextFacetIsolationEnvelopeDescriptor(
            prismaDashboardSelectedContextFacetIdentifierEnumeration,
            prismaHydratedFallbackActiveUserProfileSnapshotStem: prismaHydratedActiveUserProfileSnapshotForDashboardSurface
        )
    }

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .dashboardYourInsights
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.screenHeroTitleDisplayNucleus)
                    .kerning(0.2)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Spacer(minLength: 0)
                    Toggle(isOn: $prismaDashboardDeveloperPopulatedInsightDatasetPreviewActiveFlag) {
                        Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                            .dashboardDevData
                            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                        )
                        .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    }
                    .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                }
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
                                Button {
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
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(PrismaColors.prismaDashboardHighContrastInteractivePillFillNucleus(prismaRuntimeActiveAppThemeComposition))
                                    )
                                }
                                .buttonStyle(.plain)
                                prismaPartnerPsychologicalPortraitDashboardCardChamber(language)
                                PrismaDashboardMoodTrendChartCardView(
                                    prismaMoodDataPointCollection: PrismaDashboardMockSamplePayloadFactory
                                        .prismaWeekdayAnxietyTrendPreviewSeries
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
                    .lineLimit(prismaPortrait == nil ? 3 : 4)
                }
                Spacer(minLength: 0)
            }
            if let prismaPortrait {
                HStack(spacing: 8) {
                    ForEach(Array(prismaPortrait.dominantTraits.prefix(3)), id: \.self) { trait in
                        Text(trait)
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                            .padding(.vertical, 7)
                            .padding(.horizontal, 10)
                            .background(
                                Capsule(style: .continuous)
                                    .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.10))
                            )
                    }
                }
            }
            Button {
                prismaPartnerPortraitFlowViewModel.prismaResetFlow()
                prismaPartnerPortraitFlowSheetPresentedFlag = true
            } label: {
                Text(prismaPortrait == nil ? "Создать портрет" : "Обновить портрет")
                    .font(PrismaDashboardInsightsHIGSurfaceTypography.calloutPillNucleus)
                    .fontWeight(.semibold)
                    .foregroundStyle(PrismaColors.prismaDashboardHighContrastInteractivePillTextNucleus(prismaRuntimeActiveAppThemeComposition))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(PrismaColors.prismaDashboardHighContrastInteractivePillFillNucleus(prismaRuntimeActiveAppThemeComposition))
                    )
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
                            Text(trait)
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                .padding(.vertical, 7)
                                .padding(.horizontal, 10)
                                .background(
                                    Capsule(style: .continuous)
                                        .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.10))
                                )
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

    private func prismaPersistPartnerPsychologicalPortrait(_ prismaPortrait: PrismaPartnerPsychologicalPortrait) {
        var prismaWorkingProfile = prismaHydratedActiveUserProfileSnapshotForDashboardSurface
        prismaWorkingProfile.prismaPartnerPsychologicalPortrait = prismaPortrait
        PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaPersistCodableUserProfileSnapshot(prismaWorkingProfile)
        prismaHydratedActiveUserProfileSnapshotForDashboardSurface = prismaWorkingProfile
    }

    private func prismaRefreshActiveUserProfileSnapshotAndArchivedLedgerFromPersistentStore() {
        prismaHydratedActiveUserProfileSnapshotForDashboardSurface = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaFabricateMergedUserProfileSnapshotAssimilatingLegacyIsolatedApplicationTabKeysIfNeeded()
        prismaArchivedScenarioLedgerEntries = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaLoadArchivedUserScenarioLedgerEntryCollection()
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
        prismaDashboardInitialConversationHistoryPresenceFlag: false,
        prismaDashboardInitialDeveloperPopulatedDatasetPreviewActiveFlag: false
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
                dominantTraits: Array(prismaDecoded.dominantTraits.prefix(3)),
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
    Не ставь клинических диагнозов (нарцисс, психопат). Используй описательные поведенческие термины (например: "Склонен к манипуляциям", "Избегающий тип", "Холодный логик", "Тревожный эмпат").
    Будь объективен. Описывай как сильные стороны, так и зоны риска.
    Твой ответ ДОЛЖЕН БЫТЬ строго в формате JSON, без лишнего текста до или после.
    Структура JSON:
    {
    "psychotype": "Короткое название психотипа (1-3 слова)",
    "dominant_traits": ["Черта 1", "Черта 2", "Черта 3"],
    "brief_characteristic": "Текст на 2-3 предложения. Как этот человек ведет себя в отношениях, что для него важно и как с ним лучше коммуницировать."
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
