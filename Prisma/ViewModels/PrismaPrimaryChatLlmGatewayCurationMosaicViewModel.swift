import Foundation

@MainActor
final class PrismaPrimaryChatLlmGatewayCurationMosaicViewModel: ObservableObject {
    @Published var prismaPrimaryChatChronicleOrderedLineCollection: [PrismaPrimaryChatConversationChronicleNucleusPersistedLineFragment] = []
    @Published var prismaPrimaryChatOutboundUserDraftTextualPayload: String = ""
    @Published var prismaPrimaryChatAssistantNarrativeResponseInFlightFlag: Bool = false
    @Published var prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText: String?
    @Published var prismaPrimaryChatCrisisCardTextualPayload: String?
    @Published var prismaPrimaryChatPaywallBannerTextualPayload: String?
    @Published private(set) var prismaCinematicActiveUserInterfaceLanguagePreferenceStem: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration =
        .russianCurationHuskLatchedMosaicNuclei

    private let prismaUserProfileEphemeralStorageStem = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
    private var prismaLlmGatewayMosaicTransportChamber: PrismaOpenAIGatewayLlmMosaicTransportChamberCuration?
    private let prismaPrimaryChatChroniclePayloadCapForLlmGatewayDispatch: Int = 48
    private let prismaFreeChatMessagesDailyLimit = 50

    init() {
        do {
            let prismaTransportCasket = try PrismaOpenAIGatewayLlmProxyTransportSessionConfigurationCasket
                .prismaCurationMosaicRoutableHuskForSupabaseLatchedProjectCurationChamber(
                    supabaseCinematicCurationMosaicProjectReference: PrismaLlmGatewayMosaicSupabaseEdgeRoutableCredentialsCurationManifest
                        .prismaLlmSupabaseCurationMosaicProjectReferenceHusk,
                    supabaseCinematicCurationMosaicFunctionSlug: PrismaLlmGatewayMosaicSupabaseEdgeRoutableCredentialsCurationManifest
                        .prismaLlmSupabaseEdgeCurationMosaicFunctionSlugHusk,
                    supabaseCinematicCurationMosaicClientSharedProxyInvocationSecret: PrismaLlmGatewayMosaicSupabaseEdgeRoutableCredentialsCurationManifest
                        .prismaLlmEdgeProxySharedPlaintextSecretInvocationCurationHusk,
                    prismaCinematicCurationMosaicChamberUrlSessionTimeout: PrismaLlmGatewayMosaicSupabaseEdgeRoutableCredentialsCurationManifest
                        .prismaLlmRoutableGatewayHttpTimeoutIntervalSeconds
                )
            prismaLlmGatewayMosaicTransportChamber = PrismaOpenAIGatewayLlmMosaicTransportChamberCuration(
                prismaCinematicLatchedCurationSession: .prismaCinematicLatchedCurationHusk,
                prismaCinematicLatchedCurationMosaic: prismaTransportCasket
            )
        } catch {
            prismaLlmGatewayMosaicTransportChamber = nil
        }
        prismaReloadChronicleFromEphemeralPersistenceStem()
    }

    func prismaSynchronizeActiveUserInterfaceLanguageCurationStem(
        _ prismaIncomingLanguagePreference: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) {
        prismaCinematicActiveUserInterfaceLanguagePreferenceStem = prismaIncomingLanguagePreference
    }

    func prismaReloadChronicleFromEphemeralPersistenceStem() {
        prismaPrimaryChatChronicleOrderedLineCollection = prismaUserProfileEphemeralStorageStem
            .prismaLoadPrimaryChatConversationChronicleNucleusPersistedLineCollection()
    }

