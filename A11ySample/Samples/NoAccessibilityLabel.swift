import SwiftUI

struct NoAccessibilityLabel: View {
  var body: some View {
    TabView {
      Tab("NG", systemImage: "nosign") {
        Button {
          // TODO: something
        } label: {
          Image(systemName: "photo")
        }
      }

      Tab("OK", systemImage: "checkmark") {
        Button {
          // TODO: something
        } label: {
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
