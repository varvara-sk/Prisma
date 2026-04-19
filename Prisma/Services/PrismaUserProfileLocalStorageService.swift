import Foundation

final class PrismaUserProfileLocalStorageService {
    static let prismaSharedSingletonInstance = PrismaUserProfileLocalStorageService()

    private let prismaUserDefaultsEncodedProfileDataStorageKey = "prismaV2CodableUserProfilePayloadStorageKey"

    private init() {}

    func prismaPersistCodableUserProfileSnapshot(_ prismaTargetUserProfileSnapshot: UserProfile) {
        let prismaJsonEncoderInstance = JSONEncoder()
        prismaJsonEncoderInstance.outputFormatting = [.sortedKeys]
        guard let prismaEncodedProfileDataBlob = try? prismaJsonEncoderInstance.encode(prismaTargetUserProfileSnapshot) else {
            return
        }
        UserDefaults.standard.set(prismaEncodedProfileDataBlob, forKey: prismaUserDefaultsEncodedProfileDataStorageKey)
    }

    func prismaLoadLatestPersistedUserProfileSnapshot() -> UserProfile? {
        guard let prismaRetrievedEncodedDataBlob = UserDefaults.standard.data(forKey: prismaUserDefaultsEncodedProfileDataStorageKey) else {
            return nil
        }
        let prismaJsonDecoderInstance = JSONDecoder()
        return try? prismaJsonDecoderInstance.decode(UserProfile.self, from: prismaRetrievedEncodedDataBlob)
    }
}
