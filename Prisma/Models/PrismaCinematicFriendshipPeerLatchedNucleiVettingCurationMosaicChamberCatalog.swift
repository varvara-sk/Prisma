import Foundation

struct PrismaCinematicFriendshipPeerLatchedNucleiSocialRoleCurationMosaic: Identifiable, Hashable, Sendable {
    let id: String
    let prismaCinematicFriendshipPeerLatchedNucleiMonochromeSFSymbolGlyphName: String
}

struct PrismaCinematicFriendshipPeerLatchedNucleiCommunicationFrictionCurationMosaic: Identifiable, Hashable, Sendable {
    let id: String
}

enum PrismaCinematicFriendshipPeerLatchedNucleiVettingCurationMosaicChamberCatalog: Sendable {
    static let prismaCinematicFriendshipPeerLatchedNucleiPeerSocialRoleCurationMosaic: [
        PrismaCinematicFriendshipPeerLatchedNucleiSocialRoleCurationMosaic
    ] = [
        PrismaCinematicFriendshipPeerLatchedNucleiSocialRoleCurationMosaic(
            id: "Colleague",
            prismaCinematicFriendshipPeerLatchedNucleiMonochromeSFSymbolGlyphName: "person.2"
        ),
        PrismaCinematicFriendshipPeerLatchedNucleiSocialRoleCurationMosaic(
            id: "Boss / Manager",
            prismaCinematicFriendshipPeerLatchedNucleiMonochromeSFSymbolGlyphName: "person.badge.shield"
        ),
        PrismaCinematicFriendshipPeerLatchedNucleiSocialRoleCurationMosaic(
            id: "Friend",
            prismaCinematicFriendshipPeerLatchedNucleiMonochromeSFSymbolGlyphName: "face.smiling"
        ),
        PrismaCinematicFriendshipPeerLatchedNucleiSocialRoleCurationMosaic(
            id: "Relative",
            prismaCinematicFriendshipPeerLatchedNucleiMonochromeSFSymbolGlyphName: "figure.2"
        ),
        PrismaCinematicFriendshipPeerLatchedNucleiSocialRoleCurationMosaic(
            id: "Acquaintance",
            prismaCinematicFriendshipPeerLatchedNucleiMonochromeSFSymbolGlyphName: "person"
        ),
    ]

    private static let prismaCinematicLatchedNucleiCanonicalFriendshipFrictionIdRow: [String] = [
        "Constant interruptions",
        "Passive aggression",
        "Disrespects boundaries",
        "Devalues my opinion",
        "Only talks about themselves",
        "Gossips / toxic",
        "Unreliable / flaky",
    ]

    static let prismaCinematicFriendshipPeerLatchedNucleiCommunicationFrictionCurationMosaicChamberMosaic: [
        PrismaCinematicFriendshipPeerLatchedNucleiCommunicationFrictionCurationMosaic
    ] = prismaCinematicLatchedNucleiCanonicalFriendshipFrictionIdRow.map {
        PrismaCinematicFriendshipPeerLatchedNucleiCommunicationFrictionCurationMosaic(id: $0)
    }

    private static let prismaCinematicLatchedNucleiLegacyBilingualFrictionDescriptorToCanonicalIdMap: [String: String] = [
        "Constant interruptions (Постоянно перебивает)": "Constant interruptions",
        "Passive aggression (Пассивная агрессия)": "Passive aggression",
        "Disrespects boundaries (Нарушает личные границы)": "Disrespects boundaries",
        "Devalues my opinion (Обесценивает мнение)": "Devalues my opinion",
        "Only talks about themselves (Говорит только о себе)": "Only talks about themselves",
        "Gossips / Toxic (Сплетни / Токсичность)": "Gossips / toxic",
        "Gossips / toxic (Сплетни / Токсичность)": "Gossips / toxic",
        "Unreliable / Flaky (Ненадежность)": "Unreliable / flaky",
    ]

    static func prismaCinematicLatchedNucleiNormalizedFrictionDescriptorTagCurationRow(_ row: [String]) -> [String] {
        row.map { tag in
            prismaCinematicLatchedNucleiLegacyBilingualFrictionDescriptorToCanonicalIdMap[tag] ?? tag
        }
    }
}
