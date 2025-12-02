import SwiftUI

struct NavigationLinkView<Label: View>: View {
  let label: Label

  var body: some View {
    HStack {
      label
        .frame(maxWidth: .infinity, alignment: .leading)
      Image(systemName: "chevron.forward")
        .accessibilityHidden(true)
    }
    .padding(8)
  }
}

#Preview {
  NavigationLinkView(label: Text("Navigation Link"))
}
