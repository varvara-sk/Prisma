import SwiftUI

struct AnalyzerView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @StateObject private var prismaAnalyzerLlmGatewayCurationMosaicViewModelStem = PrismaPrimaryChatLlmGatewayCurationMosaicViewModel()
    @State private var prismaAnalyzerPastedConversationTextualPayload: String = ""
    @State private var prismaAnalyzerHasSubmittedCurrentPayloadFlag = false
    @State private var prismaAnalyzerLatestReportSnapshot: PrismaAnalyzerConversationReportSnapshot?
    @State private var prismaAnalyzerFreemiumUsageLedgerSnapshot = PrismaFreemiumUsageLedgerSnapshot(
        chatMessagesDateKey: "",
        chatMessagesTodayCount: 0,
        analyzerUsedCount: 0,
        isPremium: false
    )
    @State private var prismaAnalyzerPaywallBannerTextualPayload: String?
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
                        if let prismaAnalyzerPaywallBannerTextualPayload {
                            prismaAnalyzerPaywallCardCurationHusk(prismaAnalyzerPaywallBannerTextualPayload)
                        }
                        Button {
                            Task {
                                if !prismaAnalyzerFreemiumUsageLedgerSnapshot.isPremium,
                                   prismaAnalyzerFreemiumUsageLedgerSnapshot.analyzerUsedCount >= 1 {
                                    prismaAnalyzerPaywallBannerTextualPayload = language == .russianCurationHuskLatchedMosaicNuclei
                                        ? "Ого, вы уже попробовали Анализатор! Хотите разбирать переписки безлимитно и читать между строк? Оформите Premium."
                                        : "You already tried Analyzer. Upgrade to Premium for unlimited conversation reports."
                                    return
                                }
                                prismaAnalyzerPaywallBannerTextualPayload = nil
                                prismaAnalyzerInputFocusCurationFlag = false
                                prismaAnalyzerHasSubmittedCurrentPayloadFlag = true
                                let prismaAssistantReportText = await prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                                    .prismaDispatchOneShotLlmRequestCurationHusk(
                                        prismaUserPayloadTextualBody: prismaAnalyzerPromptPayload(
                                            prismaAnalyzerTrimmedText,
                                            language
                                        ),
                                        prismaSystemPromptOverrideTextualBody: prismaAnalyzerSystemPromptPayload(language)
                                    )
                                if let prismaAssistantReportText {
                                    let prismaReportSnapshot = prismaAnalyzerReportSnapshot(prismaAssistantReportText)
                                    prismaAnalyzerLatestReportSnapshot = prismaReportSnapshot
                                    PrismaUserProfileLocalStorageService
                                        .prismaSharedSingletonInstance
                                        .prismaPersistAnalyzerConversationReportSnapshot(prismaReportSnapshot)
                                    PrismaUserProfileLocalStorageService
                                        .prismaSharedSingletonInstance
                                        .prismaIncrementFreemiumAnalyzerUsedCount()
                                    prismaAnalyzerFreemiumUsageLedgerSnapshot = PrismaUserProfileLocalStorageService
                                        .prismaSharedSingletonInstance
                                        .prismaLoadFreemiumUsageLedgerSnapshot()
                                }
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
                            .opacity(
                                prismaAnalyzerTrimmedText.isEmpty
                                    || (!prismaAnalyzerFreemiumUsageLedgerSnapshot.isPremium
                                        && prismaAnalyzerFreemiumUsageLedgerSnapshot.analyzerUsedCount >= 1)
                                    ? 0.42
                                    : 1.0
                            )
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
                           let prismaAnalyzerLatestReportSnapshot {
                            prismaAnalyzerReportCardStackCurationHusk(prismaAnalyzerLatestReportSnapshot, language)
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
            prismaAnalyzerLatestReportSnapshot = PrismaUserProfileLocalStorageService
                .prismaSharedSingletonInstance
                .prismaLoadAnalyzerConversationReportSnapshot()
            prismaAnalyzerHasSubmittedCurrentPayloadFlag = prismaAnalyzerLatestReportSnapshot != nil
            prismaAnalyzerFreemiumUsageLedgerSnapshot = PrismaUserProfileLocalStorageService
                .prismaSharedSingletonInstance
                .prismaLoadFreemiumUsageLedgerSnapshot()
        }
        .onChange(of: language) { newValue in
            prismaAnalyzerLlmGatewayCurationMosaicViewModelStem
                .prismaSynchronizeActiveUserInterfaceLanguageCurationStem(newValue)
        }
    }

    @ViewBuilder
    private func prismaAnalyzerPaywallCardCurationHusk(_ prismaBanner: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "lock.fill")
                .font(.system(size: 16, weight: .semibold, design: .default))
            Text(prismaBanner)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .lineSpacing(3)
        }
        .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.12))
        )
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
            return "Переписка для разбора:\n\n\(prismaConversationText)"
        case .englishCurationHuskLatchedMosaicNuclei:
            return "Conversation to analyze:\n\n\(prismaConversationText)"
        }
    }

    private func prismaAnalyzerSystemPromptPayload(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch language {
        case .russianCurationHuskLatchedMosaicNuclei:
            return "Ты Prisma Analyzer. Разбирай только вставленную переписку, не веди диалог. Верни markdown-отчет строго с разделами: ## Тон, ## Повторяющиеся паттерны, ## Скрытое напряжение, ## Красные флаги, ## Следующий шаг. Пиши коротко, бережно, без диагнозов."
        case .englishCurationHuskLatchedMosaicNuclei:
            return "You are Prisma Analyzer. Analyze only the pasted conversation, do not chat. Return a markdown report with exactly these sections: ## Tone, ## Repeated Patterns, ## Hidden Tension, ## Red Flags, ## Next Step. Be concise, careful, and avoid diagnoses."
        }
    }

    private func prismaAnalyzerReportSnapshot(_ prismaRawMarkdownText: String) -> PrismaAnalyzerConversationReportSnapshot {
        PrismaAnalyzerConversationReportSnapshot(
            id: UUID(),
            createdAt: Date(),
            rawMarkdownText: prismaRawMarkdownText,
            toneMarkdownText: prismaAnalyzerMarkdownSection("Тон", englishTitle: "Tone", source: prismaRawMarkdownText),
            repeatedPatternsMarkdownText: prismaAnalyzerMarkdownSection("Повторяющиеся паттерны", englishTitle: "Repeated Patterns", source: prismaRawMarkdownText),
            hiddenTensionMarkdownText: prismaAnalyzerMarkdownSection("Скрытое напряжение", englishTitle: "Hidden Tension", source: prismaRawMarkdownText),
            redFlagsMarkdownText: prismaAnalyzerMarkdownSection("Красные флаги", englishTitle: "Red Flags", source: prismaRawMarkdownText),
            nextStepMarkdownText: prismaAnalyzerMarkdownSection("Следующий шаг", englishTitle: "Next Step", source: prismaRawMarkdownText)
        )
    }

    private func prismaAnalyzerMarkdownSection(
        _ russianTitle: String,
        englishTitle: String,
        source: String
    ) -> String {
        let prismaLines = source.components(separatedBy: .newlines)
        var prismaCapturedLines: [String] = []
        var prismaIsCapturing = false
        for prismaLine in prismaLines {
            let prismaTrimmedLine = prismaLine.trimmingCharacters(in: .whitespacesAndNewlines)
            let prismaNormalizedLine = prismaTrimmedLine
                .replacingOccurrences(of: "#", with: "")
                .replacingOccurrences(of: "*", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()
            let prismaMatchesTarget = prismaNormalizedLine == russianTitle.lowercased()
                || prismaNormalizedLine == englishTitle.lowercased()
            if prismaMatchesTarget {
                prismaIsCapturing = true
                continue
            }
            if prismaIsCapturing,
               prismaTrimmedLine.hasPrefix("#") {
                break
            }
            if prismaIsCapturing {
                prismaCapturedLines.append(prismaLine)
            }
        }
        let prismaCapturedText = prismaCapturedLines
            .joined(separator: "\n")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        return prismaCapturedText.isEmpty ? source : prismaCapturedText
    }

    @ViewBuilder
    private func prismaAnalyzerReportCardStackCurationHusk(
        _ prismaReport: PrismaAnalyzerConversationReportSnapshot,
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            prismaAnalyzerReportCardCurationHusk(
                title: language == .russianCurationHuskLatchedMosaicNuclei ? "Тон" : "Tone",
                symbolName: "waveform",
                markdownText: prismaReport.toneMarkdownText
            )
            prismaAnalyzerReportCardCurationHusk(
                title: language == .russianCurationHuskLatchedMosaicNuclei ? "Паттерны" : "Patterns",
                symbolName: "repeat",
                markdownText: prismaReport.repeatedPatternsMarkdownText
            )
            prismaAnalyzerReportCardCurationHusk(
                title: language == .russianCurationHuskLatchedMosaicNuclei ? "Скрытое напряжение" : "Hidden Tension",
                symbolName: "bolt.heart",
                markdownText: prismaReport.hiddenTensionMarkdownText
            )
            prismaAnalyzerReportCardCurationHusk(
                title: language == .russianCurationHuskLatchedMosaicNuclei ? "Красные флаги" : "Red Flags",
                symbolName: "flag",
                markdownText: prismaReport.redFlagsMarkdownText
            )
            prismaAnalyzerReportCardCurationHusk(
                title: language == .russianCurationHuskLatchedMosaicNuclei ? "Следующий шаг" : "Next Step",
                symbolName: "arrow.forward.circle",
                markdownText: prismaReport.nextStepMarkdownText
            )
        }
    }

    @ViewBuilder
    private func prismaAnalyzerReportCardCurationHusk(
        title: String,
        symbolName: String,
        markdownText: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: symbolName)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                Text(title)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            }
            prismaAnalyzerMarkdownRenderedTextCurationHusk(markdownText)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                .lineSpacing(5)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
    }

    private func prismaAnalyzerMarkdownRenderedTextCurationHusk(_ prismaMarkdownText: String) -> Text {
        if let prismaAttributedMarkdown = try? AttributedString(
            markdown: prismaMarkdownText,
            options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        ) {
            return Text(prismaAttributedMarkdown)
        }
        return Text(prismaMarkdownText)
    }
}
