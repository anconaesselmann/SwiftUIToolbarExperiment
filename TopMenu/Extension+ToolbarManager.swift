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
        set(isDisabled: isDisabled, for: item as ToolbarElement)
    }
    func disabled(_ item: MainToolbar.Element) -> Bool {
        disabled(item as ToolbarElement)
    }
    func set(isVisible: Bool, for item: MainToolbar.Element) {
        set(isVisible: isVisible, for: item as ToolbarElement)
    }
    func visible(_ item: MainToolbar.Element) -> Bool {
        visible(item as ToolbarElement)
    }
}
