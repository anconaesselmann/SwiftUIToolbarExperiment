//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI

protocol ToolbarButtonType: View {

    @MainActor
    var toolbarManager: ToolbarManager { get }

    var label: String { get }
    var systemImage: String { get }
    var element: ToolbarElement { get }

    func puttonPressed()
}

extension ToolbarButtonType {

    @MainActor
    var buttonBody: some View {
        Group {
            if toolbarManager.visible(element) {
                Button(action: puttonPressed) {
                    Label(label, systemImage: systemImage)
                        .foregroundColor(color)
                }
                .disabled(toolbarManager.disabled(element))
            }
        }
    }

    @MainActor
    var color: Color {
        let isPressed = toolbarManager.isPressed(element)
        let isDisabled = toolbarManager.disabled(element)
        let color: Color = isPressed ? .blue : .white
        return isDisabled ? color.opacity(0.2) : color
    }
}
