import SwiftUI

struct NavigatgationLinkView<Label: View>: View {
  let label: Label

  var body: some View {
    HStack {
      label
        .frame(maxWidth: .infinity, alignment: .leading)
      Image(systemName: "chevron.forward")
    }
    .padding(8)
  }
}

#Preview {
  NavigatgationLinkView(label: Text("Navigation Link"))
}
