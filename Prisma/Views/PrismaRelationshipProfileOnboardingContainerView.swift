import SwiftUI

struct PrismaRelationshipProfileOnboardingContainerView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @Binding var prismaRelationshipOnboardingFinishedCompletionBinding: Bool
    @StateObject private var prismaRelationshipOnboardingFlowViewModel = PrismaRelationshipOnboardingFlowViewModel()

    private var prismaPrimaryOnboardingFooterCallToActionResolvedTitle: String {
        PrismaApplicationCinematicOnboardingCurationLatchedNucleiFooterCurationCasket
            .prismaCinematicLatchedNucleiPrimaryCallToActionMosaic(
                currentWizardStepIndex: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex,
                activeGlobalMode: prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot.globalMode,
                userInterfaceActiveLanguage: prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage,
                activeRelationshipOnboardingWizardTotalStepQuantity: prismaRelationshipOnboardingFlowViewModel
                    .prismaActiveRelationshipOnboardingWizardTotalStepQuantity
            )
    }

    var body: some View {
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                PrismaRelationshipOnboardingTopChromeHeaderBarView(
                    userInterfaceActiveLanguage: prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage,
                    prismaCurrentWizardStepIndex: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex,
                    prismaWizardTotalStepQuantity: prismaRelationshipOnboardingFlowViewModel.prismaActiveRelationshipOnboardingWizardTotalStepQuantity,
                    prismaBackChevronVisibilityFlag: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex > 0,
                    prismaBackChevronTapAction: {
                        prismaRelationshipOnboardingFlowViewModel.prismaHandleBackNavigationChevronTapAction()
                    },
                    prismaToolbarSkipForwardTapAction: {
                        Task {
                            let prismaSkipOutcome = await prismaRelationshipOnboardingFlowViewModel.prismaHandleToolbarSkipForwardAction()
                            if prismaSkipOutcome == .finishedPersistingProfileSnapshot {
                                prismaRelationshipOnboardingFinishedCompletionBinding = true
                            }
                        }
                    }
                )
                Group {
                    switch prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex {
                    case 0:
                        PrismaGlobalModeSelectionStepView(
                            prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                        )
                    case 1, 2, 3:
                        PrismaOnboardingDynamicWizardContentRouterView(
                            prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel,
                            prismaTargetWizardStepIndex: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex
                        )
                    default:
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .safeAreaInset(edge: .bottom, spacing: 0) {
                PrismaRelationshipOnboardingPrimaryFooterButtonStripView(
                    prismaPrimaryButtonTitle: prismaPrimaryOnboardingFooterCallToActionResolvedTitle,
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
                .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition).opacity(0.92))
            }
            if prismaRelationshipOnboardingFlowViewModel.prismaTransientRelationshipOnboardingSubmissionLoadingFlag {
                PrismaRelationshipOnboardingMinimalLoadingOverlayCurtainView()
            }
        }
        .onChange(of: prismaRelationshipOnboardingFinishedCompletionBinding) { prismaNewOnboardingCompletionFlag in
            if prismaNewOnboardingCompletionFlag {
                PrismaTactileFeedbackPulseController.prismaEmitSuccessfulCheckpointImpactPulse()
                PrismaProductUsageTelemetrySignalRecorder.prismaIncrementOrdinalTallyForTelemetrySignal(
                    .relationshipOnboardingFlowCompletedSuccessfully
                )
            }
        }
    }
}

private struct PrismaRelationshipOnboardingTopChromeHeaderBarView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    let prismaCurrentWizardStepIndex: Int
    let prismaWizardTotalStepQuantity: Int
    let prismaBackChevronVisibilityFlag: Bool
    let prismaBackChevronTapAction: () -> Void
    let prismaToolbarSkipForwardTapAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                if prismaBackChevronVisibilityFlag {
                    Button(action: prismaBackChevronTapAction) {
                        HStack(spacing: 6) {
                            Image(systemName: "chevron.left")
                                .font(PrismaTypography.prismaNavigationBarInlineBackGlyphDimensionalRoundedSemibold)
                            Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                                .relationshipOnboardingBack
                                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(
                                    userInterfaceActiveLanguage
                                )
                            )
                            .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                        }
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .frame(height: 44, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                } else {
                    Color.clear
                        .frame(width: 72, height: 44)
                }
                Spacer(minLength: 0)
                Button(action: prismaToolbarSkipForwardTapAction) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .relationshipOnboardingSkip
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(
                            userInterfaceActiveLanguage
                        )
                    )
                    .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                        .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                        .frame(height: 44)
                }
                .buttonStyle(.plain)
            }
            GeometryReader { prismaProgressGeometryProxy in
                let prismaCinematicLatchedNucleiProgressCurationFillCurationWidth = prismaProgressGeometryProxy.size.width
                    * CGFloat(prismaCurrentWizardStepIndex + 1) / CGFloat(prismaWizardTotalStepQuantity)
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(PrismaColors.prismaDashboardContextSwitcherPillMutedChromeFillNucleus().opacity(0.65))
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [
                                    PrismaColors.prismaDashboardInsightsAnxietyAreaGradientPastelLavenderTopNucleus().opacity(0.95),
                                    PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.88),
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: max(0, prismaCinematicLatchedNucleiProgressCurationFillCurationWidth))
                }
            }
            .frame(height: 3)
            .accessibilityLabel(
                PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .relationshipOnboardingProgressA11y
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage)
            )
            .accessibilityValue(
                "\(prismaCurrentWizardStepIndex + 1) "
                    + PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                    .relationshipOnboardingProgressOf
                    .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(userInterfaceActiveLanguage) + " \(prismaWizardTotalStepQuantity)"
            )
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
    }
}

private struct PrismaRelationshipOnboardingPrimaryFooterButtonStripView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaPrimaryButtonTitle: String
    let prismaPrimaryButtonEnabledFlag: Bool
    let prismaPrimaryButtonTapAction: () -> Void

    var body: some View {
        Button(action: prismaPrimaryButtonTapAction) {
            Text(prismaPrimaryButtonTitle)
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    Capsule(style: .continuous)
                        .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
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
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition

    var body: some View {
        ZStack {
            Color.black.opacity(0.35)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(.circular)
                .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                .scaleEffect(1.1)
        }
        .transition(.opacity)
        .allowsHitTesting(true)
    }
}
