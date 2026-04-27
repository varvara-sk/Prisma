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
                if prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex > 0 {
                    PrismaRelationshipOnboardingTopChromeHeaderBarView(
                        userInterfaceActiveLanguage: prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage,
                        prismaCurrentWizardStepIndex: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex,
                        prismaWizardTotalStepQuantity: prismaRelationshipOnboardingFlowViewModel.prismaActiveRelationshipOnboardingWizardTotalStepQuantity,
                        prismaBackChevronVisibilityFlag: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex > prismaRelationshipOnboardingFlowViewModel.prismaEarliestReachableRelationshipOnboardingWizardStepIndex,
                        prismaSkipForwardVisibilityFlag: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex > PrismaRelationshipOnboardingFlowViewModel.prismaRelationshipOnboardingPreludeStepQuantity,
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
                }
                Group {
                    switch prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex {
                    case 0:
                        PrismaRelationshipOnboardingLaunchLoadingOrbitsView(
                            prismaLaunchLoadingCompletionAction: {
                                prismaRelationshipOnboardingFlowViewModel.prismaAdvancePastLaunchLoadingSurface()
                            }
                        )
                    case 1:
                        PrismaRelationshipOnboardingRegistrationIdentityStepView(
                            prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                        )
                    case 2:
                        PrismaRelationshipOnboardingWelcomeCopyStepView()
                    case 3:
                        PrismaGlobalModeSelectionStepView(
                            prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel
                        )
                    default:
                        PrismaOnboardingDynamicWizardContentRouterView(
                            prismaRelationshipOnboardingFlowViewModel: prismaRelationshipOnboardingFlowViewModel,
                            prismaTargetWizardStepIndex: prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex
                        )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .safeAreaInset(edge: .bottom, spacing: 0) {
                if prismaRelationshipOnboardingFlowViewModel.prismaCurrentRelationshipOnboardingWizardStepIndex > 0 {
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
                }
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
    let prismaSkipForwardVisibilityFlag: Bool
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
                if prismaSkipForwardVisibilityFlag {
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
                } else {
                    Color.clear
                        .frame(width: 72, height: 44)
                }
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
        .padding(.top, 12)
        .padding(.bottom, 24)
    }
}

private struct PrismaRelationshipOnboardingPrimaryFooterButtonStripView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaPrimaryButtonTitle: String
    let prismaPrimaryButtonEnabledFlag: Bool
    let prismaPrimaryButtonTapAction: () -> Void

    var body: some View {
        VStack(spacing: 0) {
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
                    .opacity(prismaPrimaryButtonEnabledFlag ? 1.0 : 0.5)
            }
            .buttonStyle(.plain)
            .disabled(!prismaPrimaryButtonEnabledFlag)
            .padding(.horizontal, 20)
            .padding(.top, 16)
            .padding(.bottom, 12)
        }
        .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition).opacity(0.96))
        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: -6)
    }
}

private struct PrismaRelationshipOnboardingLaunchLoadingOrbitsView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @State private var prismaOuterOrbitRotationDegrees: Double = 0
    @State private var prismaInnerOrbitRotationDegrees: Double = 0
    let prismaLaunchLoadingCompletionAction: () -> Void

    var body: some View {
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
            ZStack {
                PrismaRelationshipOnboardingOrbitingDotRingView(
                    prismaRingRadius: 58,
                    prismaDotSize: 10,
                    prismaDotOpacity: 0.95
                )
                .rotationEffect(.degrees(prismaOuterOrbitRotationDegrees))
                PrismaRelationshipOnboardingOrbitingDotRingView(
                    prismaRingRadius: 36,
                    prismaDotSize: 7,
                    prismaDotOpacity: 0.72
                )
                .rotationEffect(.degrees(prismaInnerOrbitRotationDegrees))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .task {
            withAnimation(.linear(duration: 2.4).repeatForever(autoreverses: false)) {
                prismaOuterOrbitRotationDegrees = 360
            }
            withAnimation(.linear(duration: 1.8).repeatForever(autoreverses: false)) {
                prismaInnerOrbitRotationDegrees = -360
            }
            try? await Task.sleep(nanoseconds: 1_250_000_000)
            prismaLaunchLoadingCompletionAction()
        }
    }
}

private struct PrismaRelationshipOnboardingOrbitingDotRingView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaRingRadius: CGFloat
    let prismaDotSize: CGFloat
    let prismaDotOpacity: Double

    var body: some View {
        ZStack {
            ForEach(0..<6, id: \.self) { prismaDotIndex in
                Circle()
                    .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(prismaDotOpacity))
                    .frame(width: prismaDotSize, height: prismaDotSize)
                    .shadow(color: PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.72), radius: 10)
                    .offset(y: -prismaRingRadius)
                    .rotationEffect(.degrees(Double(prismaDotIndex) * 60))
            }
        }
    }
}

