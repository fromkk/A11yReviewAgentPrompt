import SwiftUI

struct NoAccessibilityLabel: View {
  var body: some View {
    TabView {
      Tab("NG", systemImage: "nosign") {
        Button {
          // TODO: something
        } label: {
          // NG: VoiceOver only announces "Button" - users don't know what it does
          Image(systemName: "photo")
        }
      }

      Tab("OK", systemImage: "checkmark") {
        Button {
          // TODO: something
        } label: {
          // OK: Provide a descriptive label so users understand the button's purpose
          Image(systemName: "photo")
            .accessibilityLabel("Pick a photo")
        }
      }
    }
    .navigationTitle("No accessibility label")
  }
}

#Preview {
  NoAccessibilityLabel()
}