    func prismaUserInitiatedLlmChronicleDispatchCurationHusk() async {
        let prismaTrimmedOutbound = prismaPrimaryChatOutboundUserDraftTextualPayload
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if prismaTrimmedOutbound.isEmpty {
            return
        }
        let prismaFreemiumLedger = prismaUserProfileEphemeralStorageStem.prismaLoadFreemiumUsageLedgerSnapshot()
        if !prismaFreemiumLedger.isPremium,
           prismaFreemiumLedger.chatMessagesTodayCount >= prismaFreeChatMessagesDailyLimit {
            prismaPrimaryChatPaywallBannerTextualPayload = prismaCinematicActiveUserInterfaceLanguagePreferenceStem == .russianCurationHuskLatchedMosaicNuclei
                ? "Вы достигли лимита глубоких разборов на сегодня. Перейдите на Premium для безлимитной поддержки."
                : "You reached today's deep support limit. Upgrade to Premium for unlimited support."
            return
        }
        guard let prismaTransport = prismaLlmGatewayMosaicTransportChamber else {
            prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText = PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .chatLlmGatewayDispatchFailureBanner
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(prismaCinematicActiveUserInterfaceLanguagePreferenceStem)
            return
        }
        prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText = nil
        prismaPrimaryChatPaywallBannerTextualPayload = nil
        prismaPrimaryChatAssistantNarrativeResponseInFlightFlag = true
        let prismaUserLine = PrismaPrimaryChatConversationChronicleNucleusPersistedLineFragment(
            id: UUID(),
            prismaPrimaryChatChronicleAuthorRoleCurationLabel: .user,
            prismaPrimaryChatChroniclePayloadTextualBody: prismaTrimmedOutbound,
            prismaPrimaryChatChronicleAnchoredTimestamp: .init()
        )
        prismaPrimaryChatChronicleOrderedLineCollection.append(prismaUserLine)
        prismaPrimaryChatOutboundUserDraftTextualPayload = ""
        prismaUserProfileEphemeralStorageStem.prismaPersistPrimaryChatConversationChronicleNucleusPersistedLineCollection(
            prismaPrimaryChatChronicleOrderedLineCollection
        )
        let prismaLoadedProfile = prismaUserProfileEphemeralStorageStem
            .prismaFabricateMergedUserProfileSnapshotAssimilatingLegacyIsolatedApplicationTabKeysIfNeeded()
        let prismaSystemPrompt = prismaFabricateLlmSystemPromptCurationHuskFromUserProfile(
            prismaLoadedProfile,
            prismaCinematicActiveUserInterfaceLanguagePreferenceStem
        )
        let prismaSlicedChronicle = Array(
            prismaPrimaryChatChronicleOrderedLineCollection.suffix(prismaPrimaryChatChroniclePayloadCapForLlmGatewayDispatch)
        )
        let prismaGatewayFragments = prismaSlicedChronicle.compactMap { line -> PrismaOpenAIGatewayLlmMosaicChronicleNucleusUserAssistantLineFragment? in
            switch line.prismaPrimaryChatChronicleAuthorRoleCurationLabel {
            case .user:
                return PrismaOpenAIGatewayLlmMosaicChronicleNucleusUserAssistantLineFragment(
                    prismaOpenAIWireProtocolRoleCurationLabel: .user,
                    prismaOpenAIPayloadContentChronicleLatchedLine: line.prismaPrimaryChatChroniclePayloadTextualBody
                )
            case .assistant:
                return PrismaOpenAIGatewayLlmMosaicChronicleNucleusUserAssistantLineFragment(
                    prismaOpenAIWireProtocolRoleCurationLabel: .assistant,
                    prismaOpenAIPayloadContentChronicleLatchedLine: line.prismaPrimaryChatChroniclePayloadTextualBody
                )
            }
        }
        let prismaPayload = PrismaOpenAIGatewayLlmProxyCurationMosaicInvocationRoutableRequestPayload(
            prismaOpenAIInvocationSystemPromptCurationHusk: prismaSystemPrompt,
            prismaOpenAIChronicleMessageCurationHusk: prismaGatewayFragments,
            prismaOpenAIInvocationPremiumEntitlementFlag: prismaFreemiumLedger.isPremium,
            prismaOpenAIInvocationRequestedChatModelRawValue: prismaUserProfileEphemeralStorageStem
                .prismaLoadSelectedChatModelVersion()
                .rawValue
        )
        do {
            let prismaAssistantText = try await prismaTransport.prismaDispatchOpenAIProxyCurationLlmMosaicRoutableInvocation(
                prismaCinematicLatchedCurationHusk: prismaPayload
            )
            let prismaAssistantLine = PrismaPrimaryChatConversationChronicleNucleusPersistedLineFragment(
                id: UUID(),
                prismaPrimaryChatChronicleAuthorRoleCurationLabel: .assistant,
                prismaPrimaryChatChroniclePayloadTextualBody: prismaAssistantText,
                prismaPrimaryChatChronicleAnchoredTimestamp: .init()
            )
            prismaPrimaryChatChronicleOrderedLineCollection.append(prismaAssistantLine)
            prismaUserProfileEphemeralStorageStem.prismaPersistPrimaryChatConversationChronicleNucleusPersistedLineCollection(
                prismaPrimaryChatChronicleOrderedLineCollection
            )
            prismaUserProfileEphemeralStorageStem.prismaIncrementFreemiumChatMessagesTodayCount()
            prismaPersistChatDerivedDashboardSnapshot(prismaAssistantText)
        } catch let prismaCrisisSignal as PrismaOpenAIGatewayLlmCrisisInterventionRequiredSignal {
            if let prismaLastIndex = prismaPrimaryChatChronicleOrderedLineCollection.indices.last,
               prismaPrimaryChatChronicleOrderedLineCollection[prismaLastIndex].id == prismaUserLine.id {
                prismaPrimaryChatChronicleOrderedLineCollection.remove(at: prismaLastIndex)
            }
            prismaUserProfileEphemeralStorageStem.prismaPersistPrimaryChatConversationChronicleNucleusPersistedLineCollection(
                prismaPrimaryChatChronicleOrderedLineCollection
            )
            prismaPrimaryChatOutboundUserDraftTextualPayload = ""
            prismaPrimaryChatCrisisCardTextualPayload = prismaCrisisSignal.prismaCrisisCardTextualPayload
        } catch {
            if let prismaLastIndex = prismaPrimaryChatChronicleOrderedLineCollection.indices.last,
               prismaPrimaryChatChronicleOrderedLineCollection[prismaLastIndex].id == prismaUserLine.id,
               prismaPrimaryChatChronicleOrderedLineCollection[prismaLastIndex]
               .prismaPrimaryChatChronicleAuthorRoleCurationLabel == .user {
                prismaPrimaryChatChronicleOrderedLineCollection.remove(at: prismaLastIndex)
            }
            prismaUserProfileEphemeralStorageStem.prismaPersistPrimaryChatConversationChronicleNucleusPersistedLineCollection(
                prismaPrimaryChatChronicleOrderedLineCollection
            )
            prismaPrimaryChatOutboundUserDraftTextualPayload = prismaTrimmedOutbound
            prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText =
                Self
                .prismaChronicleLlmNucleusRoutableFailureBannerCurationHuskMosaicExcerpt(
                    prismaCinematicLatchedFailurePayload: error,
                    prismaCinematicLatchedUserInterfaceLanguageStem: prismaCinematicActiveUserInterfaceLanguagePreferenceStem
                )
        }
        prismaPrimaryChatAssistantNarrativeResponseInFlightFlag = false
    }

