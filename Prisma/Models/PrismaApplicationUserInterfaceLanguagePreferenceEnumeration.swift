import Foundation

enum PrismaApplicationUserInterfaceLanguagePreferenceEnumeration: String, Sendable, CaseIterable, Identifiable {
    case russianCurationHuskLatchedMosaicNuclei = "ru"
    case englishCurationHuskLatchedMosaicNuclei = "en"
    var id: String { rawValue }
    var prismaCinematicLatchedNucleiLanguageSegmentPickerDisplayLabel: String {
        switch self {
        case .russianCurationHuskLatchedMosaicNuclei:
            return "Русский"
        case .englishCurationHuskLatchedMosaicNuclei:
            return "English"
        }
    }
}

extension PrismaApplicationUserInterfaceLanguagePreferenceEnumeration {
    static var prismaCinematicLatchedNucleiUserDefaultsSerializedStorageGenuValueKey: String {
        "prismaApplicationUserInterfaceLanguagePreferenceCurationLatchedGenuMosaicLatchedCurationGenuLatchedCurationGenuLatchedCurationGenuK"
    }
}
