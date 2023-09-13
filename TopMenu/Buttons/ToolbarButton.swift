//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI

struct ToolbarButton: ToolbarButtonType {

    @EnvironmentObject
    var toolbarManager: ToolbarManager

    let label: String
    let systemImage: String
    let element: ToolbarElement

    func puttonPressed() {
        toolbarManager.press(element)
    }

    var body: some View {
        buttonBody
    }
}
