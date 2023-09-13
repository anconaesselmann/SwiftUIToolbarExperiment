//  Created by Axel Ancona Esselmann on 9/13/23.
//

import Foundation

protocol ToolbarElement {
    var rawValue: Int { get }
}

struct ToolbarEvent {

    enum Interaction {
        case set
        case release
        case press
    }

    let element: ToolbarElement
    let interaction: Interaction
}
