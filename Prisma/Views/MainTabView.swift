import SwiftUI

struct MainTabView: View {
    @State private var prismaMainTabShellSelectedSegmentOrdinalIndex = 0

    var body: some View {
        TabView(selection: $prismaMainTabShellSelectedSegmentOrdinalIndex) {
            ChatView()
                .tabItem {
                    Label("Чат", systemImage: "message.fill")
                }
                .tag(0)
            AnalyzerView()
                .tabItem {
                    Label("Анализатор", systemImage: "doc.text.magnifyingglass")
                }
                .tag(1)
            DashboardView(prismaMainTabShellSegmentSelectionCoordinatorOrdinal: $prismaMainTabShellSelectedSegmentOrdinalIndex)
                .tabItem {
                    Label("Дашборд", systemImage: "chart.pie.fill")
                }
                .tag(2)
        }
        .tint(PrismaColors.primary)
        .toolbarBackground(PrismaColors.surface, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}
