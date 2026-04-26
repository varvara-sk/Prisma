import Foundation

enum PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber: String, CaseIterable, Sendable {
    case applicationTabChat
    case applicationTabAnalyzer
    case applicationTabDashboard
    case applicationTabProfile
    case chatScreenTitle
    case chatContextNote
    case chatLlmGatewayDispatchFailureBanner
    case chatMessageDraftPlaceholder
    case chatPrimarySendActionLabel
    case analyzerScreenTitle
    case analyzerScreenBody
    case dashboardYourInsights
    case dashboardActionDelete
    case dashboardAddNewSituation
    case dashboardChartAxisAnxiety
    case dashboardChartAxisDay
    case dashboardEmptyInsightsPlaceholderBody
    case dashboardIdentityAgeNarrativePrefix
    case dashboardIdentityGenderFemaleNarrative
    case dashboardIdentityGenderMaleNarrative
    case dashboardIdentityGenderOtherNarrative
    case dashboardIdentityRibbonEmpty
    case dashboardSituationTypeFallback
    case dashboardSituationHistory
    case dashboardSwipeToDelete
    case dashboardDevData
    case dashboardContextTitle
    case dashboardContextBody
    case dashboardMoodAnxiety
    case dashboardMoodLast7Days
    case dashboardStartAnalysisEmpty
    case dashboardAboutYou
    case dashboardSessionMain
    case dashboardSessionEssence
    case dashboardSessionAnchors
    case dashboardSessionTriggers
    case dashboardSessionTry
    case dashboardNowPrefix
    case dashboardSaved
    case dashboardSituationPillPrefix
    case relationshipOnboardingBack
    case relationshipOnboardingSkip
    case relationshipOnboardingNext
    case relationshipOnboardingStartAnalysis
    case relationshipOnboardingStartAnalysisWithSparkle
    case relationshipOnboardingStartAnalysisEnglish
    case relationshipOnboardingProgressA11y
    case relationshipOnboardingProgressOf
    case globalModeStageTitle
    case profileScreenTitle
    case profileAboutMe
    case profileName
    case profileNamePlaceholder
    case profileAge
    case profileGender
    case profileGenderPillGlyphMale
    case profileGenderPillGlyphFemale
    case profileGenderPillGlyphOther
    case profileGenderNote
    case profileStatusAndIdentity
    case profileCurrentStatus
    case profileAttachmentType
    case profileEmpathyTitle
    case profileEmpathyQuestion
    case profileEmpathySub
    case profileAdditionalWishes
    case profileAdditionalWishesSub
    case profileSettingsTitle
    case profileAppearance
    case profileThemeSegment
    case profileThemeDark
    case profileThemeLight
    case profileLanguage
    case profileData
    case profileClearChatHistory
    case profilePrivacySafety
    case profileSafetySheetTitle
    case profileLogOut
    case profileClearChatsDialogTitle
    case profileLogOutDialogTitle
    case profileActionClear
    case profileActionCancel
    case profileActionLogOut
    case safetyDisclosure1
    case safetyDisclosure2
    case safetyDisclosure3
    case doneKeyboard
    case onbGenderAgeTitle
    case onbGenderAgeSub
    case onbSharedDone
    case committedDynamicsTitle
    case committedGlobalNote
    case committedFromProfileNote
    case committedAgeGenderSection
    case committedAgeLabel
    case committedExperienceTitle
    case partnerConflictTitle
    case partnerConflictSub
    case datingWhatMatters
    case datingSubNote
    case redFlagsHeader
    case redFlagsOther
    case friendshipRoleTitle
    case friendshipRoleSub
    case friendshipCommDifficultiesTitle
    case friendshipCommDifficultiesSub
    case friendshipOtherOptionalTitle
    case friendshipOtherOptionalSub
    case durationLogisticsHeader
    case relDuration
    case livingFormat
    case sharedTies
    case separationTellStory
    case separationWhoInit
    case separationWhen
    case separationContactNow
    case separationPartnerConflict
    case separationPickPatterns
    func prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(
        _ userInterfaceActiveLanguage: PrismaApplicationUserInterfaceLanguagePreferenceEnumeration
    ) -> String {
        switch userInterfaceActiveLanguage {
        case .russianCurationHuskLatchedMosaicNuclei:
            return prismaCinematicLatchedNucleiRussianMonolingualCurationLabeledMosaic()
        case .englishCurationHuskLatchedMosaicNuclei:
            return prismaCinematicLatchedNucleiEnglishMonolingualCurationLabeledMosaic()
        }
    }

