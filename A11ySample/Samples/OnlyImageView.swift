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
          .accessibilityLabel("LUMINA EYES NEW PRODUCT LAUNCH")
      }
    }
    .navigationTitle("Only Image")
  }
}

#Preview {
  OnlyImageView()
}
