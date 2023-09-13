//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI
import Combine

@MainActor
class ToolbarManager: ObservableObject {

    fileprivate struct ToolbarStates: OptionSet {
        let rawValue: Int
    }

    private typealias Stream = PassthroughSubject<ToolbarEvent, Never>

    @AppStorage("ToolbarManager.states")
    private var states = ToolbarStates()

    @AppStorage("ToolbarManager.enabled")
    private var enabled = ToolbarStates()

    private let stream = Stream()

    func set(_ item: ToolbarElement) {
        guard !states.containsElement(item) else {
            return
        }
        states.insertElement(item)
        let event = ToolbarEvent(
            element: item,
            interaction: .set
        )
        stream.send(event)
    }

    func unset(_ item: ToolbarElement) {
        guard states.containsElement(item) else {
            return
        }
        states.removeElement(item)
        let event = ToolbarEvent(
            element: item,
            interaction: .release
        )
        stream.send(event)
    }

    func press(_ item: ToolbarElement) {
        let event = ToolbarEvent(
            element: item,
            interaction: .press
        )
        stream.send(event)
    }

    func toggle(_ item: ToolbarElement) {
        if states.containsElement(item) {
            unset(item)
        } else {
            set(item)
        }
    }

    func set(_ item: ToolbarElement, to isSet: Bool) {
        if states.containsElement(item) != isSet {
            toggle(item)
        }
    }

    func isPressed(_ item: ToolbarElement) -> Bool {
        states.containsElement(item)
    }

    func disabled(_ item: ToolbarElement) -> Bool {
        !enabled.containsElement(item)
    }

    func set(isDisabled: Bool, for item: ToolbarElement) {
        if isDisabled {
            enabled.removeElement(item)
        } else {
            enabled.insertElement(item)
        }
    }

    func isSetBinding(for item: ToolbarElement) -> Binding<Bool> {
        Binding(
            get: { [weak self] in
                self?.isPressed(item) ?? false
            },
            set: { [weak self] in
                self?.set(item, to: $0)
            }
        )
    }

    func onNext(_ callback: @escaping (ToolbarEvent) -> Void) -> AnyCancellable {
        stream.sink(receiveValue: callback)
    }
}

private extension ToolbarManager.ToolbarStates {
    func containsElement(_ member: ToolbarElement) -> Bool {
        contains(Self(rawValue: member.rawValue))
    }

    mutating func insertElement(_ newMember: ToolbarElement) {
        insert(Self(rawValue: newMember.rawValue))
    }

    mutating func removeElement(_ newMember: ToolbarElement) {
        remove(Self(rawValue: newMember.rawValue))
    }
}
