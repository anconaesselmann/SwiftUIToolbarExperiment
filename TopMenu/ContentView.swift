//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI
import Combine

struct ISeeEyes: View {
    @EnvironmentObject
    private var toolbarManager: ToolbarManager

    @StateObject
    private var eyeManager = EyeManager()

    @State
    var bag: AnyCancellable?

    var body: some View {
        VStack {
            Button("Blink") {
                toolbarManager.toggle(.blink)
            }
            HStack {
                Eyes(count: eyeManager.eyes, blinking: toolbarManager.isPressed(.blink))
            }.padding(32)
        }
        .onAppear {
            bag = toolbarManager.onNext { [weak eyeManager] event in
                switch event.interaction {
                case .press:
                    withAnimation {
                        eyeManager?.eyes += 2
                    }
                default: ()
                }
            }
        }
        .padding()
        .background(.blue.opacity(0.2))
        .cornerRadius(16)
    }
}

struct ContentView: View {

    @EnvironmentObject
    private var toolbarManager: ToolbarManager

    @AppStorage("isSleeping")
    var isSleeping = false

    var body: some View {
        VStack(spacing: 32) {
            Button(isSleeping ? "Awake": "Sleep", action: toggleSleeping)
            if !isSleeping {
                ISeeEyes()
            }
        }
        .toolbar {
            MainToolbar()
        }
        .alert(isPresented: toolbarManager.isSetBinding(for: .meow)) {
            Alert(
                title: Text("Cats!"),
                message: Text("Meow"),
                dismissButton: .default(Text("Thanks"))
            )
        }
    }

    private func toggleSleeping() {
        withAnimation {
            isSleeping = !isSleeping
            toolbarManager.set(isDisabled: isSleeping, for: .blink)
        }
        toolbarManager.set(isVisible: !isSleeping, for: .moreEyes)
    }
}
