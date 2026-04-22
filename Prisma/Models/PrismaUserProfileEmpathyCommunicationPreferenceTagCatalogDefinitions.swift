import Foundation

struct PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot: Identifiable, Hashable, Sendable {
    let id: String
    let prismaUserFacingChipsSurfaceLabelLine: String
    let prismaMonochromeVectorNucleiSystemFramedGlyphIconName: String
}

enum PrismaUserProfileEmpathyCommunicationPreferenceTagCatalogDefinitions: Sendable {
    static let prismaCatalogEmpathyRowIdentityDescriptorArray: [PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot] = [
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyMoreEmotionalSupportEmphasisNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "Supportive",
            prismaMonochromeVectorNucleiSystemFramedGlyphIconName: "heart.fill"
        ),
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyDryFactualRigorOnlyNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "Objective facts",
            prismaMonochromeVectorNucleiSystemFramedGlyphIconName: "list.bullet"
        ),
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyConcisePacingADHDConsciousNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "Concise",
            prismaMonochromeVectorNucleiSystemFramedGlyphIconName: "timer"
        ),
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyHighVulnerabilityGentleToneNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "Gentle",
            prismaMonochromeVectorNucleiSystemFramedGlyphIconName: "leaf.fill"
        ),
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyDirectCriticalTruthSearingNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "Direct",
            prismaMonochromeVectorNucleiSystemFramedGlyphIconName: "flame"
        ),
    ]

    static func prismaCatalogResolveLocalizedLabelForSerializedStabilityKeyFragmentOrNil(
        _ prismaIncomingSerializedKeyProbe: String
    ) -> String? {
        prismaCatalogEmpathyRowIdentityDescriptorArray.first { $0.id == prismaIncomingSerializedKeyProbe }?
            .prismaUserFacingChipsSurfaceLabelLine
    }
}

extension PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot {
    func prismaCinematicLatchedNucleiUserFacingChipsSurfaceLineForApplicationInterfaceLanguage(
        _ userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch (id, userInterfaceActiveLanguage) {
        case ("prismaEmpathyMoreEmotionalSupportEmphasisNucleus", .russianCurationHuskLatchedMosaicNuclei):
            return "Поддержка"
        case ("prismaEmpathyDryFactualRigorOnlyNucleus", .russianCurationHuskLatchedMosaicNuclei):
            return "Факты и логика"
        case ("prismaEmpathyConcisePacingADHDConsciousNucleus", .russianCurationHuskLatchedMosaicNuclei):
            return "Кратко"
        case ("prismaEmpathyHighVulnerabilityGentleToneNucleus", .russianCurationHuskLatchedMosaicNuclei):
            return "Мягко"
        case ("prismaEmpathyDirectCriticalTruthSearingNucleus", .russianCurationHuskLatchedMosaicNuclei):
            return "Прямо"
        default:
            return prismaUserFacingChipsSurfaceLabelLine
        }
    }
}
