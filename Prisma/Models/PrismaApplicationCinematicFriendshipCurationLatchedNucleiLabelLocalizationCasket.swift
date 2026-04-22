import Foundation

enum PrismaApplicationCinematicFriendshipCurationLatchedNucleiLabelLocalizationCasket: Sendable {
    static func prismaCinematicLatchedNucleiSocialRoleCurationLabeledMosaic(
        roleStorageStabilityId: String,
        _ userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch (roleStorageStabilityId, userInterfaceActiveLanguage) {
        case ("Colleague", .russianCurationHuskLatchedMosaicNuclei): return "Коллега"
        case ("Colleague", .englishCurationHuskLatchedMosaicNuclei): return "Colleague"
        case ("Boss / Manager", .russianCurationHuskLatchedMosaicNuclei): return "Начальник / руководитель"
        case ("Boss / Manager", .englishCurationHuskLatchedMosaicNuclei): return "Boss / manager"
        case ("Friend", .russianCurationHuskLatchedMosaicNuclei): return "Друг / подруга"
        case ("Friend", .englishCurationHuskLatchedMosaicNuclei): return "Friend"
        case ("Relative", .russianCurationHuskLatchedMosaicNuclei): return "Родственник"
        case ("Relative", .englishCurationHuskLatchedMosaicNuclei): return "Relative"
        case ("Acquaintance", .russianCurationHuskLatchedMosaicNuclei): return "Знакомый"
        case ("Acquaintance", .englishCurationHuskLatchedMosaicNuclei): return "Acquaintance"
        default: return roleStorageStabilityId
        }
    }

    static func prismaCinematicLatchedNucleiFrictionCurationLabeledMosaic(
        frictionStorageStabilityId: String,
        _ userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch (frictionStorageStabilityId, userInterfaceActiveLanguage) {
        case ("Constant interruptions", .russianCurationHuskLatchedMosaicNuclei): return "Постоянно перебивает"
        case ("Constant interruptions", .englishCurationHuskLatchedMosaicNuclei): return "Constant interruptions"
        case ("Passive aggression", .russianCurationHuskLatchedMosaicNuclei): return "Пассивная агрессия"
        case ("Passive aggression", .englishCurationHuskLatchedMosaicNuclei): return "Passive aggression"
        case ("Disrespects boundaries", .russianCurationHuskLatchedMosaicNuclei): return "Нарушает границы"
        case ("Disrespects boundaries", .englishCurationHuskLatchedMosaicNuclei): return "Disrespects boundaries"
        case ("Devalues my opinion", .russianCurationHuskLatchedMosaicNuclei): return "Обесценивает мнение"
        case ("Devalues my opinion", .englishCurationHuskLatchedMosaicNuclei): return "Devalues my opinion"
        case ("Only talks about themselves", .russianCurationHuskLatchedMosaicNuclei): return "Только о себе"
        case ("Only talks about themselves", .englishCurationHuskLatchedMosaicNuclei): return "Only talks about themselves"
        case ("Gossips / toxic", .russianCurationHuskLatchedMosaicNuclei): return "Сплетни / токсичность"
        case ("Gossips / toxic", .englishCurationHuskLatchedMosaicNuclei): return "Gossip / toxic"
        case ("Unreliable / flaky", .russianCurationHuskLatchedMosaicNuclei): return "Ненадёжность"
        case ("Unreliable / flaky", .englishCurationHuskLatchedMosaicNuclei): return "Unreliable / flaky"
        default: return frictionStorageStabilityId
        }
    }
}
