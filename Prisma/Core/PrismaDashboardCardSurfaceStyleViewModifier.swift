import SwiftUI

struct PrismaDashboardCardUniformSurfaceStyleModifier: ViewModifier {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition

    func body(content: Content) -> some View {
        let prismaVisualThemeDescriptor = prismaRuntimeActiveAppThemeComposition
        content
            .padding(16)
            .background(prismaDashboardCardBackdropRoundedRectangularShape(prismaVisualThemeDescriptor))
            .shadow(
                color: PrismaColors.prismaElevatedCardShadowColor(prismaVisualThemeDescriptor),
                radius: prismaVisualThemeDescriptor == .lightTranslucentLavender ? 10 : 14,
                x: 0,
                y: prismaVisualThemeDescriptor == .lightTranslucentLavender ? 4 : 8
            )
    }

    private func prismaDashboardCardBackdropRoundedRectangularShape(_ prismaVisualThemeDescriptor: AppTheme) -> some View {
        Group {
            if prismaVisualThemeDescriptor == .lightTranslucentLavender {
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.ultraThinMaterial)
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PrismaColors.surface(prismaVisualThemeDescriptor).opacity(0.94))
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.white.opacity(0.55), lineWidth: 0.5)
                }
            } else {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(PrismaColors.surface(prismaVisualThemeDescriptor))
            }
        }
    }
}

struct PrismaProfileSectionCardUniformSurfaceStyleModifier: ViewModifier {
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition

    func body(content: Content) -> some View {
        let prismaVisualThemeDescriptor = prismaRuntimeActiveAppThemeComposition
        content
            .padding(20)
            .background(prismaProfileCardBackdropRoundedRectangularShape(prismaVisualThemeDescriptor))
            .shadow(
                color: PrismaColors.prismaElevatedCardShadowColor(prismaVisualThemeDescriptor),
                radius: prismaVisualThemeDescriptor == .lightTranslucentLavender ? 10 : 14,
                x: 0,
                y: prismaVisualThemeDescriptor == .lightTranslucentLavender ? 4 : 8
            )
    }

    private func prismaProfileCardBackdropRoundedRectangularShape(_ prismaVisualThemeDescriptor: AppTheme) -> some View {
        Group {
            if prismaVisualThemeDescriptor == .lightTranslucentLavender {
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.ultraThinMaterial)
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(PrismaColors.surface(prismaVisualThemeDescriptor).opacity(0.96))
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.white.opacity(0.6), lineWidth: 0.5)
                }
            } else {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(PrismaColors.surface(prismaVisualThemeDescriptor))
            }
        }
    }
}

extension View {
    func prismaDashboardCardUniformSurfaceStyle() -> some View {
        modifier(PrismaDashboardCardUniformSurfaceStyleModifier())
    }

    func prismaProfileSectionCardUniformSurfaceStyle() -> some View {
        modifier(PrismaProfileSectionCardUniformSurfaceStyleModifier())
    }
}
