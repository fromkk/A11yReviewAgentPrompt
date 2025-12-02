import SwiftUI

struct TooMuchExplain: View {
  var body: some View {
    TabView {
      Tab("NG", systemImage: "nosign") {
        Button {
          // TODO: something
        } label: {
          HStack {
            Image(systemName: "photo")
              .accessibilityLabel("Photo")
            Text("Pick a photo")
          }
        }
      }

      Tab("OK", systemImage: "checkmark") {
        Button {
          // TODO: something
        } label: {
          HStack {
            Image(systemName: "photo")
              .accessibilityHidden(true)
            Text("Pick a photo")
          }
        }
      }
    }
    .navigationTitle("Too much explain")
  }
}

#Preview {
  TooMuchExplain()
}
