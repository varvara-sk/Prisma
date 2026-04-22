import SwiftUI

struct PrismaCommittedRelationshipOnboardingBranchStepTwoView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel
    @FocusState private var prismaAgeNumericPadFieldIsFocused: Bool

    private let prismaGenderLabeledCurationNucleiRow: [(String, String)] = [
        ("Женский", "person.fill"),
        ("Мужской", "person.fill"),
        ("Другое", "person.fill"),
    ]

    private let prismaDynamicsCurationLatchedChamberedCardNucleiRow: [(PrismaOnboardingDynamicsPresetSelection, String, String)] = [
        (.equalPartnershipBalance, "Partnership (Equality)", "equal.circle"),
        (.patriarchalStructureAxis, "Traditional (One leads)", "arrow.left.arrow.right"),
        (.relationalAmbiguityUnclearDynamicsNucleus, "It's complicated / Unclear", "questionmark.circle"),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Relationship dynamics")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                Text("Global profile data (Age, Gender) is automatically applied to this session.")
                    .font(.system(size: 13, weight: .regular, design: .default))
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(3)
                if prismaRelationshipOnboardingFlowViewModel
                    .prismaOnboardingBypassIdentityDemographicsCaptureSurfaceBecauseMergedProfileContainsMinimumFieldsFlag
                {
                    Text("Age and gender are taken from your profile. You can change them in Settings.")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                        .multilineTextAlignment(.leading)
                } else {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Age & Gender (profile)")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        HStack(spacing: 10) {
                            ForEach(prismaGenderLabeledCurationNucleiRow, id: \.0) { row in
                                let prismaCinematicLatchedNucleiLabelChamber = row.0
                                let prismaCinematicLatchedNucleiSymbolChamber = row.1
                                let prismaCinematicLatchedNucleiSelectedChamber = prismaRelationshipOnboardingFlowViewModel
                                    .prismaMutableUserRelationshipProfileSnapshot.userGender == prismaCinematicLatchedNucleiLabelChamber
                                Button {
                                    prismaRelationshipOnboardingFlowViewModel
                                        .prismaApplyUserGenderSelectionMutation(prismaCinematicLatchedNucleiLabelChamber)
                                } label: {
                                    VStack(spacing: 6) {
                                        Image(systemName: prismaCinematicLatchedNucleiSymbolChamber)
                                            .font(.system(size: 22, weight: .medium, design: .default))
                                            .symbolRenderingMode(.monochrome)
                                        Text(prismaCinematicLatchedNucleiLabelChamber)
                                            .font(.system(size: 12, weight: .medium, design: .default))
                                    }
                                    .foregroundStyle(
                                        prismaCinematicLatchedNucleiSelectedChamber
                                            ? PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition)
                                            : PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition)
                                    )
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .stroke(
                                                PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                                    prismaCinematicLatchedNucleiSelectedChamber ? 0.9 : 0.12
                                                ),
                                                lineWidth: prismaCinematicLatchedNucleiSelectedChamber ? 2 : 1
                                            )
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Age")
                                .font(.system(size: 14, weight: .semibold, design: .default))
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            TextField("25", text: Binding(
                                get: {
                                    prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                                        .userAgeFreeformInputText
                                },
                                set: { prismaRelationshipOnboardingFlowViewModel.prismaApplyUserAgeFreeformInputTextMutation($0) }
                            ))
                            .focused($prismaAgeNumericPadFieldIsFocused)
                            .keyboardType(.numberPad)
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .padding(14)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition).opacity(0.2), lineWidth: 1)
                            )
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("How do you experience this relationship?")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(prismaDynamicsCurationLatchedChamberedCardNucleiRow, id: \.0) { row in
                            let prismaCinematicLatchedNucleiPresetChamber = row.0
                            let prismaCinematicLatchedNucleiTitleChamber = row.1
                            let prismaCinematicLatchedNucleiIconChamber = row.2
                            let prismaCinematicLatchedNucleiSelectedChamber = prismaRelationshipOnboardingFlowViewModel
                                .prismaMutableUserRelationshipProfileSnapshot.dynamicsPresetSelection
                                == prismaCinematicLatchedNucleiPresetChamber
                            Button {
                                prismaRelationshipOnboardingFlowViewModel
                                    .prismaApplyDynamicsPresetSelectionMutation(prismaCinematicLatchedNucleiPresetChamber)
                            } label: {
                                HStack(alignment: .center, spacing: 12) {
                                    Image(systemName: prismaCinematicLatchedNucleiIconChamber)
                                        .font(.system(size: 20, weight: .semibold, design: .default))
                                        .symbolRenderingMode(.monochrome)
                                        .frame(width: 32, height: 32, alignment: .center)
                                    Text(prismaCinematicLatchedNucleiTitleChamber)
                                        .font(.system(size: 15, weight: .medium, design: .default))
                                        .multilineTextAlignment(.leading)
                                    Spacer(minLength: 0)
                                    if prismaCinematicLatchedNucleiSelectedChamber {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.system(size: 20, weight: .semibold, design: .default))
                                            .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                    }
                                }
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .padding(16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .stroke(
                                            PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(
                                                prismaCinematicLatchedNucleiSelectedChamber ? 0.75 : 0.14
                                            ),
                                            lineWidth: prismaCinematicLatchedNucleiSelectedChamber ? 2 : 1
                                        )
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(24)
            .padding(.bottom, 8)
        }
        .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    prismaAgeNumericPadFieldIsFocused = false
                }
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
            }
        }
    }
}