    private func prismaPersistChatDerivedDashboardSnapshot(_ prismaAssistantText: String) {
        let prismaUserMessageCount = prismaPrimaryChatChronicleOrderedLineCollection.filter {
            $0.prismaPrimaryChatChronicleAuthorRoleCurationLabel == .user
        }.count
        let prismaSnapshot = PrismaAnalyzerConversationReportSnapshot(
            id: UUID(),
            createdAt: Date(),
            rawMarkdownText: prismaAssistantText,
            toneMarkdownText: "Свежий срез из чата после \(prismaUserMessageCount) сообщений пользователя.",
            repeatedPatternsMarkdownText: prismaAssistantText,
            hiddenTensionMarkdownText: prismaAssistantText,
            redFlagsMarkdownText: "Проверьте последние рекомендации Prisma: если есть признаки давления, угроз или нарушения границ, действуйте осторожно.",
            nextStepMarkdownText: "Откройте чат и продолжите с последнего сообщения или сделайте отдельный разбор в Анализаторе."
        )
        prismaUserProfileEphemeralStorageStem.prismaPersistAnalyzerConversationReportSnapshotToActiveUserScenario(prismaSnapshot)
    }

    func prismaAcknowledgePrimaryChatCrisisSafetyState() {
        prismaPrimaryChatCrisisCardTextualPayload = nil
    }

