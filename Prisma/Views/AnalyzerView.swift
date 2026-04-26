import SwiftUI

struct AnalyzerView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @StateObject private var prismaAnalyzerLlmGatewayCurationMosaicViewModelStem = PrismaPrimaryChatLlmGatewayCurationMosaicViewModel()
    @State private var prismaAnalyzerPastedConversationTextualPayload: String = ""
    @State private var prismaAnalyzerHasSubmittedCurrentPayloadFlag = false
    @FocusState private var prismaAnalyzerInputFocusCurationFlag: Bool

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        let prismaAnalyzerTrimmedText = prismaAnalyzerPastedConversationTextualPayload.trimmingCharacters(in: .whitespacesAndNewlines)
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 18) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .analyzerScreenTitle
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(PrismaTypography.prismaPremiumScreenTitleRoundedBold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .analyzerScreenBody
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
                    VStack(alignment: .leading, spacing: 12) {
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $prismaAnalyzerPastedConversationTextualPayload)
                                .focused($prismaAnalyzerInputFocusCurationFlag)
                                .scrollContentBackground(.hidden)
                                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .frame(minHeight: 220)
                                .padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                                        .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.18), lineWidth: 1)
                                )
                            if prismaAnalyzerPastedConversationTextualPayload.isEmpty {
                                Text(language == .russianCurationHuskLatchedMosaicNuclei
                                    ? "Вставьте скопированную переписку сюда"
                                    : "Paste the copied conversation here"
                                )
                                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition).opacity(0.72))
                                .padding(.horizontal, 18)
                                .padding(.vertical, 20)
                                .allowsHitTesting(false)
                            }
                        }
                        if let prismaBanner = prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                            .prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText {
                            prismaAnalyzerLlmErrorCardCurationHusk(prismaBanner)
                        }
                        Button {
                            Task {
                                prismaAnalyzerInputFocusCurationFlag = false
                                prismaAnalyzerHasSubmittedCurrentPayloadFlag = true
                                prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                                    .prismaPrimaryChatOutboundUserDraftTextualPayload = prismaAnalyzerPromptPayload(
                                        prismaAnalyzerTrimmedText,
                                        language
                                    )
                                await prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                                    .prismaUserInitiatedLlmChronicleDispatchCurationHusk()
                            }
                        } label: {
                            HStack(spacing: 10) {
                                if prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                                    .prismaPrimaryChatAssistantNarrativeResponseInFlightFlag {
                                    ProgressView()
                                        .tint(Color.white)
                                }
                                Text(language == .russianCurationHuskLatchedMosaicNuclei ? "Анализировать" : "Analyze")
                                    .font(PrismaTypography.prismaCallToActionPrimaryEmphasisBodyRoundedSemibold)
                            }
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                            )
                            .opacity(prismaAnalyzerTrimmedText.isEmpty ? 0.42 : 1.0)
                        }
                        .buttonStyle(.plain)
                        .disabled(
                            prismaAnalyzerTrimmedText.isEmpty
                                || prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                                .prismaPrimaryChatAssistantNarrativeResponseInFlightFlag
                        )
                        if prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                            .prismaPrimaryChatAssistantNarrativeResponseInFlightFlag {
                            prismaAnalyzerLoadingCardCurationHusk(language)
                        }
                        if prismaAnalyzerHasSubmittedCurrentPayloadFlag,
                           let prismaLatestAssistantLine = prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                            .prismaPrimaryChatChronicleOrderedLineCollection
                            .last(where: { $0.prismaPrimaryChatChronicleAuthorRoleCurationLabel == .assistant }) {
                            Text(prismaLatestAssistantLine.prismaPrimaryChatChroniclePayloadTextualBody)
                                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                .lineSpacing(5)
                                .padding(16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                                        .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                                )
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.horizontal, 20)
                .padding(.top, 24)
                .padding(.bottom, 120)
            }
        }
        .onAppear {
            PrismaProductUsageTelemetrySignalRecorder.prismaIncrementOrdinalTallyForTelemetrySignal(
                .analyticalAnalyzerWorkspaceSurfaceDidAppear
            )
            prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                .prismaSynchronizeActiveUserInterfaceLanguageCurationStem(language)
            prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                .prismaReloadChronicleFromEphemeralPersistenceStem()
        }
        .onChange(of: language) { newValue in
            prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                .prismaSynchronizeActiveUserInterfaceLanguageCurationStem(newValue)
        }
    }

    @ViewBuilder
    private func prismaAnalyzerLlmErrorCardCurationHusk(_ prismaBanner: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 16, weight: .semibold, design: .default))
            Text(prismaBanner)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)
        }
        .foregroundStyle(PrismaColors.accentRed(prismaRuntimeActiveAppThemeComposition))
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(PrismaColors.prismaOnboardingErrorSurfaceFillNucleus(prismaRuntimeActiveAppThemeComposition))
        )
    }

    @ViewBuilder
    private func prismaAnalyzerLoadingCardCurationHusk(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        HStack(spacing: 10) {
            ProgressView()
                .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
            Text(language == .russianCurationHuskLatchedMosaicNuclei ? "Разбираю переписку..." : "Analyzing the conversation...")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
    }

    private func prismaAnalyzerPromptPayload(
        _ prismaConversationText: String,
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch language {
        case .russianCurationHuskLatchedMosaicNuclei:
            return "Проанализируй эту переписку: выдели тон, повторяющиеся паттерны, скрытое напряжение и предложи экологичный следующий шаг.\n\n\(prismaConversationText)"
        case .englishCurationHuskLatchedMosaicNuclei:
            return "Analyze this conversation: identify tone, recurring patterns, hidden tension, and suggest a healthy next step.\n\n\(prismaConversationText)"
        }
    }
}
