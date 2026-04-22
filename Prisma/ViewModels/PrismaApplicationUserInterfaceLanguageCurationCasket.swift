import Foundation
import SwiftUI

@MainActor
final class PrismaApplicationUserInterfaceLanguageCurationCasket: ObservableObject {
    @Published var activeLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration {
        didSet {
            UserDefaults.standard.set(
                activeLanguage.rawValue,
                forKey: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
                    .prismaCinematicLatchedNucleiUserDefaultsSerializedStorageGenuValueKey
            )
        }
    }

    init() {
        if let v = UserDefaults.standard.string(
            forKey: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
                .prismaCinematicLatchedNucleiUserDefaultsSerializedStorageGenuValueKey
        ),
        let c = PrismaApplicationUserInterfaceLanguagePreferenceEnumeration(rawValue: v) {
            activeLanguage = c
        } else {
            activeLanguage = .russianCurationHuskLatchedMosaicNuclei
        }
    }
}
