import SwiftUI

struct AnalyzerView: View {
    var body: some View {
        ZStack {
            PrismaColors.background
                .ignoresSafeArea()
            Text("Анализатор переписок")
                .font(PrismaTypography.prismaPrimaryTitleRoundedSemibold)
                .foregroundStyle(PrismaColors.textPrimary)
        }
    }
}
