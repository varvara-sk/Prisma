import Foundation

struct MoodData: Identifiable, Hashable, Sendable {
    let id: UUID
    let weekdayOrdinalLabel: String
    let anxietyIntensityLevelOneThroughTen: Int

    init(
        id: UUID = UUID(),
        weekdayOrdinalLabel: String,
        anxietyIntensityLevelOneThroughTen: Int
    ) {
        self.id = id
        self.weekdayOrdinalLabel = weekdayOrdinalLabel
        self.anxietyIntensityLevelOneThroughTen = anxietyIntensityLevelOneThroughTen
    }
}

struct InsightData: Hashable, Sendable {
    let sessionSituationAwarenessNucleusLine: String
    let relationalSynchronyStrengthHighlightDescriptorTags: [String]
    let relationalTensionAmplificationDescriptorTags: [String]
    let counterpartBehavioralFrictionDescriptorTags: [String]
    let contactDriftObservationBulletFragments: [String]
    let optionalGentleExperimentIdeaFragments: [String]
}

struct PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor: Hashable, Sendable {
    let prismaEmbeddedInsightDataSnapshot: InsightData
    let prismaPairDynamicsSectionLocalizedTitle: String
    let prismaPairDynamicsNarrativeBodyLine: String
}

enum PrismaDashboardMockSamplePayloadFactory {
    static func prismaAnalyticalPayloadBundleForDashboardAnalyticalContextFacetIsolationEnvelopeDescriptor(
        _ prismaIncomingAnalyticalFacetDescriptor: PrismaDashboardSelectedAnalyticalContextFacetIdentifierEnumeration,
        prismaHydratedFallbackActiveUserProfileSnapshotStem: UserProfile
    ) -> PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor {
        switch prismaIncomingAnalyticalFacetDescriptor {
        case .activePrimaryUserProfileContextFacet:
            let prismaModeFacet = prismaHydratedFallbackActiveUserProfileSnapshotStem.globalMode
            let prismaStemBundle = prismaAnalyticalPayloadBundleForGlobalModeFacet(prismaModeFacet)
            return prismaApplyActivePrimaryUserProfileScenarioIsolationQualifierEnvelopeMutation(
                prismaStemBundle,
                prismaHydratedFallbackActiveUserProfileSnapshotStem: prismaHydratedFallbackActiveUserProfileSnapshotStem
            )
        case .archivedLedgerEmbeddedSnapshotContextFacet(let prismaArchivedLedgerEmbeddedIsolationPayload):
            let prismaModeFacet = prismaArchivedLedgerEmbeddedIsolationPayload.prismaEmbeddedUserProfileSnapshot.globalMode
            let prismaStemBundle = prismaAnalyticalPayloadBundleForGlobalModeFacet(prismaModeFacet)
            return prismaApplyArchivedLedgerEntryStoredScenarioIsolationQualifierEnvelopeMutation(
                prismaStemBundle,
                prismaArchivedLedgerEmbeddedIsolationPayload: prismaArchivedLedgerEmbeddedIsolationPayload
            )
        }
    }

    private static func prismaApplyActivePrimaryUserProfileScenarioIsolationQualifierEnvelopeMutation(
        _ prismaStemBundle: PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor,
        prismaHydratedFallbackActiveUserProfileSnapshotStem: UserProfile
    ) -> PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor {
        guard let prismaActiveScenarioModeFacet = prismaHydratedFallbackActiveUserProfileSnapshotStem.globalMode else {
            return prismaStemBundle
        }
        let prismaEmbedded = prismaStemBundle.prismaEmbeddedInsightDataSnapshot
        let prismaScenarioDescriptorLabelFragment = prismaActiveScenarioModeFacet.prismaCompactRussianScenarioDescriptorLabel
        let prismaAugmentedNucleusLine = prismaEmbedded.sessionSituationAwarenessNucleusLine
            + " Разбор привязан к активной ситуации «\(prismaScenarioDescriptorLabelFragment)»; другие сохранённые линии сюда не подмешиваются."
        let prismaAugmentedInsight = InsightData(
            sessionSituationAwarenessNucleusLine: prismaAugmentedNucleusLine,
            relationalSynchronyStrengthHighlightDescriptorTags: prismaEmbedded.relationalSynchronyStrengthHighlightDescriptorTags,
            relationalTensionAmplificationDescriptorTags: prismaEmbedded.relationalTensionAmplificationDescriptorTags,
            counterpartBehavioralFrictionDescriptorTags: prismaEmbedded.counterpartBehavioralFrictionDescriptorTags,
            contactDriftObservationBulletFragments: prismaEmbedded.contactDriftObservationBulletFragments,
            optionalGentleExperimentIdeaFragments: prismaEmbedded.optionalGentleExperimentIdeaFragments
        )
        return PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor(
            prismaEmbeddedInsightDataSnapshot: prismaAugmentedInsight,
            prismaPairDynamicsSectionLocalizedTitle: prismaStemBundle.prismaPairDynamicsSectionLocalizedTitle,
            prismaPairDynamicsNarrativeBodyLine: prismaStemBundle.prismaPairDynamicsNarrativeBodyLine
        )
    }

