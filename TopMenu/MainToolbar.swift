//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI

struct MainToolbar: ToolbarContent {

    @EnvironmentObject
    var toolbarManager: ToolbarManager

    // To be compatible with OptionSet the raw value has to correspond to powers of 2
    enum Element: Int, ToolbarElement {
        case blink = 1, meow = 2, moreEyes = 4
    }

    @ToolbarContentBuilder var body: some ToolbarContent {
        ToolbarItem(placement: .navigation) {
            HStack {
                ToolbarToggleButton(
                    label: "Blink",
                    systemImage: "eye.fill",
                    element: MainToolbar.Element.blink
                )
                .keyboardShortcut("b")
                ToolbarToggleButton(
                    label: "Meow",
                    systemImage: "pawprint.fill",
                    element: MainToolbar.Element.meow
                )
                .keyboardShortcut("m")
                ToolbarButton(
                    label: "More Eyes",
                    systemImage: "plus.circle",
                    element: MainToolbar.Element.moreEyes
                )
                .keyboardShortcut("c")
            }
        }
    }

}

