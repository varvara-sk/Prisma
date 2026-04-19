import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            PrismaColors.background
                .ignoresSafeArea()
            Text("Твои инсайты")
                .font(PrismaTypography.prismaPrimaryTitleRoundedSemibold)
                .foregroundStyle(PrismaColors.textPrimary)
        }
    }
}