private struct PrismaRelationshipOnboardingRegistrationIdentityStepView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel
    @State private var prismaTermsDocumentSheetPresentedFlag = false
    @State private var prismaPrivacyDocumentSheetPresentedFlag = false

    private let prismaRegistrationGenderChoiceDescriptorRows: [(String, String)] = [
        ("Женский", "person.fill"),
        ("Мужской", "person.fill"),
        ("Другое", "person.fill"),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 22) {
                Text("Давайте познакомимся")
                    .font(PrismaTypography.prismaOnboardingLargeTitleRoundedBold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .fixedSize(horizontal: false, vertical: true)
                Text("Сохраним базовые данные, чтобы Prisma обращалась к вам корректно и не задавала лишних вопросов позже.")
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
                VStack(spacing: 12) {
                    PrismaRelationshipOnboardingRegistrationFieldView(
                        prismaTitle: "Имя",
                        prismaPlaceholder: "Как к вам обращаться",
                        prismaText: Binding(
                            get: {
                                prismaRelationshipOnboardingFlowViewModel
                                    .prismaMutableUserRelationshipProfileSnapshot
                                    .prismaPreferredCallsignForUserInterfaceDisplay
                            },
                            set: {
                                prismaRelationshipOnboardingFlowViewModel
                                    .prismaApplyPreferredCallsignForRegistrationMutation($0)
                            }
                        )
                    )
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Пол")
                            .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        HStack(spacing: 10) {
                            ForEach(prismaRegistrationGenderChoiceDescriptorRows, id: \.0) { row in
                                let prismaGenderLabel = row.0
                                let prismaGenderSymbolName = row.1
                                let prismaGenderSelected = prismaRelationshipOnboardingFlowViewModel
                                    .prismaMutableUserRelationshipProfileSnapshot
                                    .userGender == prismaGenderLabel
                                Button {
                                    prismaRelationshipOnboardingFlowViewModel
                                        .prismaApplyUserGenderSelectionMutation(prismaGenderLabel)
                                } label: {
                                    VStack(spacing: 6) {
                                        Image(systemName: prismaGenderSymbolName)
                                            .font(.system(size: 22, weight: .medium, design: .default))
                                            .symbolRenderingMode(.monochrome)
                                        Text(prismaGenderLabel)
                                            .font(.system(size: 12, weight: .medium, design: .default))
                                    }
                                    .foregroundStyle(
                                        prismaGenderSelected
                                            ? PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition)
                                            : PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition)
                                    )
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .fill(PrismaColors.prismaOnboardingSelectableSurfaceFillNucleus(
                                                prismaRuntimeActiveAppThemeComposition,
                                                selected: prismaGenderSelected
                                            ))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .stroke(
                                                PrismaColors.prismaOnboardingSelectableStrokeNucleus(
                                                    prismaRuntimeActiveAppThemeComposition,
                                                    selected: prismaGenderSelected
                                                ),
                                                lineWidth: prismaGenderSelected ? 2 : 1
                                            )
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    PrismaRelationshipOnboardingRegistrationFieldView(
                        prismaTitle: "Возраст",
                        prismaPlaceholder: "Например: 25",
                        prismaKeyboardType: .numberPad,
                        prismaText: Binding(
                            get: {
                                prismaRelationshipOnboardingFlowViewModel
                                    .prismaMutableUserRelationshipProfileSnapshot
                                    .userAgeFreeformInputText
                            },
                            set: {
                                prismaRelationshipOnboardingFlowViewModel
                                    .prismaApplyUserAgeFreeformInputTextMutation($0)
                            }
                        )
                    )
                    PrismaRelationshipOnboardingRegistrationFieldView(
                        prismaTitle: "Почта",
                        prismaPlaceholder: "name@example.com",
                        prismaKeyboardType: .emailAddress,
                        prismaText: $prismaRelationshipOnboardingFlowViewModel.prismaRegistrationEmailFreeformInputText
                    )
                    PrismaRelationshipOnboardingRegistrationSecureFieldView(
                        prismaTitle: "Пароль",
                        prismaPlaceholder: "Минимум 6 символов",
                        prismaText: $prismaRelationshipOnboardingFlowViewModel.prismaRegistrationPasswordFreeformInputText
                    )
                    HStack(alignment: .top, spacing: 12) {
                        Button {
                            prismaRelationshipOnboardingFlowViewModel
                                .prismaApplyLegalTermsPrivacyConsentAcceptedMutation(
                                    !prismaRelationshipOnboardingFlowViewModel.prismaLegalTermsPrivacyConsentAcceptedFlag
                                )
                        } label: {
                            Image(
                                systemName: prismaRelationshipOnboardingFlowViewModel.prismaLegalTermsPrivacyConsentAcceptedFlag
                                    ? "checkmark.square.fill"
                                    : "square"
                            )
                            .font(.title3)
                            .foregroundStyle(
                                prismaRelationshipOnboardingFlowViewModel.prismaLegalTermsPrivacyConsentAcceptedFlag
                                    ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition)
                                    : PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition)
                            )
                        }
                        .buttonStyle(.plain)
                        .frame(width: 44, height: 44, alignment: .top)
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Я согласна с")
                                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            VStack(alignment: .leading, spacing: 2) {
                                Button {
                                    prismaTermsDocumentSheetPresentedFlag = true
                                } label: {
                                    Text("Условиями использования")
                                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular.weight(.semibold))
                                        .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                        .padding(.vertical, 6)
                                }
                                .buttonStyle(.plain)
                                Text("и")
                                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                Button {
                                    prismaPrivacyDocumentSheetPresentedFlag = true
                                } label: {
                                    Text("Политикой конфиденциальности")
                                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular.weight(.semibold))
                                        .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                        .padding(.vertical, 6)
                                }
                                .buttonStyle(.plain)
                            }
                            .fixedSize(horizontal: false, vertical: true)
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.18), lineWidth: 1)
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 120)
        }
        .sheet(isPresented: $prismaTermsDocumentSheetPresentedFlag) {
            PrismaRelationshipOnboardingLegalDocumentView(
                prismaTitle: "Условия использования",
                prismaBodyText: "Это временный текст условий использования Prisma. Здесь будет описано, как работает приложение, какие данные пользователь вводит добровольно, какие ограничения есть у ИИ-разбора и почему Prisma не заменяет профессиональную помощь."
            )
        }
        .sheet(isPresented: $prismaPrivacyDocumentSheetPresentedFlag) {
            PrismaRelationshipOnboardingLegalDocumentView(
                prismaTitle: "Политика конфиденциальности",
                prismaBodyText: "Это временный текст политики конфиденциальности Prisma. Здесь будет описано, какие данные остаются на устройстве, какие данные могут отправляться в ИИ-сервис для генерации ответов и как пользователь может управлять локальной историей."
            )
        }
    }
}

