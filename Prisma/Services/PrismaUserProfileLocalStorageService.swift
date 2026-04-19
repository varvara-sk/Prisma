import Foundation

final class PrismaUserProfileLocalStorageService {
    static let prismaSharedSingletonInstance = PrismaUserProfileLocalStorageService()

    private let prismaUserDefaultsEncodedActiveProfileDataStorageKey = "prismaV3CodableUserProfilePayloadStorageKey"
    private let prismaUserDefaultsArchivedScenarioLedgerDataBlobStorageKey = "prismaV3ArchivedUserScenarioLedgerEntriesPayloadStorageKey"

    private init() {}

    func prismaPersistCodableUserProfileSnapshot(_ prismaTargetUserProfileSnapshot: UserProfile) {
        let prismaJsonEncoderInstance = JSONEncoder()
        prismaJsonEncoderInstance.outputFormatting = [.sortedKeys]
        guard let prismaEncodedProfileDataBlob = try? prismaJsonEncoderInstance.encode(prismaTargetUserProfileSnapshot) else {
            return
        }
        UserDefaults.standard.set(prismaEncodedProfileDataBlob, forKey: prismaUserDefaultsEncodedActiveProfileDataStorageKey)
    }

    func prismaLoadLatestPersistedUserProfileSnapshot() -> UserProfile? {
        guard let prismaRetrievedEncodedDataBlob = UserDefaults.standard.data(forKey: prismaUserDefaultsEncodedActiveProfileDataStorageKey) else {
            return nil
        }
        let prismaJsonDecoderInstance = JSONDecoder()
        return try? prismaJsonDecoderInstance.decode(UserProfile.self, from: prismaRetrievedEncodedDataBlob)
    }

    func prismaLoadArchivedUserScenarioLedgerEntryCollection() -> [PrismaArchivedUserScenarioLedgerEntry] {
        guard let prismaLedgerEncodedBlob = UserDefaults.standard.data(forKey: prismaUserDefaultsArchivedScenarioLedgerDataBlobStorageKey) else {
            return []
        }
        let prismaJsonDecoderInstance = JSONDecoder()
        return (try? prismaJsonDecoderInstance.decode([PrismaArchivedUserScenarioLedgerEntry].self, from: prismaLedgerEncodedBlob)) ?? []
    }

    func prismaPersistArchivedUserScenarioLedgerEntryCollection(_ prismaIncomingLedgerEntries: [PrismaArchivedUserScenarioLedgerEntry]) {
        let prismaJsonEncoderInstance = JSONEncoder()
        prismaJsonEncoderInstance.outputFormatting = [.sortedKeys]
        guard let prismaEncodedLedgerBlob = try? prismaJsonEncoderInstance.encode(prismaIncomingLedgerEntries) else {
            return
        }
        UserDefaults.standard.set(prismaEncodedLedgerBlob, forKey: prismaUserDefaultsArchivedScenarioLedgerDataBlobStorageKey)
    }

    func prismaArchiveCurrentUserProfileSnapshotBeforeStartingFreshOnboardingCycle(_ prismaSnapshotToArchive: UserProfile) {
        guard prismaSnapshotToArchive.globalMode != nil else {
            return
        }
        var prismaMutableLedgerEntries = prismaLoadArchivedUserScenarioLedgerEntryCollection()
        let prismaNewLedgerEntry = PrismaArchivedUserScenarioLedgerEntry(prismaEmbeddedUserProfileSnapshot: prismaSnapshotToArchive)
        prismaMutableLedgerEntries.insert(prismaNewLedgerEntry, at: 0)
        let prismaTrimmedLedgerEntries = Array(prismaMutableLedgerEntries.prefix(24))
        prismaPersistArchivedUserScenarioLedgerEntryCollection(prismaTrimmedLedgerEntries)
    }

    func prismaRestoreUserProfileSnapshotFromArchivedLedgerEntry(_ prismaTargetLedgerEntry: PrismaArchivedUserScenarioLedgerEntry) {
        prismaPersistCodableUserProfileSnapshot(prismaTargetLedgerEntry.prismaEmbeddedUserProfileSnapshot)
    }
}