    func prismaDispatchOneShotLlmRequestCurationHusk(
        prismaUserPayloadTextualBody: String,
        prismaSystemPromptOverrideTextualBody: String? = nil
    ) async -> String? {
        let prismaTrimmedPayload = prismaUserPayloadTextualBody.trimmingCharacters(in: .whitespacesAndNewlines)
        if prismaTrimmedPayload.isEmpty {
            return nil
        }
        guard let prismaTransport = prismaLlmGatewayMosaicTransportChamber else {
            prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText = PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .chatLlmGatewayDispatchFailureBanner
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(prismaCinematicActiveUserInterfaceLanguagePreferenceStem)
            return nil
        }
        prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText = nil
        prismaPrimaryChatAssistantNarrativeResponseInFlightFlag = true
        defer {
            prismaPrimaryChatAssistantNarrativeResponseInFlightFlag = false
        }
        let prismaLoadedProfile = prismaUserProfileEphemeralStorageStem
            .prismaFabricateMergedUserProfileSnapshotAssimilatingLegacyIsolatedApplicationTabKeysIfNeeded()
        let prismaSystemPrompt = prismaSystemPromptOverrideTextualBody
            ?? prismaFabricateLlmSystemPromptCurationHuskFromUserProfile(
                prismaLoadedProfile,
                prismaCinematicActiveUserInterfaceLanguagePreferenceStem
            )
        let prismaPayload = PrismaOpenAIGatewayLlmProxyCurationMosaicInvocationRoutableRequestPayload(
            prismaOpenAIInvocationSystemPromptCurationHusk: prismaSystemPrompt,
            prismaOpenAIChronicleMessageCurationHusk: [
                PrismaOpenAIGatewayLlmMosaicChronicleNucleusUserAssistantLineFragment(
                    prismaOpenAIWireProtocolRoleCurationLabel: .user,
                    prismaOpenAIPayloadContentChronicleLatchedLine: prismaTrimmedPayload
                ),
            ],
            prismaOpenAIInvocationPremiumEntitlementFlag: prismaUserProfileEphemeralStorageStem.prismaLoadFreemiumUsageLedgerSnapshot().isPremium
        )
        do {
            return try await prismaTransport.prismaDispatchOpenAIProxyCurationLlmMosaicRoutableInvocation(
                prismaCinematicLatchedCurationHusk: prismaPayload
            )
        } catch let prismaCrisisSignal as PrismaOpenAIGatewayLlmCrisisInterventionRequiredSignal {
            prismaPrimaryChatCrisisCardTextualPayload = prismaCrisisSignal.prismaCrisisCardTextualPayload
            return nil
        } catch {
            prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText =
                Self
                .prismaChronicleLlmNucleusRoutableFailureBannerCurationHuskMosaicExcerpt(
                    prismaCinematicLatchedFailurePayload: error,
                    prismaCinematicLatchedUserInterfaceLanguageStem: prismaCinematicActiveUserInterfaceLanguagePreferenceStem
                )
            return nil
        }
    }

