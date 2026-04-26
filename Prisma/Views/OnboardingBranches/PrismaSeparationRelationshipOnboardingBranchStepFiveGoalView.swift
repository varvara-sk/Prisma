import SwiftUI

struct PrismaSeparationRelationshipOnboardingBranchStepFiveGoalView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @ObservedObject var prismaRelationshipOnboardingFlowViewModel: PrismaRelationshipOnboardingFlowViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Какая у вас сейчас главная цель?")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                        .multilineTextAlignment(.leading)
                    Text("Это поможет Prisma выбрать правильный тон поддержки.")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(3)
                }
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(
                        PrismaCinematicLatchedNucleiSeparationOnboardingDescriptorCurationChamberLatchedNuclei
                            .prismaPostSeparationSupportGoalCardRows,
                        id: \.goal
                    ) { row in
                        let selected = prismaRelationshipOnboardingFlowViewModel
                            .prismaMutableUserRelationshipProfileSnapshot
                            .prismaPostSeparationSupportGoal == row.goal
                        Button {
                            prismaRelationshipOnboardingFlowViewModel.prismaApplyPostSeparationSupportGoalMutation(row.goal)
                        } label: {
                            HStack(alignment: .center, spacing: 14) {
                                ZStack {
                                    Circle()
                                        .fill(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(0.14))
                                        .frame(width: 42, height: 42)
                                    Image(systemName: row.symbolName)
                                        .font(.system(size: 18, weight: .semibold, design: .default))
                                        .foregroundStyle(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
                                }
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(row.title)
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                        .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
                                        .multilineTextAlignment(.leading)
                                    Text(row.subtitle)
                                        .font(.system(size: 14, weight: .regular, design: .default))
                                        .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(2)
                                }
                                Spacer(minLength: 0)
                                Image(systemName: selected ? "checkmark.circle.fill" : "circle")
                                    .font(.title3)
                                    .foregroundStyle(
                                        selected
                                            ? PrismaColors.primary(prismaRuntimeActiveAppThemeComposition)
                                            : Color(.systemGray4)
                                    )
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .stroke(
                                        PrismaColors.primary(prismaRuntimeActiveAppThemeComposition).opacity(selected ? 0.85 : 0.0),
                                        lineWidth: 2
                                    )
                            )
                            .shadow(
                                color: PrismaColors.prismaDashboardInsightsHIGNotionStyleCardDropShadowLuminanceFragment(
                                    prismaRuntimeActiveAppThemeComposition
                                ),
                                radius: 10,
                                x: 0,
                                y: 3
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 120)
        }
    }
}
