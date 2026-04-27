import Foundation

struct PrismaAnalyzerConversationReportSnapshot: Codable, Equatable, Hashable, Identifiable, Sendable {
    var id: UUID
    var createdAt: Date
    var rawMarkdownText: String
    var toneMarkdownText: String
    var repeatedPatternsMarkdownText: String
    var hiddenTensionMarkdownText: String
    var redFlagsMarkdownText: String
    var nextStepMarkdownText: String
}

struct PrismaDailyAnxietyCheckInSnapshot: Codable, Equatable, Hashable, Identifiable, Sendable {
    var id: UUID
    var createdAt: Date
    var anxietyLevelOneThroughTen: Int
}

struct PrismaFreemiumUsageLedgerSnapshot: Codable, Equatable, Hashable, Sendable {
    var chatMessagesDateKey: String
    var chatMessagesTodayCount: Int
    var analyzerUsedCount: Int
    var isPremium: Bool
}

final class PrismaUserProfileLocalStorageService {
    static let prismaSharedSingletonInstance = PrismaUserProfileLocalStorageService()

    private let prismaUserDefaultsEncodedActiveProfileDataStorageKey = "prismaV3CodableUserProfilePayloadStorageKey"
    private let prismaUserDefaultsArchivedScenarioLedgerDataBlobStorageKey = "prismaV3ArchivedUserScenarioLedgerEntriesPayloadStorageKey"
    private let prismaUserDefaultsPrimaryChatConversationTranscriptBlobStorageKey = "prismaV1PrimaryChatConversationTranscriptPayloadStorageKey"
    private let prismaUserDefaultsAnalyzerConversationReportSnapshotBlobStorageKey = "prismaV1AnalyzerConversationReportSnapshotBlobStorageKey"
    private let prismaUserDefaultsDailyAnxietyCheckInSnapshotBlobStorageKey = "prismaV1DailyAnxietyCheckInSnapshotBlobStorageKey"
    private let prismaUserDefaultsFreemiumUsageLedgerSnapshotBlobStorageKey = "prismaV1FreemiumUsageLedgerSnapshotBlobStorageKey"
    private let prismaRelationshipOnboardingCompletionMarkerUserDefaultsKey = "prismaV1RelationshipOnboardingCompletionMarkerKey"
    private let prismaLegalTermsPrivacyConsentAcceptedUserDefaultsKey = "prismaV1LegalTermsPrivacyConsentAcceptedUserDefaultsKey"
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

    func prismaLoadAnalyzerConversationReportSnapshot() -> PrismaAnalyzerConversationReportSnapshot? {
        guard let prismaEncodedBlob = UserDefaults.standard.data(forKey: prismaUserDefaultsAnalyzerConversationReportSnapshotBlobStorageKey) else {
            return nil
        }
        return try? JSONDecoder().decode(PrismaAnalyzerConversationReportSnapshot.self, from: prismaEncodedBlob)
    }

    func prismaPersistAnalyzerConversationReportSnapshot(_ prismaIncomingReportSnapshot: PrismaAnalyzerConversationReportSnapshot) {
        let prismaJsonEncoderInstance = JSONEncoder()
        prismaJsonEncoderInstance.outputFormatting = [.sortedKeys]
        guard let prismaEncodedBlob = try? prismaJsonEncoderInstance.encode(prismaIncomingReportSnapshot) else {
            return
        }
        UserDefaults.standard.set(prismaEncodedBlob, forKey: prismaUserDefaultsAnalyzerConversationReportSnapshotBlobStorageKey)
    }

    func prismaLoadDailyAnxietyCheckInSnapshotCollection() -> [PrismaDailyAnxietyCheckInSnapshot] {
        guard let prismaEncodedBlob = UserDefaults.standard.data(forKey: prismaUserDefaultsDailyAnxietyCheckInSnapshotBlobStorageKey) else {
            return []
        }
        return (try? JSONDecoder().decode([PrismaDailyAnxietyCheckInSnapshot].self, from: prismaEncodedBlob)) ?? []
    }

    func prismaPersistDailyAnxietyCheckInSnapshotCollection(_ prismaIncomingCheckInSnapshots: [PrismaDailyAnxietyCheckInSnapshot]) {
        let prismaJsonEncoderInstance = JSONEncoder()
        prismaJsonEncoderInstance.outputFormatting = [.sortedKeys]
        guard let prismaEncodedBlob = try? prismaJsonEncoderInstance.encode(prismaIncomingCheckInSnapshots) else {
            return
        }
        UserDefaults.standard.set(prismaEncodedBlob, forKey: prismaUserDefaultsDailyAnxietyCheckInSnapshotBlobStorageKey)
    }