    private func prismaFabricateLlmSystemPromptCurationHuskFromUserProfile(
        _ prismaUserProfile: UserProfile,
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        var prismaLines: [String] = []
        switch language {
        case .russianCurationHuskLatchedMosaicNuclei:
            prismaLines.append(
                "Ты Prisma — внимательный ассистент в теме отношений и личных границ. Отвечай кратко, по существу, с теплом. Не выдавай себя за врача или юриста. Если риск — предложи обратиться к специалисту."
            )
            prismaLines.append("Пиши ответы на русском.")
        case .englishCurationHuskLatchedMosaicNuclei:
            prismaLines.append(
                "You are Prisma: a careful assistant focused on relationships and boundaries. Be concise, warm, and practical. You are not a doctor or a lawyer. If there is risk, suggest professional help."
            )
            prismaLines.append("Reply in English.")
        }
        let prismaName = prismaUserProfile.prismaPreferredCallsignForUserInterfaceDisplay
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !prismaName.isEmpty {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Имя/обращение: \(prismaName).")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Name: \(prismaName).")
            }
        }
        let prismaAge = prismaUserProfile.userAgeFreeformInputText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !prismaAge.isEmpty {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Возраст: \(prismaAge).")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Age: \(prismaAge).")
            }
        }
        if prismaUserProfile.userGender != "Не указан" {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Пол: \(prismaUserProfile.userGender).")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Gender: \(prismaUserProfile.userGender).")
            }
        }
        if let prismaMode = prismaUserProfile.globalMode {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append(
                    "Контекст ситуации: \(prismaMode.prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(language))."
                )
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append(
                    "Situation: \(prismaMode.prismaCinematicLatchedNucleiCompactScenarioDescriptorMosaicLabeledCuration(language))."
                )
            }
        }
        prismaLines.append(
            contentsOf: prismaEmpathyCommunicationDirectiveLinesCurationHusk(
                prismaUserProfile.prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection,
                language
            )
        )
        if prismaUserProfile.globalMode == .committedRelationshipCare {
            let prismaDynamicsLabel = prismaUserProfile.dynamicsPresetSelection?.prismaCommittedRelationshipPromptLabel
            let prismaDuration = prismaUserProfile.relationshipDurationFreeformNarrativeText
                .trimmingCharacters(in: .whitespacesAndNewlines)
            let prismaLiving = prismaUserProfile.livingStatus?.prismaCommittedRelationshipPromptLabel
            var prismaContextFragments: [String] = []
            if !prismaDuration.isEmpty {
                prismaContextFragments.append("срок: \(prismaDuration)")
            }
            if let prismaLiving {
                prismaContextFragments.append("быт: \(prismaLiving)")
            }
            if !prismaUserProfile.mutualBondingConnectionDescriptorTags.isEmpty {
                prismaContextFragments.append("узы: \(prismaUserProfile.mutualBondingConnectionDescriptorTags.joined(separator: ", "))")
            }
            if let prismaDynamicsLabel {
                prismaContextFragments.append("динамика: \(prismaDynamicsLabel)")
            }
            if !prismaContextFragments.isEmpty {
                switch language {
                case .russianCurationHuskLatchedMosaicNuclei:
                    prismaLines.append("Жесткий контекст отношений: \(prismaContextFragments.joined(separator: "; ")).")
                case .englishCurationHuskLatchedMosaicNuclei:
                    prismaLines.append("Fixed relationship context: \(prismaContextFragments.joined(separator: "; ")).")
                }
            }
        }
        if prismaUserProfile.globalMode != .separationLettingGo,
           prismaUserProfile.globalMode != .committedRelationshipCare,
           !prismaUserProfile.partnerConflictStyleDescriptorTags.isEmpty {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Конфликты/темы: \(prismaUserProfile.partnerConflictStyleDescriptorTags.joined(separator: ", ")).")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Conflict notes: \(prismaUserProfile.partnerConflictStyleDescriptorTags.joined(separator: ", ")).")
            }
        }
        if !prismaUserProfile.prismaCommittedRelationshipUserConflictPatternDescriptorTags.isEmpty {
            prismaLines.append(
                "user_conflict_pattern: \(prismaUserProfile.prismaCommittedRelationshipUserConflictPatternDescriptorTags.joined(separator: ", "))."
            )
        }
        if !prismaUserProfile.prismaCommittedRelationshipPartnerConflictPatternDescriptorTags.isEmpty {
            prismaLines.append(
                "partner_conflict_pattern: \(prismaUserProfile.prismaCommittedRelationshipPartnerConflictPatternDescriptorTags.joined(separator: ", "))."
            )
        }
        if let prismaCommittedTemperature = prismaUserProfile.prismaCommittedRelationshipCurrentTemperature {
            prismaLines.append("Текущий градус отношений: \(prismaCommittedTemperature.prismaCommittedRelationshipPromptLabel).")
            if let prismaDirective = prismaCommittedTemperature.prismaSystemPromptDirectiveCurationMosaic {
                prismaLines.append(prismaDirective)
            }
        }
        if !prismaUserProfile.prismaPostSeparationUserConflictPatternDescriptorTags.isEmpty {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append("user_conflict_pattern: \(prismaUserProfile.prismaPostSeparationUserConflictPatternDescriptorTags.joined(separator: ", ")).")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append("user_conflict_pattern: \(prismaUserProfile.prismaPostSeparationUserConflictPatternDescriptorTags.joined(separator: ", ")).")
            }
        }
        if !prismaUserProfile.prismaPostSeparationPartnerConflictPatternDescriptorTags.isEmpty {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append("partner_conflict_pattern: \(prismaUserProfile.prismaPostSeparationPartnerConflictPatternDescriptorTags.joined(separator: ", ")).")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append("partner_conflict_pattern: \(prismaUserProfile.prismaPostSeparationPartnerConflictPatternDescriptorTags.joined(separator: ", ")).")
            }
        }
        if let prismaSeparationGoal = prismaUserProfile.prismaPostSeparationSupportGoal {
            prismaLines.append(prismaSeparationGoal.prismaSystemPromptDirectiveCurationMosaic)
        }
        if prismaUserProfile.globalMode != .committedRelationshipCare, !prismaUserProfile.mutualBondingConnectionDescriptorTags.isEmpty {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Связи/темы: \(prismaUserProfile.mutualBondingConnectionDescriptorTags.joined(separator: ", ")).")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Bonds/topics: \(prismaUserProfile.mutualBondingConnectionDescriptorTags.joined(separator: ", ")).")
            }
        }
        let prismaAiNote = prismaUserProfile.prismaAIResponsePersonalizationNoteFreeformText
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !prismaAiNote.isEmpty {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Пожелания к тону ответа: \(prismaAiNote).")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Tone preferences: \(prismaAiNote).")
            }
        }
        let prismaJoinedSystemCurationHuskMosaic = prismaLines.joined(separator: " ")
        if prismaJoinedSystemCurationHuskMosaic.count > 9000 {
            return String(prismaJoinedSystemCurationHuskMosaic.prefix(9000))
        }
        return prismaJoinedSystemCurationHuskMosaic
    }

    private func prismaEmpathyCommunicationDirectiveLinesCurationHusk(
        _ prismaTagCollection: [String],
        _ language: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> [String] {
        guard !prismaTagCollection.isEmpty else {
            return []
        }
        var prismaDirectiveLines: [String] = []
        let prismaTagSet = Set(prismaTagCollection)
        if prismaTagSet.contains("prismaEmpathyConcisePacingADHDConsciousNucleus") {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Стиль ответа: КРАТКО. Максимум 3 коротких пункта или 5 коротких предложений. Не пиши длинные вступления, повторения и полотна текста.")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Response style: CONCISE. Use at most 3 short bullets or 5 short sentences. No long intros, repetition, or walls of text.")
            }
        }
        if prismaTagSet.contains("prismaEmpathyDryFactualRigorOnlyNucleus") {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Стиль ответа: больше фактов, логики и наблюдаемых признаков, меньше абстрактной поддержки.")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Response style: prioritize facts, logic, and observable signals over abstract reassurance.")
            }
        }
        if prismaTagSet.contains("prismaEmpathyMoreEmotionalSupportEmphasisNucleus") {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Стиль ответа: добавляй поддержку, но не растягивай ответ.")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Response style: add emotional support without making the answer long.")
            }
        }
        if prismaTagSet.contains("prismaEmpathyHighVulnerabilityGentleToneNucleus") {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Стиль ответа: мягко, бережно, без давления.")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Response style: gentle, careful, and non-pressuring.")
            }
        }
        if prismaTagSet.contains("prismaEmpathyDirectCriticalTruthSearingNucleus") {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Стиль ответа: прямо и честно, без жесткости ради жесткости.")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaDirectiveLines.append("Response style: direct and honest without being harsh for its own sake.")
            }
        }
        return prismaDirectiveLines
    }

    private static func prismaChronicleLlmNucleusRoutableFailureBannerCurationHuskMosaicExcerpt(
        prismaCinematicLatchedFailurePayload: Error,
        prismaCinematicLatchedUserInterfaceLanguageStem: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        let prismaBaseMosaicCurationHusk = PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
            .chatLlmGatewayDispatchFailureBanner
            .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(prismaCinematicLatchedUserInterfaceLanguageStem)
        if let prismaUrlLayerNucleusMosaic = prismaCinematicLatchedFailurePayload as? PrismaOpenAIGatewayLlmChamberMosaicURLError,
           let prismaExtractedMosaicCurationHusk = prismaCurationMosaicExtractJsonNarrativeMessageCurationHuskFromLlmRoutableDataPayload(
            prismaUrlLayerNucleusMosaic.prismaRoutableMosaicDataPayload
           ) {
            return "\(prismaBaseMosaicCurationHusk)\n\(String(prismaExtractedMosaicCurationHusk.prefix(360)))"
        }
        return prismaBaseMosaicCurationHusk
    }

    private static func prismaCurationMosaicExtractJsonNarrativeMessageCurationHuskFromLlmRoutableDataPayload(
        _ prismaRoutableMosaicDataPayload: Data
    ) -> String? {
        guard !prismaRoutableMosaicDataPayload.isEmpty else { return nil }
        if let prismaJsonRootCurationHusk = try? JSONSerialization.jsonObject(with: prismaRoutableMosaicDataPayload) as? [String: Any] {
            if let prismaNestedCurationHuskMosaic = prismaJsonRootCurationHusk["error"] as? [String: Any],
               let prismaMessageCurationHuskMosaic = prismaNestedCurationHuskMosaic["message"] as? String,
               !prismaMessageCurationHuskMosaic.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return prismaMessageCurationHuskMosaic
            }
            if let prismaMessageCurationHuskMosaic = prismaJsonRootCurationHusk["message"] as? String,
               !prismaMessageCurationHuskMosaic.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return prismaMessageCurationHuskMosaic
            }
        }
        if let prismaRawUtf8CurationHuskMosaic = String(
            data: prismaRoutableMosaicDataPayload,
            encoding: .utf8
        ),
            prismaRawUtf8CurationHuskMosaic.count < 900,
            !prismaRawUtf8CurationHuskMosaic.contains("<html") {
            return prismaRawUtf8CurationHuskMosaic.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return nil
    }
}

