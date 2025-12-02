import SwiftUI

struct TooMuchExplanation: View {
  var body: some View {
    TabView {
      Tab("NG", systemImage: "nosign") {
        Button {
          // TODO: something
        } label: {
          HStack {
            // NG: VoiceOver reads "Photo, Pick a photo" - redundant information
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
            // OK: Hide decorative icon, only the text will be announced
            Image(systemName: "photo")
              .accessibilityHidden(true)
            Text("Pick a photo")
          }
        }
      }
    }
    .navigationTitle("Too Much Explanation")
  }
}

#Preview {
  TooMuchExplanation()
}
