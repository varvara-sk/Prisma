import Foundation

@MainActor
final class PrismaPrimaryChatLlmGatewayCurationMosaicViewModel: ObservableObject {
    @Published var prismaPrimaryChatChronicleOrderedLineCollection: [PrismaPrimaryChatConversationChronicleNucleusPersistedLineFragment] = []
    @Published var prismaPrimaryChatOutboundUserDraftTextualPayload: String = ""
    @Published var prismaPrimaryChatAssistantNarrativeResponseInFlightFlag: Bool = false
    @Published var prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText: String?
    @Published private(set) var prismaCinematicActiveUserInterfaceLanguagePreferenceStem: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration =
        .russianCurationHuskLatchedMosaicNuclei

    private let prismaUserProfileEphemeralStorageStem = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
    private var prismaLlmGatewayMosaicTransportChamber: PrismaOpenAIGatewayLlmMosaicTransportChamberCuration?
    private let prismaPrimaryChatChroniclePayloadCapForLlmGatewayDispatch: Int = 48

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
        guard let prismaTransport = prismaLlmGatewayMosaicTransportChamber else {
            prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText = PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                .chatLlmGatewayDispatchFailureBanner
                .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(prismaCinematicActiveUserInterfaceLanguagePreferenceStem)
            return
        }
        prismaPrimaryChatLlmGatewayDispatchFailureUserVisibleBannerText = nil
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
            prismaOpenAIChronicleMessageCurationHusk: prismaGatewayFragments
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
        if let prismaRel = PrismaUserProfileRelationshipStatusFacetEnumeration(
            rawValue: prismaUserProfile.prismaUserProfileRelationshipStatusFacetSerializedRawValue
        ) {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append(
                    "Статус: \(prismaRel.prismaCinematicLatchedNucleiCompactProfilePickerTitleForApplicationInterfaceLanguage(language))."
                )
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append(
                    "Relationship status: \(prismaRel.prismaCinematicLatchedNucleiCompactProfilePickerTitleForApplicationInterfaceLanguage(language))."
                )
            }
        }
        if !prismaUserProfile.prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection.isEmpty {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append(
                    "Теги эмпатии: \(prismaUserProfile.prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection.joined(separator: ", "))."
                )
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append(
                    "Empathy tags: \(prismaUserProfile.prismaEmpathyCommunicationPreferenceTagSerializedKeyCollection.joined(separator: ", "))."
                )
            }
        }
        if !prismaUserProfile.partnerConflictStyleDescriptorTags.isEmpty {
            switch language {
            case .russianCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Конфликты/темы: \(prismaUserProfile.partnerConflictStyleDescriptorTags.joined(separator: ", ")).")
            case .englishCurationHuskLatchedMosaicNuclei:
                prismaLines.append("Conflict notes: \(prismaUserProfile.partnerConflictStyleDescriptorTags.joined(separator: ", ")).")
            }
        }
        if !prismaUserProfile.mutualBondingConnectionDescriptorTags.isEmpty {
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
