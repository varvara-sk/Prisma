import SwiftUI

struct ChatView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @State private var prismaConversationContextRibbonHydratedUserProfileSnapshot = UserProfile()

    var body: some View {
        ZStack {
            PrismaColors.background(prismaRuntimeActiveAppThemeComposition)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 18) {
                Text("Чат")
                    .font(PrismaTypography.prismaPremiumScreenTitleRoundedBold)
                    .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                PrismaChatConversationContextualRibbonStripView(
                    prismaRibbonSourceUserProfileSnapshot: prismaConversationContextRibbonHydratedUserProfileSnapshot
                )
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 20)
            .padding(.top, 24)
        }
        .onAppear {
            prismaConversationContextRibbonHydratedUserProfileSnapshot = PrismaUserProfileLocalStorageService.prismaSharedSingletonInstance
                .prismaFabricateMergedUserProfileSnapshotAssimilatingLegacyIsolatedApplicationTabKeysIfNeeded()
            PrismaProductUsageTelemetrySignalRecorder.prismaIncrementOrdinalTallyForTelemetrySignal(
                .primaryChatConversationSurfaceDidAppear
            )
        }
    }
}

private struct PrismaChatConversationContextualRibbonStripView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaRibbonSourceUserProfileSnapshot: UserProfile

    private var prismaCondensedRibbonDescriptorLabelSequence: [String] {
        var prismaAccumulator = [String]()
        let prismaTrimmedCallsignFragment = prismaRibbonSourceUserProfileSnapshot.prismaPreferredCallsignForUserInterfaceDisplay
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !prismaTrimmedCallsignFragment.isEmpty {
            prismaAccumulator.append(prismaTrimmedCallsignFragment)
        }
        if let prismaAttachmentEnumerationCase = PrismaProfileAttachmentStylePreferenceEnumeration(
            rawValue: prismaRibbonSourceUserProfileSnapshot.prismaAttachmentStylePreferenceEnumerationSerializedRawValue
        ) {
            prismaAccumulator.append(prismaAttachmentEnumerationCase.prismaLocalizedRussianReadableMenuTitle)
        }
        let prismaTrimmedAiNoteBody = prismaRibbonSourceUserProfileSnapshot.prismaAIResponsePersonalizationNoteFreeformText
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !prismaTrimmedAiNoteBody.isEmpty {
            let prismaTruncatedNoteBody = String(prismaTrimmedAiNoteBody.prefix(56))
            prismaAccumulator.append(
                prismaTrimmedAiNoteBody.count > 56 ? prismaTruncatedNoteBody + "…" : prismaTruncatedNoteBody
            )
        }
        return prismaAccumulator
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Учтено в ответах")
                .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
            if prismaCondensedRibbonDescriptorLabelSequence.isEmpty {
                Text("Добавьте данные в профиль — ИИ сможет опираться на них в ответах.")
                    .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 96), spacing: 8, alignment: .leading)],
                    alignment: .leading,
                    spacing: 8
                ) {
                    ForEach(prismaCondensedRibbonDescriptorLabelSequence, id: \.self) { prismaRibbonDescriptorLabel in
                        Text(prismaRibbonDescriptorLabel)
                            .font(PrismaTypography.prismaOnboardingCaptionRoundedSecondary)
                            .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                Capsule(style: .continuous)
                                    .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.18))
                            )
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
    }
}
