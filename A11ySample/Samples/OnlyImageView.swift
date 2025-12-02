import SwiftUI

struct OnlyImageView: View {
  var body: some View {
    TabView {
      Tab("NG", systemImage: "nosign") {
        Image(.banner)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }

      Tab("OK", systemImage: "checkmark") {
        Image(.banner)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .accessibilityLabel("Lumina Eyes New Product Launch")
      }
    }
    .navigationTitle("Only Image")
  }
}

#Preview {
  OnlyImageView()
}
