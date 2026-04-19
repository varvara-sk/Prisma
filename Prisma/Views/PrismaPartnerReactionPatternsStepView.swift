import SwiftUI

struct PrismaPartnerReactionPatternsStepView: View {
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    private let prismaPartnerReactionTagGridDescriptors: [String] = [
        "🔥 Взрывается / Кричит",
        "🧊 Молчит / Уходит",
        "🛡 Защищается / Переводит стрелки",
        "🤖 Холодно раскладывает по фактам",
    ]

    private let prismaPartnerReactionTagGridColumnLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                Text("Как обычно реагирует партнер во время ссоры?")
                    .font(PrismaTypography.prismaOnboardingTitle2RoundedSemibold)
                    .foregroundStyle(PrismaColors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Выбери от 1 до 2 вариантов")
                    .font(PrismaTypography.prismaOnboardingSubheadlineRoundedRegular)
                    .foregroundStyle(PrismaColors.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
                LazyVGrid(columns: prismaPartnerReactionTagGridColumnLayout, alignment: .leading, spacing: 12) {
                    ForEach(prismaPartnerReactionTagGridDescriptors, id: \.self) { prismaTagDescriptorLabel in
                        let prismaIsTagSelectedFlag =
                            prismaRelationshipOnboardingFlowViewModel.prismaMutableUserRelationshipProfileSnapshot
                            .partnerReactionTags.contains(prismaTagDescriptorLabel)
                        Button {
                            prismaRelationshipOnboardingFlowViewModel.prismaAttemptPartnerReactionTagSelectionMutation(
                                desiredPartnerReactionTagDisplayLabel: prismaTagDescriptorLabel
                            )
                        } label: {
                            Text(prismaTagDescriptorLabel)
                                .font(PrismaTypography.prismaOnboardingFootnoteRoundedSecondary)
                                .foregroundStyle(PrismaColors.textPrimary)
                                .multilineTextAlignment(.leading)
                                .padding(.vertical, 14)
                                .padding(.horizontal, 14)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                                            .fill(PrismaColors.surface)
                                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                                            .fill(
                                                LinearGradient(
                                                    colors: [
                                                        PrismaColors.primary.opacity(prismaIsTagSelectedFlag ? 0.35 : 0.0),
                                                        PrismaColors.primary.opacity(prismaIsTagSelectedFlag ? 0.12 : 0.0),
                                                    ],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                    }
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                                        .stroke(
                                            PrismaColors.primary.opacity(prismaIsTagSelectedFlag ? 1.0 : 0.35),
                                            lineWidth: prismaIsTagSelectedFlag ? 2 : 1
                                        )
                                )
                                .shadow(
                                    color: PrismaColors.primary.opacity(prismaIsTagSelectedFlag ? 0.35 : 0.0),
                                    radius: prismaIsTagSelectedFlag ? 14 : 0,
                                    x: 0,
                                    y: 10
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
    }
}
