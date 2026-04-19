import SwiftUI

struct DashboardView: View {
    @AppStorage("prismaV1RelationshipOnboardingCompletionMarkerKey") private var prismaRelationshipOnboardingHasCompletedPreference = false
    @State private var prismaArchivedScenarioLedgerEntries: [PrismaArchivedUserScenarioLedgerEntry] = []

    var body: some View {
        ZStack {
            PrismaColors.background
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Твои инсайты")
                        .font(PrismaTypography.prismaPrimaryTitleRoundedSemibold)
                        .foregroundStyle(PrismaColors.textPrimary)
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
                .padding(.vertical, 24)
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
