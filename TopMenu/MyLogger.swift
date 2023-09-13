//  Created by Axel Ancona Esselmann on 9/13/23.
//

import Foundation
import Combine

// Example of a consumer of the ToolbarManager's ToolbarEvents-stream
@globalActor
actor MyLogger: ObservableObject {

    static let shared = MyLogger()

    private var toolbarManager: ToolbarManager?
    private var bag: AnyCancellable?

    func setup(using toolbarManager: ToolbarManager) async {
        guard self.toolbarManager == nil else {
            return
        }
        self.toolbarManager = toolbarManager
        bag = await toolbarManager.onNext { notification in
            Task { [weak self] in
                await self?.log(notification)
            }
        }
    }

    func log(_ event: ToolbarEvent) {
        print(event.element, event.interaction)
    }

    func log(_ message: String) {
        print(message)
    }
}