    func prismaUpsertDailyAnxietyCheckInSnapshotForToday(_ prismaIncomingAnxietyLevelOneThroughTen: Int) {
        let prismaCalendar = Calendar.current
        var prismaWorkingSnapshots = prismaLoadDailyAnxietyCheckInSnapshotCollection()
        prismaWorkingSnapshots.removeAll {
            prismaCalendar.isDateInToday($0.createdAt)
        }
        prismaWorkingSnapshots.append(
            PrismaDailyAnxietyCheckInSnapshot(
                id: UUID(),
                createdAt: Date(),
                anxietyLevelOneThroughTen: prismaIncomingAnxietyLevelOneThroughTen
            )
        )
        prismaPersistDailyAnxietyCheckInSnapshotCollection(Array(prismaWorkingSnapshots.suffix(14)))
    }

    func prismaLoadFreemiumUsageLedgerSnapshot() -> PrismaFreemiumUsageLedgerSnapshot {
        let prismaTodayKey = Self.prismaTodayUsageLedgerDateKey()
        guard let prismaEncodedBlob = UserDefaults.standard.data(forKey: prismaUserDefaultsFreemiumUsageLedgerSnapshotBlobStorageKey),
              var prismaLedger = try? JSONDecoder().decode(PrismaFreemiumUsageLedgerSnapshot.self, from: prismaEncodedBlob) else {
            return PrismaFreemiumUsageLedgerSnapshot(
                chatMessagesDateKey: prismaTodayKey,
                chatMessagesTodayCount: 0,
                analyzerUsedCount: 0,
                isPremium: false
            )
        }
        if prismaLedger.chatMessagesDateKey != prismaTodayKey {
            prismaLedger.chatMessagesDateKey = prismaTodayKey
            prismaLedger.chatMessagesTodayCount = 0
            prismaPersistFreemiumUsageLedgerSnapshot(prismaLedger)
        }
        return prismaLedger
    }

    func prismaPersistFreemiumUsageLedgerSnapshot(_ prismaIncomingLedgerSnapshot: PrismaFreemiumUsageLedgerSnapshot) {
        let prismaJsonEncoderInstance = JSONEncoder()
        prismaJsonEncoderInstance.outputFormatting = [.sortedKeys]
        guard let prismaEncodedBlob = try? prismaJsonEncoderInstance.encode(prismaIncomingLedgerSnapshot) else {
            return
        }
        UserDefaults.standard.set(prismaEncodedBlob, forKey: prismaUserDefaultsFreemiumUsageLedgerSnapshotBlobStorageKey)
    }

    func prismaIncrementFreemiumChatMessagesTodayCount() {
        var prismaLedger = prismaLoadFreemiumUsageLedgerSnapshot()
        prismaLedger.chatMessagesTodayCount += 1
        prismaPersistFreemiumUsageLedgerSnapshot(prismaLedger)
    }

    func prismaIncrementFreemiumAnalyzerUsedCount() {
        var prismaLedger = prismaLoadFreemiumUsageLedgerSnapshot()
        prismaLedger.analyzerUsedCount += 1
        prismaPersistFreemiumUsageLedgerSnapshot(prismaLedger)
    }

    func prismaLoadLegalTermsPrivacyConsentAcceptedFlag() -> Bool {
        UserDefaults.standard.bool(forKey: prismaLegalTermsPrivacyConsentAcceptedUserDefaultsKey)
    }

    func prismaPersistLegalTermsPrivacyConsentAcceptedFlag(_ prismaIncomingConsentFlag: Bool) {
        UserDefaults.standard.set(prismaIncomingConsentFlag, forKey: prismaLegalTermsPrivacyConsentAcceptedUserDefaultsKey)
    }

    func prismaExecuteCompleteLocalSessionArtifactNuclearPurgeForAccountLogoutWithOnboardingReactivationStem() {
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsEncodedActiveProfileDataStorageKey)
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsArchivedScenarioLedgerDataBlobStorageKey)
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsPrimaryChatConversationTranscriptBlobStorageKey)
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsAnalyzerConversationReportSnapshotBlobStorageKey)
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsDailyAnxietyCheckInSnapshotBlobStorageKey)
        UserDefaults.standard.removeObject(forKey: prismaUserDefaultsFreemiumUsageLedgerSnapshotBlobStorageKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileDisplayNameEphemeralKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileAgeEphemeralKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileGenderEphemeralKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileAttachmentEphemeralKey)
        UserDefaults.standard.removeObject(forKey: prismaLegacyIsolatedApplicationProfileAiNoteEphemeralKey)
        UserDefaults.standard.removeObject(forKey: prismaLegalTermsPrivacyConsentAcceptedUserDefaultsKey)
        UserDefaults.standard.set(false, forKey: prismaRelationshipOnboardingCompletionMarkerUserDefaultsKey)
    }

    private static func prismaTodayUsageLedgerDateKey() -> String {
        let prismaFormatter = DateFormatter()
        prismaFormatter.calendar = Calendar(identifier: .gregorian)
        prismaFormatter.locale = Locale(identifier: "en_US_POSIX")
        prismaFormatter.dateFormat = "yyyy-MM-dd"
        return prismaFormatter.string(from: Date())
    }
}
