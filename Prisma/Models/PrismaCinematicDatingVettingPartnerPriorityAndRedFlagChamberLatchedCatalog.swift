import Foundation

struct PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic: Identifiable, Hashable, Sendable {
    let id: String
    let prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: String
}

struct PrismaCinematicDatingVettingRedFlagCurationLatchedMosaic: Identifiable, Hashable, Sendable {
    let id: String
}

enum PrismaCinematicDatingVettingPartnerPriorityAndRedFlagChamberLatchedCatalog: Sendable {
    static let prismaCinematicDatingVettingPriorityCurationLatchedChamberMosaic: [
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic
    ] = [
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Humor",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "face.smiling"
        ),
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Care & Respect",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "heart.text.square"
        ),
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Physical Attraction",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "person.crop.square"
        ),
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Financial Stability",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "banknote"
        ),
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Attentiveness",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "eye"
        ),
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Empathy",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "waveform.path.ecg"
        ),
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Shared Interests",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "figure.2.arms.open"
        ),
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Loyalty",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "lock.shield"
        ),
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Intellect",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "brain.head.profile"
        ),
        PrismaCinematicDatingVettingPartnerPriorityCurationLatchedRowMosaic(
            id: "Initiative",
            prismaCinematicDatingVettingMonochromeSFSymbolGlyphName: "arrow.up.right.circle"
        ),
    ]

    private static let prismaCinematicDatingVettingRedFlagLatchedNucleiCanonicalIdRow: [String] = [
        "Aggression",
        "Lying / Deception",
        "Ghosting",
        "Disrespects boundaries",
        "Emotional unavailability",
        "Controlling behavior",
        "Addictions",
    ]

    static let prismaCinematicDatingVettingRedFlagCurationLatchedMosaicChamberMosaic: [PrismaCinematicDatingVettingRedFlagCurationLatchedMosaic] =
        prismaCinematicDatingVettingRedFlagLatchedNucleiCanonicalIdRow.map { PrismaCinematicDatingVettingRedFlagCurationLatchedMosaic(id: $0) }
}
