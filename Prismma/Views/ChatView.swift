import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack {
            PrismaColors.background
                .ignoresSafeArea()
            Text("Чат с Prisma")
                .font(PrismaTypography.prismaPrimaryTitleRoundedSemibold)
                .foregroundStyle(PrismaColors.textPrimary)
        }
    }
}
