import SwiftUI

struct ContentView: View {
  @State var selectedMenu: Menu?

  var body: some View {
    NavigationStack {
      List(selection: $selectedMenu) {
        ForEach(Menu.allCases, id: \.self) {
          NavigationLinkView(label: Text($0.name))
        }
      }
      .navigationDestination(item: $selectedMenu, destination: { menu in
        menu.view
      })
      .navigationTitle("A11y Sample")
    }
  }
}

#Preview {
  ContentView()
}
