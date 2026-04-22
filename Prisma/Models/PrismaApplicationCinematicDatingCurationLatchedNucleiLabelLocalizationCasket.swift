import Foundation

enum PrismaApplicationCinematicDatingCurationLatchedNucleiLabelLocalizationCasket: Sendable {
    static func prismaCinematicLatchedNucleiPriorityCurationLabeledMosaic(
        storageStabilityId: String,
        _ userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch (storageStabilityId, userInterfaceActiveLanguage) {
        case ("Humor", .russianCurationHuskLatchedMosaicNuclei): return "Юмор"
        case ("Humor", .englishCurationHuskLatchedMosaicNuclei): return "Humor"
        case ("Care & Respect", .russianCurationHuskLatchedMosaicNuclei): return "Забота и уважение"
        case ("Care & Respect", .englishCurationHuskLatchedMosaicNuclei): return "Care & respect"
        case ("Physical Attraction", .russianCurationHuskLatchedMosaicNuclei): return "Внешность"
        case ("Physical Attraction", .englishCurationHuskLatchedMosaicNuclei): return "Physical attraction"
        case ("Financial Stability", .russianCurationHuskLatchedMosaicNuclei): return "Финансовая стабильность"
        case ("Financial Stability", .englishCurationHuskLatchedMosaicNuclei): return "Financial stability"
        case ("Attentiveness", .russianCurationHuskLatchedMosaicNuclei): return "Внимательность"
        case ("Attentiveness", .englishCurationHuskLatchedMosaicNuclei): return "Attentiveness"
        case ("Empathy", .russianCurationHuskLatchedMosaicNuclei): return "Эмпатия"
        case ("Empathy", .englishCurationHuskLatchedMosaicNuclei): return "Empathy"
        case ("Shared Interests", .russianCurationHuskLatchedMosaicNuclei): return "Общие интересы"
        case ("Shared Interests", .englishCurationHuskLatchedMosaicNuclei): return "Shared interests"
        case ("Loyalty", .russianCurationHuskLatchedMosaicNuclei): return "Верность"
        case ("Loyalty", .englishCurationHuskLatchedMosaicNuclei): return "Loyalty"
        case ("Intellect", .russianCurationHuskLatchedMosaicNuclei): return "Интеллект"
        case ("Intellect", .englishCurationHuskLatchedMosaicNuclei): return "Intellect"
        case ("Initiative", .russianCurationHuskLatchedMosaicNuclei): return "Инициативность"
        case ("Initiative", .englishCurationHuskLatchedMosaicNuclei): return "Initiative"
        default: return storageStabilityId
        }
    }

    static func prismaCinematicLatchedNucleiDatingRedFlagCurationLabeledMosaic(
        redFlagStorageStabilityId: String,
        _ userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch (redFlagStorageStabilityId, userInterfaceActiveLanguage) {
        case ("Aggression", .russianCurationHuskLatchedMosaicNuclei): return "Агрессия"
        case ("Aggression", .englishCurationHuskLatchedMosaicNuclei): return "Aggression"
        case ("Lying / Deception", .russianCurationHuskLatchedMosaicNuclei): return "Ложь / обман"
        case ("Lying / Deception", .englishCurationHuskLatchedMosaicNuclei): return "Lying / deception"
        case ("Ghosting", .russianCurationHuskLatchedMosaicNuclei): return "Гостинг"
        case ("Ghosting", .englishCurationHuskLatchedMosaicNuclei): return "Ghosting"
        case ("Disrespects boundaries", .russianCurationHuskLatchedMosaicNuclei): return "Нарушение границ"
        case ("Disrespects boundaries", .englishCurationHuskLatchedMosaicNuclei): return "Disrespects boundaries"
        case ("Emotional unavailability", .russianCurationHuskLatchedMosaicNuclei): return "Эмоциональная недоступность"
        case ("Emotional unavailability", .englishCurationHuskLatchedMosaicNuclei): return "Emotional unavailability"
        case ("Controlling behavior", .russianCurationHuskLatchedMosaicNuclei): return "Контроль"
        case ("Controlling behavior", .englishCurationHuskLatchedMosaicNuclei): return "Controlling behavior"
        case ("Addictions", .russianCurationHuskLatchedMosaicNuclei): return "Зависимости"
        case ("Addictions", .englishCurationHuskLatchedMosaicNuclei): return "Addictions"
        default: return redFlagStorageStabilityId
        }
    }
}
