import SwiftUI

struct PrismaOnboardingSharedGenderAgeOnlySurfaceView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel
    @FocusState private var prismaAgeNumericPadFieldIsFocused: Bool

    private let prismaGenderChoiceDescriptorRows: [(String, String)] = [
        ("Женский", "👩"),
        ("Мужской", "👨"),
        ("Другое", "⚪️"),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Расскажи немного о вас")
                .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .fixedSize(horizontal: false, vertical: true)
            if prismaRelationshipOnboardingFlowViewModel
                .prismaOnboardingBypassIdentityDemographicsCaptureSurfaceBecauseMergedProfileContainsMinimumFieldsFlag {
                Text("Пол и возраст берём из профиля — изменить можно в настройках.")
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Пол")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
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
                                        .font(PrismaTypography.prismaOnboardingGenderPickerEmojiDimensionalTitle1RoundedRegular)
                                    Text(prismaGenderLabel)
                                        .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(
                                    Circle()
                                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                        .overlay(
                                            Circle()
                                                .stroke(
                                                    PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(prismaIsGenderSelectedFlag ? 1.0 : 0.0),
                                                    lineWidth: 2
                                                )
                                        )
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Возраст")
                        .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    TextField("Например: 25", text: Binding(
                        get: {
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                .userAgeFreeformInputText
                        },
                        set: { prismaRelationshipOnboardingFlowViewModel.prismaApplyUserAgeFreeformInputTextMutation($0) }
                    ))
                    .focused($prismaAgeNumericPadFieldIsFocused)
                    .keyboardType(.numberPad)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.25), lineWidth: 1)
                    )
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Готово") {
                    prismaAgeNumericPadFieldIsFocused = false
                }
                .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
            }
        }
    }
}
