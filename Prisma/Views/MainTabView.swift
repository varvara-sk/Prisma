import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph: PrismaApplicationUserInterfaceLanguageCurationCasket
    @Environment(\.prismaRuntimeActiveAppThemeComposition) private var prismaRuntimeActiveAppThemeComposition
    @State private var prismaMainTabShellSelectedSegmentOrdinalIndex = 0

    var body: some View {
        let language = prismaApplicationUserInterfaceLanguageCurationCasketGlyph.activeLanguage
        TabView(selection: $prismaMainTabShellSelectedSegmentOrdinalIndex) {
            ChatView()
                .tabItem {
                    Label(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .applicationTabChat
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language), systemImage: "message.fill")
                }
                .tag(0)
            AnalyzerView()
                .tabItem {
                    Label(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .applicationTabAnalyzer
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language), systemImage: "doc.text.magnifyingglass")
                }
                .tag(1)
            DashboardView(prismaMainTabShellSegmentSelectionCoordinatorOrdinal: $prismaMainTabShellSelectedSegmentOrdinalIndex)
                .tabItem {
                    Label(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .applicationTabDashboard
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language), systemImage: "chart.pie.fill")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Label(PrismaApplicationUserInterfaceStringCatalogLatchedCurationMosaicChamber
                        .applicationTabProfile
                        .prismaCinematicLatchedNucleiResolvedCurationLabeledMosaic(language), systemImage: "person.crop.circle")
                }
                .tag(3)
        }
        .tint(PrismaColors.primary(prismaRuntimeActiveAppThemeComposition))
        .toolbarBackground(PrismaColors.surface(prismaRuntimeActiveAppThemeComposition), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}
