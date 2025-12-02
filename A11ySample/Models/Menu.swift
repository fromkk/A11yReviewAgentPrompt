import SwiftUI

enum Menu: Int, Hashable, Identifiable, CaseIterable {
  case noAccessibilityLabel
  case tooMuchExplanation
  case onlyImage

  var id: Int {
    rawValue
  }

  var name: String {
    switch self {
    case .noAccessibilityLabel:
      return "No Accessibility Label"
    case .tooMuchExplanation:
      return "Too Much Explanation"
    case .onlyImage:
      return "Only Image"
    }
  }

  @ViewBuilder
  var view: some View {
    switch self {
    case .noAccessibilityLabel:
      NoAccessibilityLabel()
    case .tooMuchExplanation:
      TooMuchExplanation()
    case .onlyImage:
      OnlyImageView()
    }
  }
}
