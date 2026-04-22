import SwiftUI

@main
struct PrismaApp: App {
    @StateObject private var prismaApplicationUserInterfaceLanguageCurationCasketGlyph =
        PrismaApplicationUserInterfaceLanguageCurationCasket()

    var body: some Scene {
        WindowGroup {
            PrismaRootShellView()
                .environmentObject(prismaApplicationUserInterfaceLanguageCurationCasketGlyph)
        }
    }
}
