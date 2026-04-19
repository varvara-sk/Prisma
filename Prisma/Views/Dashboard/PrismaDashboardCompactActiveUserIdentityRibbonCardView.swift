import SwiftUI

struct PrismaDashboardCompactActiveUserIdentityRibbonCardView: View {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    let prismaActiveUserProfileSnapshotForIdentityRibbon: UserProfile

    private var prismaCondensedIdentityRibbonNarrativeLine: String {
        var prismaFragmentAccumulator = [String]()
        let prismaTrimmedCallsign = prismaActiveUserProfileSnapshotForIdentityRibbon.prismaPreferredCallsignForUserInterfaceDisplay
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !prismaTrimmedCallsign.isEmpty {
            prismaFragmentAccumulator.append(prismaTrimmedCallsign)
        }
        let prismaTrimmedAge = prismaActiveUserProfileSnapshotForIdentityRibbon.userAgeFreeformInputText
            .trimmingCharacters(in: .whitespacesAndNewlines)
        if !prismaTrimmedAge.isEmpty {
            prismaFragmentAccumulator.append("возраст \(prismaTrimmedAge)")
        }
        let prismaGenderLabel = prismaActiveUserProfileSnapshotForIdentityRibbon.userGender
        if prismaGenderLabel != "Не указан" {
            prismaFragmentAccumulator.append(prismaGenderLabel.lowercased())
        }
        if prismaFragmentAccumulator.isEmpty {
            return "Коротко о вас появится из профиля — это не привязано к выбранной ситуации ниже."
        }
        return prismaFragmentAccumulator.joined(separator: " · ")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Про вас")
                .font(PrismaTypography.prismaOnboardingHeadlineRoundedMedium)
                .foregroundStyle(PrismaColors.textPrimary(prismaRuntimeActiveAppThemeComposition))
            Text(prismaCondensedIdentityRibbonNarrativeLine)
                .font(PrismaTypography.prismaSecondaryBodyRoundedRegular)
                .foregroundStyle(PrismaColors.textSecondary(prismaRuntimeActiveAppThemeComposition))
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition))
        )
        .shadow(
            color: PrismaColors.prismaElevatedCardShadowColor(prismaRuntimeActiveAppThemeComposition),
            radius: prismaRuntimeActiveAppThemeComposition == .lightTranslucentLavender ? 10 : 14,
            x: 0,
            y: prismaRuntimeActiveAppThemeComposition == .lightTranslucentLavender ? 4 : 8
        )
    }
}
