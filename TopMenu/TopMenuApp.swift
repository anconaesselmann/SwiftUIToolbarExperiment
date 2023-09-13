//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI

@main
struct TopMenuApp: App {

    @StateObject
    var toolbarManager = ToolbarManager()

    @StateObject
    var logger = MyLogger()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    await logger.setup(using: toolbarManager)
                }
                .environmentObject(toolbarManager)
                .environmentObject(logger)
        }
    }
}
