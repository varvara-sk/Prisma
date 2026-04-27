import SwiftUI

struct ChatView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @StateObject private var prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem = PrismaPrimaryChatLlmGatewayCurationMosaicViewModel()
    @FocusState private var prismaPrimaryChatOutboundDraftFieldFocusCurationFlag: Bool

    private func prismaStarterPromptRows(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> [String] {
        language == .russianCurationHuskLatchedMosaicNuclei
            ? [
                "Мне просто нужно выговориться",
                "Помоги разобрать вчерашнюю ссору",
                "Напиши за меня ответ",
            ]
            : [
                "I just need to vent",
                "Help me unpack yesterday's fight",
                "Write a reply for me",
            ]
    }

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .chatScreenTitle
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(PrismaTypography.prismaPremiumScreenTitleRoundedBold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .chatContextNote
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                    )
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .lineSpacing(4)
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                if let prismaBanner = prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                    .prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText {
                    prismaPrimaryChatLlmErrorCardCurationHusk(prismaBanner)
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                }
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 12) {
                            if prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                                .prismaPrimaryChatChronicleOrderedLineCollection
                                .isEmpty {
                                prismaPrimaryChatStarterPromptEmptyStateCurationHusk(language)
                                    .frame(maxWidth: .infinity, minHeight: 360, alignment: .center)
                            } else {
                                ForEach(prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                                    .prismaPrimaryChatChronicleOrderedLineCollection
                                ) { line in
                                    prismaPrimaryChatChronicleBubbleCurationHusk(line)
                                    .id(line.id)
                                }
                                if prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                                    .prismaPrimaryChatAssistantNarrativeResponseInFlightFlag {
                                    prismaPrimaryChatAssistantThinkingCardCurationHusk(language)
                                        .id("prismaPrimaryChatAssistantThinkingCardCurationHusk")
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                    .onChange(of: prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                        .prismaPrimaryChatChronicleOrderedLineCollection.count
                    ) { _ in
                        if let lastId = prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                            .prismaPrimaryChatChronicleOrderedLineCollection.last?.id {
                            withAnimation {
                                proxy.scrollTo(lastId, anchor: .bottom)
                            }
                        }
                    }
                }
                HStack(alignment: .bottom, spacing: 10) {
                    TextField(
                        PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                            .chatMessageDraftPlaceholder
                            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language),
                        text: $prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                            .prismaPrimaryChatOutboundUserDraftTextualPayload,
                        axis: .vertical
                    )
                    .lineLimit(1...6)
                    .textFieldStyle(.plain)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                    )
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .focused($prismaPrimaryChatOutboundDraftFieldFocusCurationFlag)
                    Button {
                        Task {
                            await prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                                .prismaUserInitiatedLlmChronicleDispatchCurationHusk()
                        }
                    } label: {
                        if prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                            .prismaPrimaryChatAssistantNarrativeResponseInFlightFlag {
                            ProgressView()
                                .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                .frame(width: 44, height: 44)
                        } else {
                            Text(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                                .chatPrimarySendActionLabel
                                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language)
                            )
                            .font(PrismaTypography.prismaCallToActionPrimaryEmphasisBodyRoundedSemibold)
                            .foregroundStyle(Color.white)
                            .frame(minWidth: 44, minHeight: 44)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                            )
                        }
                    }
                    .buttonStyle(.plain)
                    .disabled(
                        prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                            .prismaPrimaryChatAssistantNarrativeResponseInFlightFlag
                    )
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 12)
                .padding(.top, 4)
            }
        }
        .onAppear {
            PrismaProductUsageTelemetrySignalRecorder.prismaIncrementOrdinalTallyForTelemetrySignal(
                .primaryChatConversationSurfaceDidAppear
            )
            prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                .prismaSynchronizeActiveUserInterfaceLanguageCurationStem(language)
            prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                .prismaReloadChronicleFromEphemeralPersistenceStem()
        }
        .onChange(of: language) { newValue in
            prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                .prismaSynchronizeActiveUserInterfaceLanguageCurationStem(newValue)
        }
    }

    @ViewBuilder
    private func prismaPrimaryChatLlmErrorCardCurationHusk(_ prismaBanner: String) -> some View {
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
    private func prismaPrimaryChatAssistantThinkingCardCurationHusk(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        HStack(spacing: 10) {
            ProgressView()
                .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
            Text(language == .russianCurationHuskLatchedMosaicNuclei ? "Prisma думает..." : "Prisma is thinking...")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
    }

    @ViewBuilder
    private func prismaPrimaryChatStarterPromptEmptyStateCurationHusk(
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> some View {
        VStack(alignment: .center, spacing: 16) {
            Text(language == .russianCurationHuskLatchedMosaicNuclei ? "С чего начать?" : "Where to start?")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            VStack(spacing: 10) {
                ForEach(prismaStarterPromptRows(language), id: \.self) { prompt in
                    Button {
                        Task {
                            prismaPrimaryChatOutboundDraftFieldFocusCurationFlag = false
                            prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                                .prismaPrimaryChatOutboundUserDraftTextualPayload = prompt
                            await prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                                .prismaUserInitiatedLlmChronicleDispatchCurationHusk()
                        }
                    } label: {
                        Text(prompt)
                            .font(.system(size: 15, weight: .medium, design: .rounded))
                            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                            .background(
                                Capsule(style: .continuous)
                                    .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                            )
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.18), lineWidth: 1)
                            )
                    }
                    .buttonStyle(.plain)
                    .disabled(
                        prismaPrimaryChatLlmGatewayCurationMosaicViewModelStem
                            .prismaPrimaryChatAssistantNarrativeResponseInFlightFlag
                    )
                }
            }
        }
        .padding(.horizontal, 8)
    }

    @ViewBuilder
    private func prismaPrimaryChatChronicleBubbleCurationHusk(
        _ line: PrismaPrimaryChatConversationChronicleNucleusPersistedLineFragment
    ) -> some View {
        let prismaIsUserBubble = line.prismaPrimaryChatChronicleAuthorRoleCurationLabel == .user
        let prismaShouldUseFullWidthUserCard = prismaIsUserBubble
            && line.prismaPrimaryChatChroniclePayloadTextualBody.count > 300
        HStack {
            if prismaIsUserBubble && !prismaShouldUseFullWidthUserCard {
                Spacer(minLength: 48)
            }
            Group {
                if prismaIsUserBubble {
                    Text(line.prismaPrimaryChatChroniclePayloadTextualBody)
                        .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                } else {
                    prismaPrimaryChatMarkdownRenderedTextCurationHusk(
                        line.prismaPrimaryChatChroniclePayloadTextualBody
                    )
                }
            }
            .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            .multilineTextAlignment(.leading)
            .lineSpacing(4)
            .padding(12)
            .frame(
                maxWidth: prismaShouldUseFullWidthUserCard ? .infinity : nil,
                alignment: .leading
            )
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(
                        prismaIsUserBubble
                            ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.22)
                            : PrismaColors.surface(prismaRuntimeActiveAppThemeComposition)
                    )
            )
            if !prismaIsUserBubble {
                Spacer(minLength: 48)
            }
        }
    }

    private func prismaPrimaryChatMarkdownRenderedTextCurationHusk(_ prismaMarkdownText: String) -> Text {
        if let prismaAttributedMarkdown = try? AttributedString(
            markdown: prismaMarkdownText,
            options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        ) {
            return Text(prismaAttributedMarkdown)
        }
        return Text(prismaMarkdownText)
    }
}