private struct PrismaRelationshipOnboardingLegalDocumentView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaTitle: String
    let prismaBodyText: String

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                Text(prismaBodyText)
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .lineSpacing(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .padding(.bottom, 32)
            }
            .background(PrismaColors.background(prismaRuntimeActiveAppThemeComposition))
            .navigationTitle(prismaTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .frame(width: 44, height: 44)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

private struct PrismaRelationshipOnboardingRegistrationFieldView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaTitle: String
    let prismaPlaceholder: String
    var prismaKeyboardType: UIKeyboardType = .default
    @Binding var prismaText: String
    @FocusState private var prismaRegistrationFieldFocusedFlag: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(prismaTitle)
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
            TextField(prismaPlaceholder, text: $prismaText)
                .keyboardType(prismaKeyboardType)
                .textInputAutocapitalization(prismaKeyboardType == .emailAddress ? .never : .sentences)
                .autocorrectionDisabled(prismaKeyboardType == .emailAddress)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .focused($prismaRegistrationFieldFocusedFlag)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(
                            prismaRegistrationFieldFocusedFlag
                                ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition)
                                : Color.gray.opacity(0.3),
                            lineWidth: prismaRegistrationFieldFocusedFlag ? 2 : 1
                        )
                )
        }
    }
}

private struct PrismaRelationshipOnboardingRegistrationSecureFieldView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaTitle: String
    let prismaPlaceholder: String
    @Binding var prismaText: String
    @FocusState private var prismaRegistrationSecureFieldFocusedFlag: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(prismaTitle)
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
            SecureField(prismaPlaceholder, text: $prismaText)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .focused($prismaRegistrationSecureFieldFocusedFlag)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(
                            prismaRegistrationSecureFieldFocusedFlag
                                ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition)
                                : Color.gray.opacity(0.3),
                            lineWidth: prismaRegistrationSecureFieldFocusedFlag ? 2 : 1
                        )
                )
        }
    }
}

private struct PrismaRelationshipOnboardingWelcomeCopyStepView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @State private var prismaWelcomeContentVisibleFlag = false

    var body: some View {
        VStack(spacing: 28) {
            Spacer(minLength: 80)
            VStack(spacing: 18) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.30),
                                    PrismaColors.prismaDashboardInsightsAnxietyAreaGradientPastelLavenderTopNucleus().opacity(0.22),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 110, height: 110)
                        .shadow(color: PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.35), radius: 24, x: 0, y: 14)
                    Image(systemName: "sparkles")
                        .font(.system(size: 46, weight: .bold, design: .rounded))
                        .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                }
                Text("Привет")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                Text("Prisma помогает спокойно разобрать отношения, заметить повторяющиеся паттерны и выбрать следующий шаг без лишнего шума.")
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, 30)
            .opacity(prismaWelcomeContentVisibleFlag ? 1 : 0)
            .offset(y: prismaWelcomeContentVisibleFlag ? 0 : 26)
            .animation(.easeOut(duration: 0.62), value: prismaWelcomeContentVisibleFlag)
            Spacer(minLength: 80)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            prismaWelcomeContentVisibleFlag = true
        }
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