    private func prismaCinematicLatchedNucleiRussianMonolingualCurationLabeledMosaic() -> String {
        switch self {
        case .analyzerScreenTitle:
            return "Анализатор"
        case .analyzerScreenBody:
            return "Здесь будет разбор текста: тон, повторяющиеся темы, формулировки — отдельно от чата и дашборда по ситуации."
        case .applicationTabAnalyzer:
            return "Анализатор"
        case .applicationTabChat:
            return "Чат"
        case .applicationTabDashboard:
            return "Дашборд"
        case .applicationTabProfile:
            return "Профиль"
        case .chatContextNote:
            return "Контекст для ответов задаётся в профиле — здесь только диалог."
        case .chatLlmGatewayDispatchFailureBanner:
            return "Не удалось получить ответ. Проверьте сеть или подождите и попробуйте снова."
        case .chatMessageDraftPlaceholder:
            return "Сообщение…"
        case .chatPrimarySendActionLabel:
            return "Отправить"
        case .chatScreenTitle:
            return "Чат"
        case .committedAgeGenderSection:
            return "О вас"
        case .committedAgeLabel:
            return "Возраст"
        case .committedDynamicsTitle:
            return "Динамика в паре"
        case .committedExperienceTitle:
            return "Как вы переживаете эту связь?"
        case .committedFromProfileNote:
            return ""
        case .committedGlobalNote:
            return "Выберите описание, которое ближе всего к вашей динамике."
        case .dashboardAboutYou:
            return "Про вас"
        case .dashboardActionDelete:
            return "Удалить"
        case .dashboardAddNewSituation:
            return "➕ Добавить новую ситуацию"
        case .dashboardChartAxisAnxiety:
            return "Тревога"
        case .dashboardChartAxisDay:
            return "День"
        case .dashboardEmptyInsightsPlaceholderBody:
            return "После первого разбора здесь появятся динамика тревоги, главные инсайты сессии и план действий. Начните с чата — опишите ситуацию своими словами."
        case .dashboardIdentityAgeNarrativePrefix:
            return "возраст "
        case .dashboardIdentityGenderFemaleNarrative:
            return "женский"
        case .dashboardIdentityGenderMaleNarrative:
            return "мужской"
        case .dashboardIdentityGenderOtherNarrative:
            return "другое"
        case .dashboardIdentityRibbonEmpty:
            return "Коротко о вас появится из профиля — это не привязано к выбранной ситуации ниже."
        case .dashboardSituationTypeFallback:
            return "Ситуация"
        case .dashboardContextBody:
            return "Сначала выберите ситуацию — инсайты ниже не смешивают разные истории в одну."
        case .dashboardContextTitle:
            return "О чём смотрим"
        case .dashboardDevData:
            return "Dev: данные"
        case .dashboardMoodAnxiety:
            return "Уровень тревоги"
        case .dashboardMoodLast7Days:
            return "За последние 7 дней"
        case .dashboardNowPrefix:
            return "Сейчас"
        case .dashboardSaved:
            return "Сохранено"
        case .dashboardSessionAnchors:
            return "Точки опоры"
        case .dashboardSessionEssence:
            return "Суть"
        case .dashboardSessionMain:
            return "Главное по сессии"
        case .dashboardSessionTriggers:
            return "Триггеры"
        case .dashboardSessionTry:
            return "Что попробовать"
        case .dashboardSituationHistory:
            return "История ситуаций"
        case .dashboardSituationPillPrefix:
            return "Ситуация: "
        case .dashboardStartAnalysisEmpty:
            return "Начать разбор"
        case .dashboardSwipeToDelete:
            return "Смахните влево, чтобы удалить запись."
        case .dashboardYourInsights:
            return "Твои инсайты"
        case .datingSubNote:
            return "Ровно 3 приоритета."
        case .datingWhatMatters:
            return "Что важно в партнёре?"
        case .doneKeyboard:
            return "Готово"
        case .durationLogisticsHeader:
            return "Срок, быт и узы"
        case .friendshipCommDifficultiesSub:
            return "Сложности в общении"
        case .friendshipCommDifficultiesTitle:
            return "Какие сложности в общении?"
        case .friendshipOtherOptionalSub:
            return "Свой вариант"
        case .friendshipOtherOptionalTitle:
            return "Свой вариант (необязательно)"
        case .friendshipRoleSub:
            return "Роль в общении"
        case .friendshipRoleTitle:
            return "Кем вам приходится этот человек?"
        case .globalModeStageTitle:
            return "Что вас волнует?"
        case .livingFormat:
            return "Формат"
        case .onbGenderAgeSub:
            return ""
        case .onbGenderAgeTitle:
            return "Расскажи немного о вас"
        case .onbSharedDone:
            return "Готово"
        case .partnerConflictSub:
            return "Отметьте шаблоны, которые вам близки."
        case .partnerConflictTitle:
            return "Партнёр в конфликте"
        case .profileAboutMe:
            return "Обо мне"
        case .profileActionCancel:
            return "Отмена"
        case .profileActionClear:
            return "Очистить"
        case .profileActionLogOut:
            return "Выйти"
        case .profileAdditionalWishes:
            return "Дополнительные пожелания (опционально)"
        case .profileAdditionalWishesSub:
            return "Уточнения, если тегов мало"
        case .profileAge:
            return "Возраст"
        case .profileAppearance:
            return "Внешний вид"
        case .profileAttachmentType:
            return "Тип привязанности"
        case .profileClearChatHistory:
            return "Очистить историю чатов"
        case .profileClearChatsDialogTitle:
            return "Очистить локальную историю сообщений в этом приложении? Это действие нельзя отменить."
        case .profileCurrentStatus:
            return "Сейчас я"
        case .profileData:
            return "Управление данными"
        case .profileEmpathyQuestion:
            return "Как ИИ должен со мной общаться?"
        case .profileEmpathySub:
            return "Выбери то, что тебе подходит."
        case .profileEmpathyTitle:
            return "Настройки эмпатии ИИ"
        case .profileGender:
            return "Пол"
        case .profileGenderNote:
            return "Для контекста тона и соцпаттернов; данные остаются на устройстве и управляются вами."
        case .profileGenderPillGlyphFemale:
            return "Ж"
        case .profileGenderPillGlyphMale:
            return "М"
        case .profileGenderPillGlyphOther:
            return "Другой"
        case .profileLanguage:
            return "Язык"
        case .profileLogOut:
            return "Выйти из аккаунта"
        case .profileLogOutDialogTitle:
            return "Выйти и удалить данные с этого устройства? Потребуется снова пройти вход в приложение."
        case .profileName:
            return "Имя"
        case .profileNamePlaceholder:
            return "Как к вам обращаться"
        case .profilePrivacySafety:
            return "Безопасность и политика конфиденциальности"
        case .profileSafetySheetTitle:
            return "Безопасность"
        case .profileScreenTitle:
            return "Профиль"
        case .profileSettingsTitle:
            return "Настройки приложения"
        case .profileStatusAndIdentity:
            return "Мой статус и личность"
        case .profileThemeDark:
            return "🌙 Темная"
        case .profileThemeLight:
            return "☀️ Светлая"
        case .profileThemeSegment:
            return "Тема"
        case .redFlagsHeader:
            return "Красные флаги в партнёре"
        case .redFlagsOther:
            return "Свой вариант (необязательно)"
        case .relDuration:
            return "Сколько вместе"
        case .relationshipOnboardingBack:
            return "Назад"
        case .relationshipOnboardingNext:
            return "Далее"
        case .relationshipOnboardingProgressA11y:
            return "Прогресс"
        case .relationshipOnboardingProgressOf:
            return "из"
        case .relationshipOnboardingSkip:
            return "Пропустить"
        case .relationshipOnboardingStartAnalysis:
            return "Начать анализ"
        case .relationshipOnboardingStartAnalysisEnglish:
            return "Start Analysis"
        case .relationshipOnboardingStartAnalysisWithSparkle:
            return "✨ Начать анализ"
        case .safetyDisclosure1:
            return "Prisma — это не психотерапия и не медицинская помощь. Приложение даёт размышления и формулировки, но не ставит диагнозов и не заменяет специалиста."
        case .safetyDisclosure2:
            return "Если есть угроза жизни или здоровью — звоните 112. При остром кризисе обратитесь к близким или в службы экстренной помощи в вашем регионе."
        case .safetyDisclosure3:
            return "Вы сами решаете, чем делиться в чате. Не передавайте чужие личные данные без согласия."
        case .separationContactNow:
            return "Вы сейчас общаетесь?"
        case .separationPartnerConflict:
            return "Поведение в конфликтах"
        case .separationPickPatterns:
            return "Выберите 1–2 ключевых паттерна. Это поможет нам понять динамику."
        case .separationTellStory:
            return "Что произошло"
        case .separationWhen:
            return "Как давно это случилось?"
        case .separationWhoInit:
            return "Кто стал инициатором?"
        case .sharedTies:
            return "Совместные узы (по желанию)"
        }
    }