    private static func prismaApplyArchivedLedgerEntryStoredScenarioIsolationQualifierEnvelopeMutation(
        _ prismaStemBundle: PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor,
        prismaArchivedLedgerEmbeddedIsolationPayload: PrismaArchivedUserScenarioLedgerEntry
    ) -> PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor {
        let prismaIsolationJitterOrdinal = abs(prismaArchivedLedgerEmbeddedIsolationPayload.id.hashValue % 7)
        let prismaShortLedgerIsolationFingerprint = String(prismaArchivedLedgerEmbeddedIsolationPayload.id.uuidString.prefix(8))
        let prismaLedgerTemporalStampLine = prismaArchivedLedgerEmbeddedIsolationPayload.prismaScenarioCapturedTimestamp.formatted(
            date: .abbreviated,
            time: .omitted
        )
        let prismaEmbedded = prismaStemBundle.prismaEmbeddedInsightDataSnapshot
        let prismaAugmentedNucleusLine = prismaEmbedded.sessionSituationAwarenessNucleusLine
            + " Отдельный срез по сохранённой записи от \(prismaLedgerTemporalStampLine), метка \(prismaShortLedgerIsolationFingerprint). Другие разборы в эту карточку не попадают."
        let prismaAugmentedInsight = InsightData(
            sessionSituationAwarenessNucleusLine: prismaAugmentedNucleusLine,
            relationalSynchronyStrengthHighlightDescriptorTags: prismaRotateStringCollectionVariantOrdinalStem(
                prismaEmbedded.relationalSynchronyStrengthHighlightDescriptorTags,
                prismaIsolationJitterOrdinal
            ),
            relationalTensionAmplificationDescriptorTags: prismaRotateStringCollectionVariantOrdinalStem(
                prismaEmbedded.relationalTensionAmplificationDescriptorTags,
                prismaIsolationJitterOrdinal + 2
            ),
            counterpartBehavioralFrictionDescriptorTags: prismaRotateStringCollectionVariantOrdinalStem(
                prismaEmbedded.counterpartBehavioralFrictionDescriptorTags,
                prismaIsolationJitterOrdinal + 3
            ),
            contactDriftObservationBulletFragments: prismaRotateStringCollectionVariantOrdinalStem(
                prismaEmbedded.contactDriftObservationBulletFragments,
                prismaIsolationJitterOrdinal + 4
            ),
            optionalGentleExperimentIdeaFragments: prismaRotateStringCollectionVariantOrdinalStem(
                prismaEmbedded.optionalGentleExperimentIdeaFragments,
                prismaIsolationJitterOrdinal + 5
            )
        )
        let prismaAugmentedPairTitle = prismaStemBundle.prismaPairDynamicsSectionLocalizedTitle
            + " · \(prismaShortLedgerIsolationFingerprint)"
        return PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor(
            prismaEmbeddedInsightDataSnapshot: prismaAugmentedInsight,
            prismaPairDynamicsSectionLocalizedTitle: prismaAugmentedPairTitle,
            prismaPairDynamicsNarrativeBodyLine: prismaStemBundle.prismaPairDynamicsNarrativeBodyLine
        )
    }

    private static func prismaRotateStringCollectionVariantOrdinalStem(_ prismaIncomingStringRows: [String], _ prismaRotationStrideOrdinal: Int) -> [String] {
        guard prismaIncomingStringRows.count > 1 else {
            return prismaIncomingStringRows
        }
        let prismaNormalizedStride = abs(prismaRotationStrideOrdinal) % prismaIncomingStringRows.count
        if prismaNormalizedStride == 0 {
            return prismaIncomingStringRows
        }
        return Array(
            prismaIncomingStringRows[prismaNormalizedStride...]
                + prismaIncomingStringRows[..<prismaNormalizedStride]
        )
    }

