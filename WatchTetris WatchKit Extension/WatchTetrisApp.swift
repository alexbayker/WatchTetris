import SwiftUI

@main
struct WatchTetrisApp: App {
    var body: some Scene {
        return WindowGroup {
            NavigationView {
                StartActivity().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
}
