import SwiftUI

struct DashboardView: View {
    @Binding var prismaMainTabShellSegmentSelectionCoordinatorOrdinal: Int
    @AppStorage("prismaV1RelationshipOnboardingCompletionMarkerKey") private var prismaRelationshipOnboardingHasCompletedPreference = false
    @State private var hasChats = false
    @State private var prismaDashboardDeveloperPopulatedInsightDatasetPreviewActiveFlag: Bool
    @State private var prismaArchivedScenarioLedgerEntries: [PrismaArchivedUserScenarioLedgerEntry] = []

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

    var body: some View {
        ZStack {
            PrismaColors.background
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center) {
                    Text("Твои инсайты")
                        .font(PrismaTypography.prismaPrimaryTitleRoundedSemibold)
                        .foregroundStyle(PrismaColors.textPrimary)
                    Spacer(minLength: 0)
                    Toggle(isOn: $prismaDashboardDeveloperPopulatedInsightDatasetPreviewActiveFlag) {
                        Text("Dev: данные")
                            .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                            .foregroundStyle(PrismaColors.textSecondary)
                    }
                    .tint(PrismaColors.primary)
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 8)
                if prismaDashboardEffectiveShouldDisplayPopulatedInsightSurface {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 20) {
                            PrismaDashboardMoodTrendChartCardView(
                                prismaMoodDataPointCollection: PrismaDashboardMockSamplePayloadFactory.prismaWeekdayAnxietyTrendPreviewSeries
                            )
                            PrismaDashboardSessionInsightClusterCardView(
                                prismaSessionInsightPayload: PrismaDashboardMockSamplePayloadFactory.prismaSessionInsightPreviewSnapshot
                            )
                            PrismaDashboardPairDynamicsCompactCardView(
                                prismaPairDynamicsNarrativeBody: PrismaDashboardMockSamplePayloadFactory.prismaPairDynamicsCompatibilityNarrativeLine
                            )
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Сценарии")
                                    .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                                    .foregroundStyle(PrismaColors.textSecondary)
                                Button {
                                    prismaLaunchFreshOnboardingCycleArchivingCurrentProfileIfNeeded()
                                } label: {
                                    Text("Новый сценарий — перепройти онбординг")
                                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                        .foregroundStyle(PrismaColors.textPrimary)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 14)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                                .fill(PrismaColors.primary.opacity(0.35))
                                        )
                                }
                                .buttonStyle(.plain)
                            }
                            .prismaDashboardCardUniformSurfaceStyle()
                            if !prismaArchivedScenarioLedgerEntries.isEmpty {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Сохранённые сценарии")
                                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                                        .foregroundStyle(PrismaColors.textSecondary)
                                    ForEach(prismaArchivedScenarioLedgerEntries) { prismaLedgerEntry in
                                        Button {
                                            prismaRestoreArchivedScenarioLedgerEntry(prismaLedgerEntry)
                                        } label: {
                                            HStack {
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text(
                                                        prismaLedgerEntry.prismaEmbeddedUserProfileSnapshot.globalMode?
                                                            .prismaCompactRussianScenarioDescriptorLabel ?? "Сценарий"
                                                    )
                                                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                                    .foregroundStyle(PrismaColors.textPrimary)
                                                    Text(prismaLedgerEntry.prismaScenarioCapturedTimestamp.formatted(date: .abbreviated, time: .shortened))
                                                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                                                        .foregroundStyle(PrismaColors.textSecondary)
                                                }
                                                Spacer(minLength: 0)
                                                Image(systemName: "arrow.uturn.backward.circle")
                                                    .foregroundStyle(PrismaColors.primary)
                                            }
                                            .padding(16)
                                            .background(
                                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                                    .fill(PrismaColors.surface)
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
            prismaRefreshArchivedScenarioLedgerEntriesFromPersistentStore()
        }
        .onChange(of: prismaRelationshipOnboardingHasCompletedPreference) { _ in
            prismaRefreshArchivedScenarioLedgerEntriesFromPersistentStore()
        }
    }

    private func prismaRefreshArchivedScenarioLedgerEntriesFromPersistentStore() {
        prismaArchivedScenarioLedgerEntries = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaLoadArchivedUserScenarioLedgerEntryCollection()
    }

    private func prismaLaunchFreshOnboardingCycleArchivingCurrentProfileIfNeeded() {
        if let prismaActiveSnapshot = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaLoadLatestPersistedUserProfileSnapshot() {
            PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
                .prismaArchiveCurrentUserProfileSnapshotBeforeStartingFreshOnboardingCycle(prismaActiveSnapshot)
        }
        prismaRefreshArchivedScenarioLedgerEntriesFromPersistentStore()
        prismaRelationshipOnboardingHasCompletedPreference = false
    }

    private func prismaRestoreArchivedScenarioLedgerEntry(_ prismaTargetLedgerEntry: PrismaArchivedUserScenarioLedgerEntry) {
        PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance.prismaRestoreUserProfileSnapshotFromArchivedLedgerEntry(
            prismaTargetLedgerEntry
        )
        prismaRelationshipOnboardingHasCompletedPreference = true
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
