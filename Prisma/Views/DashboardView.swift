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
                                    prismaArchivedLatchedScenarioNucleusLedgerChamberCollection: prismaArchivedScenarioLedgerEntries
                                )
                                PrismaDashboardMoodTrendChartCardView(
                                    prismaMoodDataPointCollection: PrismaDashboardMockSamplePayloadFactory
                                        .prismaWeekdayAnxietyTrendPreviewSeries
                                )
                                PrismaDashboardHIGNucleusQuadrupleChamberNotionCurationSessionInsightCurationView(
                                    prismaSessionCurationHIGNucleusInsightChamber: prismaResolvedAnalyticalPayloadBundleForCurrentSelection
                                        .prismaEmbeddedInsightDataSnapshot
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
                                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                    .prismaComfortableMultilineReadableTextBlockModifierChain()
                                    .lineSpacing(5)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 16)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(PrismaColors.prismaDashboardWidenAdditiveSituationLavenderBathCtaCinematicFrostNucleus().opacity(0.85))
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                            .listRowInsets(EdgeInsets(top: 4, leading: 20, bottom: 4, trailing: 20))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                        if !prismaArchivedScenarioLedgerEntries.isEmpty {
                            Section {
                                ForEach(prismaArchivedScenarioLedgerEntries) { prismaLatchedScenarioLedgerNucleusChamber in
                                    HStack(alignment: .top, spacing: 0) {
                                        Button {
                                            prismaRestoreArchivedScenarioLedgerEntry(prismaLatchedScenarioLedgerNucleusChamber)
                                        } label: {
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(
                                                    prismaLatchedScenarioLedgerNucleusChamber.prismaEmbeddedUserProfileSnapshot.globalMode?
                                                        .prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(language) ?? PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                                                        .dashboardSituationTypeFallback
                                                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                                                )
                                                .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                                .multilineTextAlignment(.leading)
                                                Text(
                                                    prismaLatchedScenarioLedgerNucleusChamber.prismaScenarioCapturedTimestamp
                                                        .formatted(date: .abbreviated, time: .shortened)
                                                )
                                                .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                                                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        .buttonStyle(.plain)
                                        Menu {
                                            Button(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                                                .dashboardActionDelete
                                                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language), role: .destructive) {
                                                prismaCinematicHIGCurationDeleteLatchedScenarioLedgerNucleusChamber(
                                                    prismaLatchedScenarioLedgerNucleusChamber
                                                )
                                            }
                                        } label: {
                                            Image(systemName: "ellipsis")
                                                .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                                                .fontWeight(.semibold)
                                                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                                .frame(width: 36, height: 36)
                                        }
                                    }
                                    .prismaDashboardInsightsHIGNotionCinematicNucleusDocumentaryCardChromaticDropShadowChamberSurfaceStyle()
                                    .listRowInsets(EdgeInsets(top: 6, leading: 20, bottom: 6, trailing: 20))
                                    .listRowBackground(Color.clear)
                                    .listRowSeparator(.hidden)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                                            .dashboardActionDelete
                                            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language), role: .destructive) {
                                            prismaCinematicHIGCurationDeleteLatchedScenarioLedgerNucleusChamber(
                                                prismaLatchedScenarioLedgerNucleusChamber
                                            )
                                        }
                                    }
                                }
                            } header: {
                                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                                    .dashboardSituationHistory
                                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                                )
                                .font(PrismaDashboardInsightsHIGSurfaceTypography.bodyReadingPrimaryNucleus)
                                .fontWeight(.semibold)
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .textCase(nil)
                            } footer: {
                                Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                                    .dashboardSwipeToDelete
                                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                                )
                                .font(PrismaDashboardInsightsHIGSurfaceTypography.footnoteDeemphasizedNucleus)
                                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                            }
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
    }

    private func prismaCinematicHIGCurationDeleteLatchedScenarioLedgerNucleusChamber(
        _ prismaLatchedNucleusLedgerChamber: PrismaArchivedUserScenarioLedgerEntry
    ) {
        PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaRemoveSingleArchivedUserScenarioLedgerEntryByIdentifierIfPresent(prismaLatchedNucleusLedgerChamber.id)
        prismaRefreshActiveUserProfileSnapshotAndArchivedLedgerFromPersistentStore()
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
