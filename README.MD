### An experiment with dataflow in a SwiftUI app that uses a Toolbar with the following design considerations:

- Toolbar buttons can be toggled or simply pressed
- Toolbar buttons have enabled and disabled states
- Toolbar buttons have a visible and a hidden state
- All toolbar state is easily persisted
- Toolbar button state should be consumable by SwiftUI APIs that require passing in a Binding<Bool> (Alerts, file import/export dialogues)
- The @MainActors as well as @globalActors should be able to be consume a stream of button press events
- Toolbar state management should be able to be turned into a standalone package