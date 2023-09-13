//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI

struct ToolbarToggleButton: View {

    @EnvironmentObject
    var toolbarManager: ToolbarManager

    let label: String
    let systemImage: String
    let element: ToolbarElement

    init(
        _ label: String,
        systemImage: String,
        element: ToolbarElement
    ) {
        self.label = label
        self.systemImage = systemImage
        self.element = element
    }

    var body: some View {
        if toolbarManager.visible(element) {
            Button {
                toolbarManager.toggle(element)
            } label: {
                Label(label, systemImage: systemImage)
                    .foregroundColor(color)
            }
            .disabled(toolbarManager.disabled(element))
        }
    }

    var color: Color {
        let isPressed = toolbarManager.isPressed(element)
        let isDisabled = toolbarManager.disabled(element)
        let color: Color = isPressed ? .blue : .white
        return isDisabled ? color.opacity(0.2) : color
    }
}

import SwiftUI

struct ToolbarButton: View {

    @EnvironmentObject
    var toolbarManager: ToolbarManager

    let label: String
    let systemImage: String
    let element: ToolbarElement

    init(
        _ label: String,
        systemImage: String,
        element: ToolbarElement
    ) {
        self.label = label
        self.systemImage = systemImage
        self.element = element
    }

    var body: some View {
        if toolbarManager.visible(element) {
            Button {
                toolbarManager.press(element)
            } label: {
                Label(label, systemImage: systemImage)
                    .foregroundColor(color)
            }
            .disabled(toolbarManager.disabled(element))
        }
    }

    var color: Color {
        let isPressed = toolbarManager.isPressed(element)
        let isDisabled = toolbarManager.disabled(element)
        let color: Color = isPressed ? .blue : .white
        return isDisabled ? color.opacity(0.2) : color
    }
}