    private func prismaCinematicLatchedNucleiEnglishMonolingualCurationLabeledMosaic() -> String {
        switch self {
        case .analyzerScreenTitle:
            return "Analyzer"
        case .analyzerScreenBody:
            return "Text analysis will appear here: tone, recurring themes, phrasing—separate from chat and the situation dashboard."
        case .applicationTabAnalyzer:
            return "Analyzer"
        case .applicationTabChat:
            return "Chat"
        case .applicationTabDashboard:
            return "Dashboard"
        case .applicationTabProfile:
            return "Profile"
        case .chatContextNote:
            return "Reply tone is set in your profile—this is just the dialog."
        case .chatLlmGatewayDispatchFailureBanner:
            return "Could not get a response. Check the network or wait and try again."
        case .chatMessageDraftPlaceholder:
            return "Message…"
        case .chatPrimarySendActionLabel:
            return "Send"
        case .chatScreenTitle:
            return "Chat"
        case .committedAgeGenderSection:
            return "Age & gender (profile)"
        case .committedAgeLabel:
            return "Age"
        case .committedDynamicsTitle:
            return "Relationship dynamics"
        case .committedExperienceTitle:
            return "How do you experience this relationship?"
        case .committedFromProfileNote:
            return ""
        case .committedGlobalNote:
            return "Choose the description that best matches your dynamic."
        case .dashboardAboutYou:
            return "About you"
        case .dashboardActionDelete:
            return "Delete"
        case .dashboardAddNewSituation:
            return "➕ Add a new situation"
        case .dashboardChartAxisAnxiety:
            return "Anxiety"
        case .dashboardChartAxisDay:
            return "Day"
        case .dashboardEmptyInsightsPlaceholderBody:
            return "After your first analysis, you will see anxiety dynamics, session highlights, and a small action plan here. Start in chat—describe the situation in your own words."
        case .dashboardIdentityAgeNarrativePrefix:
            return "age "
        case .dashboardIdentityGenderFemaleNarrative:
            return "female"
        case .dashboardIdentityGenderMaleNarrative:
            return "male"
        case .dashboardIdentityGenderOtherNarrative:
            return "other"
        case .dashboardIdentityRibbonEmpty:
            return "A short intro from your profile will show here—it is not tied to the situation you select below."
        case .dashboardSituationTypeFallback:
            return "Situation"
        case .dashboardContextBody:
            return "Pick a situation first—insights below are not mixed across different stories."
        case .dashboardContextTitle:
            return "What we look at"
        case .dashboardDevData:
            return "Dev: data"
        case .dashboardMoodAnxiety:
            return "Anxiety level"
        case .dashboardMoodLast7Days:
            return "Last 7 days"
        case .dashboardNowPrefix:
            return "Current"
        case .dashboardSaved:
            return "Saved"
        case .dashboardSessionAnchors:
            return "Anchors"
        case .dashboardSessionEssence:
            return "Core"
        case .dashboardSessionMain:
            return "Session highlights"
        case .dashboardSessionTriggers:
            return "Triggers"
        case .dashboardSessionTry:
            return "What to try"
        case .dashboardSituationHistory:
            return "Situation history"
        case .dashboardSituationPillPrefix:
            return "Situation: "
        case .dashboardStartAnalysisEmpty:
            return "Start analysis"
        case .dashboardSwipeToDelete:
            return "Swipe left to delete an entry."
        case .dashboardYourInsights:
            return "Your insights"
        case .datingSubNote:
            return "Select exactly 3 priorities."
        case .datingWhatMatters:
            return "What is most important in a partner?"
        case .doneKeyboard:
            return "Done"
        case .durationLogisticsHeader:
            return "Duration, logistics & ties"
        case .friendshipCommDifficultiesSub:
            return "Focus on what gets in the way"
        case .friendshipCommDifficultiesTitle:
            return "What are the main communication difficulties?"
        case .friendshipOtherOptionalSub:
            return "Custom issue"
        case .friendshipOtherOptionalTitle:
            return "Other (optional)"
        case .friendshipRoleSub:
            return "Context for this relationship"
        case .friendshipRoleTitle:
            return "Who is this person to you?"
        case .globalModeStageTitle:
            return "What is on your mind?"
        case .livingFormat:
            return "Living format"
        case .onbGenderAgeSub:
            return ""
        case .onbGenderAgeTitle:
            return "A bit about you"
        case .onbSharedDone:
            return "Done"
        case .partnerConflictSub:
            return "Select all patterns you recognize."
        case .partnerConflictTitle:
            return "Partner in conflict"
        case .profileAboutMe:
            return "About me"
        case .profileActionCancel:
            return "Cancel"
        case .profileActionClear:
            return "Clear"
        case .profileActionLogOut:
            return "Log out"
        case .profileAdditionalWishes:
            return "Extra preferences (optional)"
        case .profileAdditionalWishesSub:
            return "Add detail if tags are not enough"
        case .profileAge:
            return "Age"
        case .profileAppearance:
            return "Appearance"
        case .profileAttachmentType:
            return "Attachment style"
        case .profileClearChatHistory:
            return "Clear chat history"
        case .profileClearChatsDialogTitle:
            return "Clear on-device message history? This action cannot be undone."
        case .profileCurrentStatus:
            return "I am"
        case .profileData:
            return "Data"
        case .profileEmpathyQuestion:
            return "How should the AI talk with me?"
        case .profileEmpathySub:
            return "Choose what feels right."
        case .profileEmpathyTitle:
            return "AI empathy"
        case .profileGender:
            return "Gender"
        case .profileGenderNote:
            return "For tone and social context; data stays on your device and is under your control."
        case .profileGenderPillGlyphFemale:
            return "F"
        case .profileGenderPillGlyphMale:
            return "M"
        case .profileGenderPillGlyphOther:
            return "Other"
        case .profileLanguage:
            return "Language"
        case .profileLogOut:
            return "Log out of this account"
        case .profileLogOutDialogTitle:
            return "Log out and remove data from this device? You will go through app entry again."
        case .profileName:
            return "Name"
        case .profileNamePlaceholder:
            return "What should we call you"
        case .profilePrivacySafety:
            return "Privacy & safety"
        case .profileSafetySheetTitle:
            return "Safety"
        case .profileScreenTitle:
            return "Profile"
        case .profileSettingsTitle:
            return "App settings"
        case .profileStatusAndIdentity:
            return "My status & identity"
        case .profileThemeDark:
            return "🌙 Dark"
        case .profileThemeLight:
            return "☀️ Light"
        case .profileThemeSegment:
            return "Theme"
        case .redFlagsHeader:
            return "Red flags in a partner"
        case .redFlagsOther:
            return "Other (optional)"
        case .relDuration:
            return "Relationship duration"
        case .relationshipOnboardingBack:
            return "Back"
        case .relationshipOnboardingNext:
            return "Next"
        case .relationshipOnboardingProgressA11y:
            return "Progress"
        case .relationshipOnboardingProgressOf:
            return "of"
        case .relationshipOnboardingSkip:
            return "Skip"
        case .relationshipOnboardingStartAnalysis:
            return "Start analysis"
        case .relationshipOnboardingStartAnalysisEnglish:
            return "Start Analysis"
        case .relationshipOnboardingStartAnalysisWithSparkle:
            return "✨ Start analysis"
        case .safetyDisclosure1:
            return "Prisma is not therapy or medical care. It offers reflection and phrasing, not diagnosis, and it does not replace a licensed professional."
        case .safetyDisclosure2:
            return "If you are in danger, call your local emergency number. In a crisis, reach out to people you trust or local crisis services."
        case .safetyDisclosure3:
            return "You choose what to share. Do not share others' personal data without their consent."
        case .separationContactNow:
            return "Are you still in contact?"
        case .separationPartnerConflict:
            return "In conflict, your ex tends to"
        case .separationPickPatterns:
            return "Pick 1–2 main patterns. This helps us understand the dynamic."
        case .separationTellStory:
            return "What happened"
        case .separationWhen:
            return "When did it happen?"
        case .separationWhoInit:
            return "Who initiated the breakup?"
        case .sharedTies:
            return "Shared ties (select any)"
        }
    }
}
