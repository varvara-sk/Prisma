import Foundation

struct PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot: Identifiable, Hashable, Sendable {
    let id: String
    let prismaUserFacingChipsSurfaceLabelLine: String
}

enum PrismaUserProfileEmpathyCommunicationPreferenceTagCatalogDefinitions: Sendable {
    static let prismaCatalogEmpathyRowIdentityDescriptorArray: [PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot] = [
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyMoreEmotionalSupportEmphasisNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "✨ Больше поддержки"
        ),
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyDryFactualRigorOnlyNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "🧊 Только сухие факты"
        ),
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyConcisePacingADHDConsciousNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "⏱ Пиши коротко (У меня СДВГ)"
        ),
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyHighVulnerabilityGentleToneNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "🫂 Я очень ранимый(ая)"
        ),
        PrismaUserProfileEmpathyTagRowIdentityDescriptorSnapshot(
            id: "prismaEmpathyDirectCriticalTruthSearingNucleus",
            prismaUserFacingChipsSurfaceLabelLine: "🥊 Давай жёсткую правду (Прожарка)"
        ),
    ]

    static func prismaCatalogResolveLocalizedLabelForSerializedStabilityKeyFragmentOrNil(
        _ prismaIncomingSerializedKeyProbe: String
    ) -> String? {
        prismaCatalogEmpathyRowIdentityDescriptorArray.first { $0.id == prismaIncomingSerializedKeyProbe }?
            .prismaUserFacingChipsSurfaceLabelLine
    }
}
