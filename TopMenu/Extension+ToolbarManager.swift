//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI

extension ToolbarManager {
    func toggle(_ item: MainToolbar.Element) {
        toggle(item as ToolbarElement)
    }
    func isPressed(_ item: MainToolbar.Element) -> Bool {
        isPressed(item as ToolbarElement)
    }
    func isSetBinding(for item: MainToolbar.Element) -> Binding<Bool> {
        isSetBinding(for: item as ToolbarElement)
    }
    func set(isDisabled: Bool, for item: MainToolbar.Element) {
        let item = item as ToolbarElement
        print(item)
        set(isDisabled: isDisabled, for: item)
    }
    func disabled(_ item: MainToolbar.Element) -> Bool {
        let item = item as ToolbarElement
        print(item)
        return disabled(item as ToolbarElement)
    }
}