private extension PrismaSeparationSupportGoal {
    var prismaSystemPromptDirectiveCurationMosaic: String {
        switch self {
        case .letGoAndForget:
            return "Твоя задача помочь юзеру сепарироваться. Не предлагай написать бывшему. Фокусируй внимание на будущем юзера."
        case .understandMistakes:
            return "Твоя задача помочь юзеру спокойно разобрать ошибки и понять, что пошло не так в отношениях, без самобичевания и обвинений."
        case .ventAndBeHeard:
            return "Твоя задача — максимальная эмпатия. Используй поддерживающие фразы. Пока не давай советов, просто слушай и валидируй чувства."
        case .tryToReconnect:
            return "Оценивай ситуацию объективно. Подскажи, уместен ли сейчас контакт. Если да, помоги составить экологичное сообщение без давления."
        }
    }
}

private extension PrismaOnboardingDynamicsPresetSelection {
    var prismaCommittedRelationshipPromptLabel: String {
        switch self {
        case .equalPartnershipBalance:
            return "Партнерство на равных"
        case .patriarchalStructureAxis:
            return "Один чаще ведет"
        case .userInitiativeLead:
            return "Я чаще беру инициативу"
        case .partnerDecisionLead:
            return "Партнер чаще все решает"
        case .relationalAmbiguityUnclearDynamicsNucleus:
            return "Сложно или непонятно"
        case .userDefinedFreeformNarrative:
            return "Пользователь описал динамику своими словами"
        }
    }
}