    static let prismaWeekdayAnxietyTrendPreviewSeries: [MoodData] = [
        MoodData(weekdayOrdinalLabel: "Пн", anxietyIntensityLevelOneThroughTen: 4),
        MoodData(weekdayOrdinalLabel: "Вт", anxietyIntensityLevelOneThroughTen: 5),
        MoodData(weekdayOrdinalLabel: "Ср", anxietyIntensityLevelOneThroughTen: 3),
        MoodData(weekdayOrdinalLabel: "Чт", anxietyIntensityLevelOneThroughTen: 6),
        MoodData(weekdayOrdinalLabel: "Пт", anxietyIntensityLevelOneThroughTen: 7),
        MoodData(weekdayOrdinalLabel: "Сб", anxietyIntensityLevelOneThroughTen: 8),
        MoodData(weekdayOrdinalLabel: "Вс", anxietyIntensityLevelOneThroughTen: 6),
    ]

    static func prismaAnalyticalPayloadBundleForGlobalModeFacet(
        _ prismaTargetGlobalModeFacet: GlobalMode?
    ) -> PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor {
        switch prismaTargetGlobalModeFacet {
        case .committedRelationshipCare:
            return PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor(
                prismaEmbeddedInsightDataSnapshot: InsightData(
                    sessionSituationAwarenessNucleusLine: "Несколько дней вы реже касаетесь друг друга темами, которые важны обоим — без резких формулировок, скорее через усталость и осторожность.",
                    relationalSynchronyStrengthHighlightDescriptorTags: [
                        "Вы оба цените стабильность",
                        "Есть привычка договариваться, когда спокойнее",
                    ],
                    relationalTensionAmplificationDescriptorTags: [
                        "Страх быть непонятым",
                        "Усталость от недосказанности",
                    ],
                    counterpartBehavioralFrictionDescriptorTags: [
                        "Короткие ответы в вечернее время",
                        "Реже инициирует нежные жесты",
                    ],
                    contactDriftObservationBulletFragments: [
                        "Фокус сместился с «мы» на бытовые задачи.",
                        "Юмор и лёгкость появляются реже, чем раньше.",
                    ],
                    optionalGentleExperimentIdeaFragments: [
                        "Одна честная фраза о том, чего вам не хватает, без претензий к характеру.",
                        "Короткая пауза перед ответом, если тема щекочет.",
                    ]
                ),
                prismaPairDynamicsSectionLocalizedTitle: "Как вы здесь сходились",
                prismaPairDynamicsNarrativeBodyLine: "У вас чаще включается осторожность, у партнёра — сжатие в быту. Это не приговор: это разные темпы, которые можно снова согласовать."
            )
        case .separationLettingGo:
            return PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor(
                prismaEmbeddedInsightDataSnapshot: InsightData(
                    sessionSituationAwarenessNucleusLine: "Вы держите дистанцию там, где раньше было тепло — это может быть и защитой, и тоской, иногда в одном дне.",
                    relationalSynchronyStrengthHighlightDescriptorTags: [
                        "Вы честно замечаете свои границы",
                        "Есть забота о себе, даже если грустно",
                    ],
                    relationalTensionAmplificationDescriptorTags: [
                        "Возврат к старым разговорам в голове",
                        "Стыд за «слабость»",
                    ],
                    counterpartBehavioralFrictionDescriptorTags: [
                        "Смешанные сигналы в переписке",
                        "Редкие ответы без ясности",
                    ],
                    contactDriftObservationBulletFragments: [
                        "Смысл часто теряется между «надо отпустить» и «ещё раз проверить».",
                        "Тон сообщений может быть ровным снаружи и тяжёлым внутри.",
                    ],
                    optionalGentleExperimentIdeaFragments: [
                        "Записать одну строку о том, что вы уже сделали для себя.",
                        "Не отвечать сразу, если сообщение будит старую боль — можно отложить ответ.",
                    ]
                ),
                prismaPairDynamicsSectionLocalizedTitle: "Как сейчас сходится контакт",
                prismaPairDynamicsNarrativeBodyLine: "Вы чаще ищете опору в себе, другой человек — в дистанции. Разница темпов не делает кого-то «плохим» — это разные способы пережить разрыв."
            )
        case .datingDiscovery:
            return PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor(
                prismaEmbeddedInsightDataSnapshot: InsightData(
                    sessionSituationAwarenessNucleusLine: "Вы сравниваете ожидание и реальность свиданий — интерес есть, а ясности «надолго ли» пока мало; это нормальный этап знакомства, не «провал».",
                    relationalSynchronyStrengthHighlightDescriptorTags: [
                        "Вы умеете замечать совпадения по ценностям",
                        "Есть любопытство без немедленной оценки",
                        "Вам важна честность — вы готовы говорить прямее, когда спокойнее",
                    ],
                    relationalTensionAmplificationDescriptorTags: [
                        "Страх «потерять вариант»",
                        "Усталость от поверхностных диалогов",
                    ],
                    counterpartBehavioralFrictionDescriptorTags: [
                        "Неровный темп сообщений",
                        "Обещания «на потом» без конкретики",
                    ],
                    contactDriftObservationBulletFragments: [
                        "Шутки и лёгкость иногда прикрывают вопрос «куда это идёт».",
                        "Тема близости может обходиться стороной дольше, чем вам комфортно.",
                    ],
                    optionalGentleExperimentIdeaFragments: [
                        "Одно спокойное уточнение о том, что вы ищете, без давления на ответ.",
                        "Можно обозначить комфортный темп переписки словами, а не намёками.",
                    ]
                ),
                prismaPairDynamicsSectionLocalizedTitle: "Как складывается ритм",
                prismaPairDynamicsNarrativeBodyLine: "Вы быстрее включаете смысл и образ будущего, собеседник — в моменте. Разница не обязана стать конфликтом, если её можно озвучить мягко."
            )
        case .communicationFriendshipAndPeers:
            return PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor(
                prismaEmbeddedInsightDataSnapshot: InsightData(
                    sessionSituationAwarenessNucleusLine: "В общении с близким человеком или коллегой вы ловите напряжение там, где раньше было проще — роли и ожидания чуть разъехались.",
                    relationalSynchronyStrengthHighlightDescriptorTags: [
                        "Вы помните общие цели",
                        "Есть опыт нормально проходить споры",
                    ],
                    relationalTensionAmplificationDescriptorTags: [
                        "Ощущение несправедливости",
                        "Усталость от «надо»",
                    ],
                    counterpartBehavioralFrictionDescriptorTags: [
                        "Резковатый тон в спешке",
                        "Реже уточняет, что имел в виду",
                    ],
                    contactDriftObservationBulletFragments: [
                        "Темы уходят в быт или задачи, эмоции остаются за скобками.",
                        "Юмор иногда звучит как защита, а не как сближение.",
                    ],
                    optionalGentleExperimentIdeaFragments: [
                        "Одна фраза о том, что вам важно в тоне, не в оценке личности.",
                        "Можно назвать своё состояние одним словом перед тем, как обсуждать факты.",
                    ]
                ),
                prismaPairDynamicsSectionLocalizedTitle: "Как устроен контакт здесь",
                prismaPairDynamicsNarrativeBodyLine: "Вы чаще держите ясность формулировок, другой человек — скорость или краткость. Это разные стили, их можно свести без обесценивания."
            )
        case .none:
            return PrismaDashboardPerContextAnalyticalPayloadBundleDescriptor(
                prismaEmbeddedInsightDataSnapshot: InsightData(
                    sessionSituationAwarenessNucleusLine: "Когда выберете ситуацию в онбординге, здесь появится срез по последней сессии — без смешивания разных историй в одну кучу.",
                    relationalSynchronyStrengthHighlightDescriptorTags: [
                        "Место для того, что у вас получается",
                    ],
                    relationalTensionAmplificationDescriptorTags: [],
                    counterpartBehavioralFrictionDescriptorTags: [],
                    contactDriftObservationBulletFragments: [],
                    optionalGentleExperimentIdeaFragments: []
                ),
                prismaPairDynamicsSectionLocalizedTitle: "Паттерн взаимодействия",
                prismaPairDynamicsNarrativeBodyLine: "Пока нет выбранной ситуации, мы не смешиваем разные роли и отношения в одну аналитику — так спокойнее читать."
            )
        }
    }

    static var prismaSessionInsightPreviewSnapshot: InsightData {
        prismaAnalyticalPayloadBundleForGlobalModeFacet(.committedRelationshipCare).prismaEmbeddedInsightDataSnapshot
    }

    static var prismaPairDynamicsCompatibilityNarrativeLine: String {
        prismaAnalyticalPayloadBundleForGlobalModeFacet(.committedRelationshipCare).prismaPairDynamicsNarrativeBodyLine
    }
}
