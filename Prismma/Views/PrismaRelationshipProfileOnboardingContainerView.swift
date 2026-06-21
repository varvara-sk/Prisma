import SwiftUI

struct PrismaRelationshipProfileOnboardingContainerView: View {
    @Binding var prismaRelationshipOnboardingFinishedCompletionBinding: Bool
    @StateObject private var prismaRelationshipOnboardingFlowViewModel = PrismaRelationshipOnboardingFlowViewModel()

    var body: some View {
        ZStack {
            PrismaColors.background
                .ignoresSafeArea()
            VStack(spacing: 0) {
                PrismaRelationshipOnboardingTopChromeHeaderBarView(
                    prismaCurrentWizardStepIndex: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex,
                    prismaWizardTotalStepQuantity: PrismaRelationshipOnboardingFlowViewModel.prismaRelationshipOnboardingWizardTotalStepQuantity,
                    prismaBackChevronVisibilityFlag: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex > 0,
                    prismaBackChevronTapAction: {
                        prismaRelationshipOnboardingFlowViewModel.prismaHandleBackNavigationChevronTapAction()
                    }
                )
                Group {
                    switch prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex {
                    case 0:
                        PrismaGlobalModeSelectionStepView(
                            prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                        )
                    case 1:
                        PrismaBasicRelationshipParametersStepView(
                            prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                        )
                    case 2:
                        PrismaLivingAndObligationsStepView(
                            prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                        )
                    case 3:
                        PrismaPartnerReactionPatternsStepView(
                            prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                        )
                    default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .safeAreaInset(edge: .bottom, spacing: 0) {
                PrismaRelationshipOnboardingPrimaryFooterButtonStripView(
                    prismaPrimaryButtonTitle: prismaRelationshipOnboardingFlowViewModel.prismaPrimaryFooterAdvancementCallToActionTitle,
                    prismaPrimaryButtonEnabledFlag: prismaRelationshipOnboardingFlowViewModel.prismaEvaluateCurrentRelationshipOnboardingStepAllowsForwardProgression,
                    prismaPrimaryButtonTapAction: {
                        Task {
                            let prismaFooterMutationOutcome = await prismaRelationshipOnboardingFlowViewModel.prismaHandlePrimaryFooterAdvancementTapAction()
                            if prismaFooterMutationOutcome == .finishedPersistingProfileSnapshot {
                                prismaRelationshipOnboardingFinishedCompletionBinding = true
                            }
                        }
                    }
                )
                .background(PrismaColors.background.opacity(0.92))
            }
            if prismaRelationshipOnboardingFlowViewModel.prismaTransientRelationshipOnboardingSubmissionLoadingFlag {
                PrismaRelationshipOnboardingMinimalLoadingOverlayCurtainView()
            }
        }
    }
}

private struct PrismaRelationshipOnboardingTopChromeHeaderBarView: View {
    let prismaCurrentWizardStepIndex: Int
    let prismaWizardTotalStepQuantity: Int
    let prismaBackChevronVisibilityFlag: Bool
    let prismaBackChevronTapAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                if prismaBackChevronVisibilityFlag {
                    Button(action: prismaBackChevronTapAction) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundStyle(PrismaColors.textPrimary)
                            .frame(width: 44, height: 44, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                } else {
                    Color.clear
                        .frame(width: 44, height: 44)
                }
                Spacer(minLength: 0)
            }
            GeometryReader { prismaProgressGeometryProxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(PrismaColors.surface)
                    Capsule()
                        .fill(PrismaColors.primary)
                        .frame(
                            width: prismaProgressGeometryProxy.size.width * CGFloat(prismaCurrentWizardStepIndex + 1)
                                / CGFloat(prismaWizardTotalStepQuantity)
                        )
                }
            }
            .frame(height: 4)
            .accessibilityLabel("Прогресс")
            .accessibilityValue("\(prismaCurrentWizardStepIndex + 1) из \(prismaWizardTotalStepQuantity)")
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
    }
}

private struct PrismaRelationshipOnboardingPrimaryFooterButtonStripView: View {
    let prismaPrimaryButtonTitle: String
    let prismaPrimaryButtonEnabledFlag: Bool
    let prismaPrimaryButtonTapAction: () -> Void

    var body: some View {
        Button(action: prismaPrimaryButtonTapAction) {
            Text(prismaPrimaryButtonTitle)
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textPrimary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PrismaColors.primary)
                )
                .opacity(prismaPrimaryButtonEnabledFlag ? 1.0 : 0.4)
        }
        .buttonStyle(.plain)
        .disabled(!prismaPrimaryButtonEnabledFlag)
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
    }
}

private struct PrismaRelationshipOnboardingMinimalLoadingOverlayCurtainView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.35)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(.circular)
                .tint(PrismaColors.primary)
                .scaleEffect(1.1)
        }
        .transition(.opacity)
        .allowsHitTesting(true)
    }
}
