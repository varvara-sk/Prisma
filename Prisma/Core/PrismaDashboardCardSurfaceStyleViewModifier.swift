import SwiftUI

struct PrismaDashboardCardUniformSurfaceStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(PrismaColors.surface)
            )
            .shadow(color: Color.black.opacity(0.32), radius: 14, x: 0, y: 8)
    }
}

extension View {
    func prismaDashboardCardUniformSurfaceStyle() -> some View {
        modifier(PrismaDashboardCardUniformSurfaceStyleModifier())
    }
}
