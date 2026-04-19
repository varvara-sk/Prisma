import SwiftUI

struct ProfileView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @AppStorage("appTheme") private var prismaApplicationThemePreferenceStorageRawValue = AppTheme.darkLavender.rawValue
    @State private var prismaEditablePreferredCallsignTextFieldPayload = ""
    @State private var prismaEditableAgeNumericTextFieldPayload = ""
    @State private var prismaEditableBiologicalGenderSegmentSelectionPayload = "Мужской"
    @State private var prismaEditableAttachmentStyleEnumerationRawPayload =
        PrismaProfileAttachmentStylePreferenceEnumeration.secureStableBondingAxis.rawValue
    @State private var prismaEditableAiPersonalizationFreeformNotePayload = ""
    @State private var prismaSafetyEducationSheetPresentationActiveFlag = false

    private var prismaHydratedAttachmentStylePreferenceSelection: PrismaProfileAttachmentStylePreferenceEnumeration {
        PrismaProfileAttachmentStylePreferenceEnumeration(rawValue: prismaEditableAttachmentStyleEnumerationRawPayload)
            ?? .secureStableBondingAxis
    }

    var body: some View {
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Профиль")
                        .font(PrismaTypography.prismaPremiumScreenTitleRoundedBold)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    prismaProfileSafetyEducationIngressControlCluster
                    prismaProfileBasicIdentityMetadataSectionCluster
                    prismaProfilePsychologicalInferencePayloadSectionCluster
                    prismaProfileVisualAppearanceThemeControlSectionCluster
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 24)
            }
        }
        .onAppear {
            prismaHydrateEditableFieldsFromPersistentProfileSnapshotWithLegacyAssimilation()
            PrismaProductUsageTelemetrySignalRecorder.prismaIncrementOrdinalTallyForTelemetrySignal(
                .applicationProfileSettingsSurfaceDidAppear
            )
        }
        .onChange(of: prismaApplicationThemePreferenceStorageRawValue) { _ in
            PrismaTactileFeedbackPulseController.prismaEmitLightImpactPulse()
        }
        .onChange(of: prismaEditablePreferredCallsignTextFieldPayload) { _ in
            prismaPersistMergedApplicationProfileTabPayloadIntoFilesystemSnapshot()
        }
        .onChange(of: prismaEditableBiologicalGenderSegmentSelectionPayload) { _ in
            prismaPersistMergedApplicationProfileTabPayloadIntoFilesystemSnapshot()
        }
        .onChange(of: prismaEditableAttachmentStyleEnumerationRawPayload) { _ in
            prismaPersistMergedApplicationProfileTabPayloadIntoFilesystemSnapshot()
        }
        .onChange(of: prismaEditableAiPersonalizationFreeformNotePayload) { _ in
            prismaPersistMergedApplicationProfileTabPayloadIntoFilesystemSnapshot()
        }
        .sheet(isPresented: $prismaSafetyEducationSheetPresentationActiveFlag) {
            PrismaApplicationSafetyBoundaryEducationScrollablePanelView()
        }
    }

    private var prismaProfileSafetyEducationIngressControlCluster: some View {
        Button {
            prismaSafetyEducationSheetPresentationActiveFlag = true
        } label: {
            HStack(spacing: 14) {
                Image(systemName: "checkmark.shield.fill")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                Text("Безопасность и ограничения")
                    .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer(minLength: 0)
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
            }
        }
        .buttonStyle(.plain)
        .prismaProfileSectionCardUniformSurfaceStyle()
    }

    private var prismaProfileBasicIdentityMetadataSectionCluster: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Базовые данные")
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Имя", text: $prismaEditablePreferredCallsignTextFieldPayload)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(PrismaColors.prismaFormFieldMutedFillSurface(prismaRuntimeActiveAppThemeComposition))
                )
            TextField("Возраст", text: $prismaEditableAgeNumericTextFieldPayload)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .keyboardType(.numberPad)
                .onChange(of: prismaEditableAgeNumericTextFieldPayload) { prismaIncomingAgeTextSnapshot in
                    let prismaSanitizedAgeDigitOnlySpan = String(prismaIncomingAgeTextSnapshot.filter(\.isNumber))
                    guard prismaSanitizedAgeDigitOnlySpan == prismaIncomingAgeTextSnapshot else {
                        prismaEditableAgeNumericTextFieldPayload = prismaSanitizedAgeDigitOnlySpan
                        return
                    }
                    prismaPersistMergedApplicationProfileTabPayloadIntoFilesystemSnapshot()
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(PrismaColors.prismaFormFieldMutedFillSurface(prismaRuntimeActiveAppThemeComposition))
                )
            Picker("Пол", selection: $prismaEditableBiologicalGenderSegmentSelectionPayload) {
                Text("М").tag("Мужской")
                Text("Ж").tag("Женский")
                Text("Другое").tag("Другое")
            }
            .pickerStyle(.segmented)
            .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
        }
        .prismaProfileSectionCardUniformSurfaceStyle()
    }

    private var prismaProfilePsychologicalInferencePayloadSectionCluster: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Психологический профиль")
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .frame(maxWidth: .infinity, alignment: .leading)
            Menu {
                ForEach(PrismaProfileAttachmentStylePreferenceEnumeration.allCases) { prismaAttachmentEnumerationCase in
                    Button(prismaAttachmentEnumerationCase.prismaLocalizedRussianReadableMenuTitle) {
                        prismaEditableAttachmentStyleEnumerationRawPayload = prismaAttachmentEnumerationCase.rawValue
                    }
                }
            } label: {
                HStack {
                    Text(prismaHydratedAttachmentStylePreferenceSelection.prismaLocalizedRussianReadableMenuTitle)
                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Spacer(minLength: 0)
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                }
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(PrismaColors.prismaFormFieldMutedFillSurface(prismaRuntimeActiveAppThemeComposition))
                )
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("О себе (для ИИ)")
                    .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                Text(
                    "Напиши то, что бот должен учитывать в каждом ответе. Например: 'У меня СДВГ, пиши короче', или 'Я очень ранимая, не критикуй меня жестко'."
                )
                .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .prismaComfortableMultilineReadableTextBlockModifierChain()
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $prismaEditableAiPersonalizationFreeformNotePayload)
                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .scrollContentBackground(.hidden)
                        .frame(minHeight: 100, maxHeight: 100)
                        .padding(8)
                    if prismaEditableAiPersonalizationFreeformNotePayload.isEmpty {
                        Text("Необязательно")
                            .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                            .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition).opacity(0.55))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 14)
                            .allowsHitTesting(false)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(PrismaColors.prismaFormFieldMutedFillSurface(prismaRuntimeActiveAppThemeComposition))
                )
            }
        }
        .prismaProfileSectionCardUniformSurfaceStyle()
    }

    private var prismaProfileVisualAppearanceThemeControlSectionCluster: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Внешний вид")
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .frame(maxWidth: .infinity, alignment: .leading)
            Picker("Тема", selection: $prismaApplicationThemePreferenceStorageRawValue) {
                Text("🌙 Темная").tag(AppTheme.darkLavender.rawValue)
                Text("☀️ Светлая").tag(AppTheme.lightTranslucentLavender.rawValue)
            }
            .pickerStyle(.segmented)
            .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
        }
        .prismaProfileSectionCardUniformSurfaceStyle()
    }

    private func prismaHydrateEditableFieldsFromPersistentProfileSnapshotWithLegacyAssimilation() {
        let prismaMergedSnapshot = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaFabricateMergedUserProfileSnapshotAssimilatingLegacyIsolatedApplicationTabKeysIfNeeded()
        prismaEditablePreferredCallsignTextFieldPayload = prismaMergedSnapshot.prismaPreferredCallsignForUserInterfaceDisplay
        prismaEditableAgeNumericTextFieldPayload = prismaMergedSnapshot.userAgeFreeformInputText
        prismaEditableBiologicalGenderSegmentSelectionPayload = prismaMergedSnapshot.userGender
        if prismaEditableBiologicalGenderSegmentSelectionPayload == "Не указан" {
            prismaEditableBiologicalGenderSegmentSelectionPayload = "Мужской"
        }
        if prismaEditableBiologicalGenderSegmentSelectionPayload == "М" {
            prismaEditableBiologicalGenderSegmentSelectionPayload = "Мужской"
        }
        if prismaEditableBiologicalGenderSegmentSelectionPayload == "Ж" {
            prismaEditableBiologicalGenderSegmentSelectionPayload = "Женский"
        }
        prismaEditableAttachmentStyleEnumerationRawPayload =
            prismaMergedSnapshot.prismaAttachmentStylePreferenceEnumerationSerializedRawValue.isEmpty
            ? PrismaProfileAttachmentStylePreferenceEnumeration.secureStableBondingAxis.rawValue
            : prismaMergedSnapshot.prismaAttachmentStylePreferenceEnumerationSerializedRawValue
        prismaEditableAiPersonalizationFreeformNotePayload = prismaMergedSnapshot.prismaAIResponsePersonalizationNoteFreeformText
    }

    private func prismaPersistMergedApplicationProfileTabPayloadIntoFilesystemSnapshot() {
        var prismaBaselineSnapshot = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
            .prismaLoadLatestPersistedUserProfileSnapshot() ?? UserProfile()
        prismaBaselineSnapshot.prismaAssimilateApplicationProfileTabObservablePreferenceCluster(
            prismaPreferredCallsignPayload: prismaEditablePreferredCallsignTextFieldPayload,
            prismaAgeNumericOrFreeformPayload: prismaEditableAgeNumericTextFieldPayload,
            prismaGenderSegmentSelectionPayload: prismaEditableBiologicalGenderSegmentSelectionPayload,
            prismaAttachmentStyleEnumerationRawPayload: prismaEditableAttachmentStyleEnumerationRawPayload,
            prismaAiPersonalizationFreeformNotePayload: prismaEditableAiPersonalizationFreeformNotePayload
        )
        PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance.prismaPersistCodableUserProfileSnapshot(prismaBaselineSnapshot)
    }
}

#Preview {
    ProfileView()
}