private extension LivingStatus {
    var prismaCommittedRelationshipPromptLabel: String {
        switch self {
        case .sharedHouseholdTogether:
            return "живут вместе"
        case .separateHouseholdsNearby:
            return "живут отдельно"
        case .longDistanceRhythm:
            return "отношения на расстоянии"
        }
    }
}

private extension PrismaCommittedRelationshipCurrentTemperature {
    var prismaCommittedRelationshipPromptLabel: String {
        switch self {
        case .acuteFight:
            return "Острая ссора"
        case .coolingDistance:
            return "Охлаждение"
        case .continuationDoubts:
            return "Сомнения"
        case .steadyGrowth:
            return "Все ровно, хочу лучше"
        }
    }

    var prismaSystemPromptDirectiveCurationMosaic: String? {
        switch self {
        case .acuteFight:
            return "Твоя цель сейчас — снизить градус эмоций. Не ищи глубинных травм, помоги решить локальный конфликт и подскажи, как экологично помириться."
        case .coolingDistance:
            return nil
        case .continuationDoubts:
            return "Пользователь на грани расставания. Будь максимально объективен. Помоги взвесить плюсы и минусы (техника квадрат Декарта). Не принимай решение за него."
        case .steadyGrowth:
            return "Действуй как коуч по отношениям. Предлагай форматы свиданий, языки любви, глубокие вопросы для сближения."
        }
    }
}
