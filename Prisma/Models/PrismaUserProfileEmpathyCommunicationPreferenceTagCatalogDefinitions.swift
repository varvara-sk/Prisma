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
