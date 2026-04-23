import SwiftUI

struct PrismaBasicRelationshipParametersStepView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaGenderChoiceDescriptorRows: [(String, String)] = [
        ("Женский", "👩"),
        ("Мужской", "👨"),
        ("Другое", "⚪️"),
    ]

    private let prismaDynamicsPillDescriptorRows: [(RelationshipDynamics, String)] = [
        (.equalPartnershipBalance, "Равноправие"),
        (.patriarchalStructure, "Патриархат"),
        (.attachmentDependencySelf, "Зависимость"),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Расскажи немного о вас")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                VStack(alignment: .leading, spacing: 12) {
                    Text("Пол")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary)
                    HStack(spacing: 12) {
                        ForEach(prismaGenderChoiceDescriptorRows, id: \.0) { prismaGenderRow in
                            let prismaGenderLabel = prismaGenderRow.0
                            let prismaGenderEmoji = prismaGenderRow.1
                            let prismaIsGenderSelectedFlag =
                                prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.userGender
                                == prismaGenderLabel
                            Button {
                                prismaRelationshipOnboardingFlowViewModel.prismaApplyUserGenderSelectionMutation(prismaGenderLabel)
                            } label: {
                                VStack(spacing: 8) {
                                    Text(prismaGenderEmoji)
                                        .font(.system(size: 30))
                                    Text(prismaGenderLabel)
                                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                                        .foregroundStyle(PrismaColors.textSecondary)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(
                                    Circle()
                                        .fill(PrismaColors.surface)
                                        .overlay(
                                            Circle()
                                                .stroke(
                                                    PrismaColors.primary.opacity(prismaIsGenderSelectedFlag ? 1.0 : 0.0),
                                                    lineWidth: 2
                                                )
                                        )
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Возраст")
                            .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                            .foregroundStyle(PrismaColors.textPrimary)
                        Spacer()
                        Text("\(prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.userAge)")
                            .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                            .foregroundStyle(PrismaColors.primary)
                    }
                    Slider(
                        value: Binding(
                            get: {
                                Double(
                                    prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.userAge
                                )
                            },
                            set: { prismaNewSliderDoubleValue in
                                prismaRelationshipOnboardingFlowViewModel.prismaApplyUserAgeSliderMutation(Int(prismaNewSliderDoubleValue))
                            }
                        ),
                        in: 18...99,
                        step: 1
                    )
                    .tint(PrismaColors.primary)
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("Динамика")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary)
                    HStack(spacing: 10) {
                        ForEach(prismaDynamicsPillDescriptorRows, id: \.0) { prismaDynamicsRow in
                            let prismaDynamicsCase = prismaDynamicsRow.0
                            let prismaDynamicsTitle = prismaDynamicsRow.1
                            let prismaIsDynamicsSelectedFlag =
                                prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.dynamics
                                == prismaDynamicsCase
                            Button {
                                prismaRelationshipOnboardingFlowViewModel.prismaApplyRelationshipDynamicsSelectionMutation(
                                    prismaDynamicsCase
                                )
                            } label: {
                                Text(prismaDynamicsTitle)
                                    .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                                    .foregroundStyle(PrismaColors.textPrimary)
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 10)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .fill(
                                                prismaIsDynamicsSelectedFlag
                                                    ? PrismaColors.primary.opacity(0.22)
                                                    : PrismaColors.surface
                                            )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .stroke(
                                                PrismaColors.primary.opacity(prismaIsDynamicsSelectedFlag ? 1.0 : 0.0),
                                                lineWidth: 2
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
