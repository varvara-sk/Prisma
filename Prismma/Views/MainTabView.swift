import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ChatView()
                .tabItem {
                    Label("Чат", systemImage: "message.fill")
                }
            AnalyzerView()
                .tabItem {
                    Label("Анализатор", systemImage: "doc.text.magnifyingglass")
                }
            DashboardView()
                .tabItem {
                    Label("Дашборд", systemImage: "chart.pie.fill")
                }
        }
        .tint(PrismaColors.primary)
        .toolbarBackground(PrismaColors.surface, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}
