//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI

class EyeManager: ObservableObject {

    @Published
    var eyes: Int = 2

    init() {
        Task {
            await MyLogger.shared.log("Eye manager created")
        }
    }

    deinit {
        Task {
            await MyLogger.shared.log("Eye manager destroyed")
        }
    }
}
