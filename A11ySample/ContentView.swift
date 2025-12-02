import SwiftUI

enum Menu: Int, Hashable, Identifiable, CaseIterable {
  case noAccessibilityLabel

  var id: Int {
    rawValue
  }

  var name: String {
    switch self {
    case .noAccessibilityLabel:
      return "No Accessibility Label"
    }
  }

  @ViewBuilder
  var view: some View {
    switch self {
    case .noAccessibilityLabel:
      NoAccessibilityLabel()
    }
  }
}

struct ContentView: View {
  @State var selectedMenu: Menu?

  var body: some View {
    NavigationStack {
      List(selection: $selectedMenu) {
        ForEach(Menu.allCases, id: \.self) {
          NavigatgationLinkView(label: Text($0.name))
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
