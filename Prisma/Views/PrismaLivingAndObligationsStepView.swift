import SwiftUI

struct PrismaLivingAndObligationsStepView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaLivingFormatPillDescriptorRows: [(LivingStatus, String)] = [
        (.sharedHouseholdTogether, "Живем вместе"),
        (.separateHouseholdsNearby, "Живем раздельно"),
        (.longDistanceRhythm, "На расстоянии"),
    ]

    private let prismaMutualBondingDescriptorTagCatalog: [String] = [
        "👶 Общие дети",
        "💳 Ипотека / Финансы",
        "💼 Общий бизнес",
        "🐕 Общие питомцы",
    ]

    private let prismaBondingTagGridColumnLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Срок, проживание и связи")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Срок отношений")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary)
                    TextField(
                        "Например: 8 месяцев или 2 года",
                        text: Binding(
                            get: {
                                prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                    .relationshipDurationFreeformNarrativeText
                            },
                            set: {
                                prismaRelationshipOnboardingFlowViewModel.prismaApplyRelationshipDurationFreeformNarrativeTextMutation(
                                    $0
                                )
                            }
                        ),
                        axis: .vertical
                    )
                    .lineLimit(2...5)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(PrismaColors.surface)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(PrismaColors.primary.opacity(0.25), lineWidth: 1)
                    )
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("Формат проживания")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary)
                    HStack(spacing: 10) {
                        ForEach(prismaLivingFormatPillDescriptorRows, id: \.0) { prismaLivingRow in
                            let prismaLivingCase = prismaLivingRow.0
                            let prismaLivingTitle = prismaLivingRow.1
                            let prismaIsLivingSelectedFlag =
                                prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.livingStatus
                                == prismaLivingCase
                            Button {
                                prismaRelationshipOnboardingFlowViewModel.prismaApplyLivingStatusSelectionMutation(prismaLivingCase)
                            } label: {
                                Text(prismaLivingTitle)
                                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                                    .foregroundStyle(PrismaColors.textPrimary)
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .fill(
                                                prismaIsLivingSelectedFlag
                                                    ? PrismaColors.primary.opacity(0.22)
                                                    : PrismaColors.surface
                                            )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .stroke(
                                                PrismaColors.primary.opacity(prismaIsLivingSelectedFlag ? 1.0 : 0.0),
                                                lineWidth: 2
                                            )
                                    )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("Что вас связывает? (можно выбрать несколько)")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary)
                        .fixedSize(horizontal: false, vertical: true)
                    LazyVGrid(columns: prismaBondingTagGridColumnLayout, alignment: .leading, spacing: 10) {
                        ForEach(prismaMutualBondingDescriptorTagCatalog, id: \.self) { prismaBondingTagLabel in
                            let prismaBondingTagSelectedFlag =
                                prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                .mutualBondingConnectionDescriptorTags.contains(prismaBondingTagLabel)
                            Button {
                                prismaRelationshipOnboardingFlowViewModel.prismaToggleMutualBondingConnectionDescriptorTagMutation(
                                    prismaBondingTagLabel
                                )
                            } label: {
                                Text(prismaBondingTagLabel)
                                    .font(PrismaTypography.prismaOnboardingFootnoteRoundedSecondary)
                                    .foregroundStyle(PrismaColors.textPrimary)
                                    .multilineTextAlignment(.leading)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 12)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .fill(
                                                prismaBondingTagSelectedFlag
                                                    ? PrismaColors.primary.opacity(0.2)
                                                    : PrismaColors.surface
                                            )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .stroke(
                                                PrismaColors.primary.opacity(prismaBondingTagSelectedFlag ? 1.0 : 0.35),
                                                lineWidth: prismaBondingTagSelectedFlag ? 2 : 1
                                            )
                                    )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }
}
