import Foundation

final class PrismaUserProfileLocalStorageService {
    static let prismaSharedSingletonInstance = PrismaUserProfileLocalStorageService()

    private let prismaUserDefaultsEncodedActiveProfileDataStorageKey = "prismaV3CodableUserProfilePayloadStorageKey"
    private let prismaUserDefaultsArchivedScenarioLedgerDataBlobStorageKey = "prismaV3ArchivedUserScenarioLedgerEntriesPayloadStorageKey"
    private let prismaUserDefaultsPrimaryChatConversationTranscriptBlobStorageKey = "prismaV1PrimaryChatConversationTranscriptPayloadStorageKey"
    private let prismaRelationshipOnboardingCompletionMarkerUserDefaultsKey = "prismaV1RelationshipOnboardingCompletionMarkerKey"
    private let prismaLegacyIsolatedApplicationProfileDisplayNameEphemeralKey = "prismaApplicationProfileDisplayNameStorageKey"
    private let prismaLegacyIsolatedApplicationProfileAgeEphemeralKey = "prismaApplicationProfileAgeNumericStorageKey"
    private let prismaLegacyIsolatedApplicationProfileGenderEphemeralKey = "prismaApplicationProfileBiologicalGenderSelectionStorageKey"
    private let prismaLegacyIsolatedApplicationProfileAttachmentEphemeralKey = "prismaApplicationProfileAttachmentStylePreferenceStorageKey"
    private let prismaLegacyIsolatedApplicationProfileAiNoteEphemeralKey = "prismaApplicationProfileAIContextualInstructionalNoteStorageKey"

    private init() {}

    func prismaFabricateMergedUserProfileSnapshotAssimilatingLegacyIsolatedApplicationTabKeysIfNeeded() -> UserProfile {
        var prismaWorkingSnapshot = prismaLoadLatestPersistedUserProfileSnapshot() ?? UserProfile()
        var prismaAssimilatedLegacyEphemeralPayloadDetectedFlag = false
        if prismaWorkingSnapshot.prismaPreferredCallsignForUserInterfaceDisplay.isEmpty,
           let prismaLegacyProbe = UserDefaults.standard.string(forKey: prismaLegacyIsolatedApplicationProfileDisplayNameEphemeralKey),
           !prismaLegacyProbe.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            prismaWorkingSnapshot.prismaPreferredCallsignForUserInterfaceDisplay = prismaLegacyProbe
            prismaAssimilatedLegacyEphemeralPayloadDetectedFlag = true
        }
        if prismaWorkingSnapshot.userAgeFreeformInputText.isEmpty,
           let prismaLegacyProbe = UserDefaults.standard.string(forKey: prismaLegacyIsolatedApplicationProfileAgeEphemeralKey),
           !prismaLegacyProbe.isEmpty {
            prismaWorkingSnapshot.userAgeFreeformInputText = prismaLegacyProbe
            prismaAssimilatedLegacyEphemeralPayloadDetectedFlag = true
        }
        if prismaWorkingSnapshot.userGender == "Не указан",
           let prismaLegacyProbe = UserDefaults.standard.string(forKey: prismaLegacyIsolatedApplicationProfileGenderEphemeralKey),
           !prismaLegacyProbe.isEmpty {
            switch prismaLegacyProbe {
            case "М":
                prismaWorkingSnapshot.userGender = "Мужской"
            case "Ж":
                prismaWorkingSnapshot.userGender = "Женский"
            default:
                prismaWorkingSnapshot.userGender = prismaLegacyProbe
            }
            prismaAssimilatedLegacyEphemeralPayloadDetectedFlag = true
        }
        if prismaWorkingSnapshot.prismaAttachmentStylePreferenceEnumerationSerializedRawValue.isEmpty,
           let prismaLegacyProbe = UserDefaults.standard.string(forKey: prismaLegacyIsolatedApplicationProfileAttachmentEphemeralKey),
           !prismaLegacyProbe.isEmpty {
            prismaWorkingSnapshot.prismaAttachmentStylePreferenceEnumerationSerializedRawValue = prismaLegacyProbe
            prismaAssimilatedLegacyEphemeralPayloadDetectedFlag = true
        }
        if prismaWorkingSnapshot.prismaAIResponsePersonalizationNoteFreeformText.isEmpty,
           let prismaLegacyProbe = UserDefaults.standard.string(forKey: prismaLegacyIsolatedApplicationProfileAiNoteEphemeralKey),
           !prismaLegacyProbe.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            prismaWorkingSnapshot.prismaAIResponsePersonalizationNoteFreeformText = prismaLegacyProbe
            prismaAssimilatedLegacyEphemeralPayloadDetectedFlag = true
        }
        if prismaAssimilatedLegacyEphemeralPayloadDetectedFlag {
            prismaPersistCodableUserProfileSnapshot(prismaWorkingSnapshot)
        }
        return prismaWorkingSnapshot
    }

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

    func prismaRemoveSingleArchivedUserScenarioLedgerEntryByIdentifierIfPresent(
        _ prismaTargetArchivedLedgerEntryIdentifier: UUID
    ) {
        var prismaMutableLedgerEntries = prismaLoadArchivedUserScenarioLedgerEntryCollection()
        prismaMutableLedgerEntries.removeAll { $0.id == prismaTargetArchivedLedgerEntryIdentifier }
        prismaPersistArchivedUserScenarioLedgerEntryCollection(prismaMutableLedgerEntries)
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

    func prismaPurgePrimaryChatConversationTranscriptPayloadFromEphemeralUserDefaultsIsolationStem() {
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsPrimaryChatConversationTranscriptBlobStorageKey)
    }

    func prismaLoadPrimaryChatConversationChronicleNucleusPersistedLineCollection() -> [PrismaPrimaryChatConversationChronicleNucleusPersistedLineFragment] {
        guard let prismaEncodedBlob = UserDefaults.standard.data(forKey: prismaUserDefaultsPrimaryChatConversationTranscriptBlobStorageKey) else {
            return []
        }
        let prismaJsonDecoderInstance = JSONDecoder()
        return (try? prismaJsonDecoderInstance.decode(
            [PrismaPrimaryChatConversationChronicleNucleusPersistedLineFragment].self,
            from: prismaEncodedBlob
        )) ?? []
    }

    func prismaPersistPrimaryChatConversationChronicleNucleusPersistedLineCollection(
        _ prismaIncomingChronicleLines: [PrismaPrimaryChatConversationChronicleNucleusPersistedLineFragment]
    ) {
        let prismaJsonEncoderInstance = JSONEncoder()
        prismaJsonEncoderInstance.outputFormatting = [.sortedKeys]
        guard let prismaEncodedBlob = try? prismaJsonEncoderInstance.encode(prismaIncomingChronicleLines) else {
            return
        }
        UserDefaults.standard.set(prismaEncodedBlob, forKey: prismaUserDefaultsPrimaryChatConversationTranscriptBlobStorageKey)
    }

    func prismaExecuteCompleteLocalSessionArtifactNuclearPurgeForAccountLogoutWithOnboardingReactivationStem() {
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsEncodedActiveProfileDataStorageKey)
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsArchivedScenarioLedgerDataBlobStorageKey)
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsPrimaryChatConversationTranscriptBlobStorageKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileDisplayNameEphemeralKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileAgeEphemeralKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileGenderEphemeralKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileAttachmentEphemeralKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileAiNoteEphemeralKey)
        UserDefaults.standard.set(false, forKey: prismaRelationshipOnboardingCompletionMarkerUserDefaultsKey)
    }
}
