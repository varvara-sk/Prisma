import Foundation

enum PrismaProductUsageTelemetrySignalEnumeration: String, Sendable {
    case relationshipOnboardingFlowCompletedSuccessfully
    case primaryChatConversationSurfaceDidAppear
    case analyticalDashboardSurfaceDidAppear
    case applicationProfileSettingsSurfaceDidAppear
}

enum PrismaProductUsageTelemetrySignalRecorder {
    private static let prismaTelemetryOrdinalTallyStorageKeyPrefixFragment = "prismaV4TelemetryOrdinalTallyKeyPrefix_"

    static func prismaIncrementOrdinalTallyForTelemetrySignal(_ prismaTelemetrySignalDescriptor: PrismaProductUsageTelemetrySignalEnumeration) {
        let prismaCompositeStorageKey = prismaTelemetryOrdinalTallyStorageKeyPrefixFragment + prismaTelemetrySignalDescriptor.rawValue
        let prismaPreviousOrdinalValue = UserDefaults.standard.integer(forKey: prismaCompositeStorageKey)
        UserDefaults.standard.set(prismaPreviousOrdinalValue + 1, forKey: prismaCompositeStorageKey)
    }
}
