import SwiftUI

struct DashboardView: View {
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
        switch prismaDashboardSelectedContextFacetIdentifierEnumeration {
        case .activePrimaryUserProfileContextFacet:
            return PrismaDashboardMockSamplePayloadFactory.prismaAnalyticalPayloadBundleForGlobalModeFacet(
                prismaHydratedActiveUserProfileSnapshotForDashboardSurface.globalMode
            )
        case .archivedLedgerEmbeddedSnapshotContextFacet(let prismaArchivedLedgerEmbeddedEntry):
            return PrismaDashboardMockSamplePayloadFactory.prismaAnalyticalPayloadBundleForGlobalModeFacet(
                prismaArchivedLedgerEmbeddedEntry.prismaEmbeddedUserProfileSnapshot.globalMode
            )
        }
    }

    var body: some View {
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center) {
                    Text("Твои инсайты")
                        .font(PrismaTypography.prismaPremiumScreenTitleRoundedBold)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Spacer(minLength: 0)
                    Toggle(isOn: $prismaDashboardDeveloperPopulatedInsightDatasetPreviewActiveFlag) {
                        Text("Dev: данные")
                            .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                            .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    }
                    .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 8)
                if prismaDashboardEffectiveShouldDisplayPopulatedInsightSurface {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            PrismaDashboardHorizontalContextFacetSelectionStripView(
                                prismaDashboardSelectedContextFacetIdentifierBinding: $prismaDashboardSelectedContextFacetIdentifierEnumeration,
                                prismaActivePrimaryUserProfileSnapshotForLabelFabrication: prismaHydratedActiveUserProfileSnapshotForDashboardSurface,
                                prismaArchivedScenarioLedgerEntryCollection: prismaArchivedScenarioLedgerEntries
                            )
                            PrismaDashboardCompactActiveUserIdentityRibbonCardView(
                                prismaActiveUserProfileSnapshotForIdentityRibbon: prismaHydratedActiveUserProfileSnapshotForDashboardSurface
                            )
                            PrismaDashboardMoodTrendChartCardView(
                                prismaMoodDataPointCollection: PrismaDashboardMockSamplePayloadFactory.prismaWeekdayAnxietyTrendPreviewSeries
                            )
                            PrismaDashboardSessionInsightClusterCardView(
                                prismaSessionInsightPayload: prismaResolvedAnalyticalPayloadBundleForCurrentSelection.prismaEmbeddedInsightDataSnapshot
                            )
                            PrismaDashboardPairDynamicsCompactCardView(
                                prismaPairDynamicsSectionLocalizedTitle: prismaResolvedAnalyticalPayloadBundleForCurrentSelection
                                    .prismaPairDynamicsSectionLocalizedTitle,
                                prismaPairDynamicsNarrativeBody: prismaResolvedAnalyticalPayloadBundleForCurrentSelection
                                    .prismaPairDynamicsNarrativeBodyLine
                            )
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Новая ситуация")
                                    .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                Text("Отдельный рассказ в онбординге — чтобы не смешивать с тем, что уже выбрали выше.")
                                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(4)
                                    .fixedSize(horizontal: false, vertical: true)
                                Button {
                                    prismaLaunchFreshOnboardingCycleArchivingCurrentProfileIfNeeded()
                                } label: {
                                    Text("Добавить ситуацию")
                                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(4)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 14)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                                .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.35))
                                        )
                                }
                                .buttonStyle(.plain)
                            }
                            .prismaDashboardCardUniformSurfaceStyle()
                            if !prismaArchivedScenarioLedgerEntries.isEmpty {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Сохранённые ситуации")
                                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                    Text("Можно вернуть в приложение как основную — это не меняет выбранный выше просмотр инсайтов, пока вы сами не переключите полоску.")
                                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(4)
                                        .fixedSize(horizontal: false, vertical: true)
                                    ForEach(prismaArchivedScenarioLedgerEntries) { prismaLedgerEntry in
                                        Button {
                                            prismaRestoreArchivedScenarioLedgerEntry(prismaLedgerEntry)
                                        } label: {
                                            HStack {
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text(
                                                        prismaLedgerEntry.prismaEmbeddedUserProfileSnapshot.globalMode?
                                                            .prismaCompactRussianScenarioDescriptorLabel ?? "Ситуация"
                                                    )
                                                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                                    Text(prismaLedgerEntry.prismaScenarioCapturedTimestamp.formatted(date: .abbreviated, time: .shortened))
                                                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                                                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                                }
                                                Spacer(minLength: 0)
                                                Image(systemName: "arrow.uturn.backward.circle")
                                                    .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                            }
                                            .padding(16)
                                            .background(
                                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                                    .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                            )
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 24)
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
}

#Preview("Empty") {
    DashboardView(
        prismaMainTabShellSegmentSelectionCoordinatorOrdinal: .constant(2),
        prismaDashboardInitialConversationHistoryPresenceFlag: false,
        prismaDashboardInitialDeveloperPopulatedDatasetPreviewActiveFlag: false
    )
}
