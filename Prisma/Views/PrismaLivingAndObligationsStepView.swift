import SwiftUI

struct PrismaLivingAndObligationsStepView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaDurationPillDescriptorRows: [(RelationshipDuration, String)] = [
        (.underSixMonthsHorizon, "< 6 мес"),
        (.oneThroughThreeYearsHorizon, "1–3 года"),
        (.beyondThreeYearsHorizon, "3+ года"),
    ]

    private let prismaLivingPillDescriptorRows: [(LivingStatus, String)] = [
        (.sharedHouseholdTogether, "Вместе"),
        (.separateHouseholdsNearby, "Раздельно"),
        (.longDistanceRhythm, "На расстоянии"),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Быт и обязательства")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                VStack(alignment: .leading, spacing: 12) {
                    Text("Срок")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary)
                    HStack(spacing: 10) {
                        ForEach(prismaDurationPillDescriptorRows, id: \.0) { prismaDurationRow in
                            let prismaDurationCase = prismaDurationRow.0
                            let prismaDurationTitle = prismaDurationRow.1
                            let prismaIsDurationSelectedFlag =
                                prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.duration
                                == prismaDurationCase
                            Button {
                                prismaRelationshipOnboardingFlowViewModel.prismaApplyRelationshipDurationSelectionMutation(
                                    prismaDurationCase
                                )
                            } label: {
                                Text(prismaDurationTitle)
                                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                                    .foregroundStyle(PrismaColors.textPrimary)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .fill(
                                                prismaIsDurationSelectedFlag
                                                    ? PrismaColors.primary.opacity(0.22)
                                                    : PrismaColors.surface
                                            )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .stroke(
                                                PrismaColors.primary.opacity(prismaIsDurationSelectedFlag ? 1.0 : 0.0),
                                                lineWidth: 2
                                            )
                                    )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("Быт")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary)
                    HStack(spacing: 10) {
                        ForEach(prismaLivingPillDescriptorRows, id: \.0) { prismaLivingRow in
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
                    Text("Обязательства")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary)
                    Toggle(isOn: Binding(
                        get: {
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.hasObligations
                        },
                        set: { prismaIncomingToggleValue in
                            prismaRelationshipOnboardingFlowViewModel.prismaApplySharedObligationsToggleMutation(
                                prismaIncomingToggleValue
                            )
                        }
                    )) {
                        Text("У нас есть общие дети, ипотека или бизнес")
                            .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                            .foregroundStyle(PrismaColors.textPrimary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .tint(PrismaColors.primary)
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(PrismaColors.surface)
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }
}
