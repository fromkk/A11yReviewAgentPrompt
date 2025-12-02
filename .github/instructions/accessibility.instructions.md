---
applyTo: '**/*.swift'
---

## Accessibility

Perform static accessibility checks for SwiftUI code.

### Labels

Labels are crucial for VoiceOver support. Alternative text is essential, especially for images and videos that don't contain text information.
Below are some sample code examples. When you find bad examples, please suggest improvements like the examples shown.

```swift
struct OnlyImageButtonSample: View {
    var body: some View {
        Button {
            // do some action
        } label: {
            Image(systemName: "xmark")
        }
    }
}
```

When you find code like this, suggest the following. Use specific, descriptive text for accessibility labels that clearly explains the button's function:

```swift
struct OnlyImageButtonSample: View {
    var body: some View {
        Button {
            // do some action
        } label: {
            Image(systemName: "xmark")
                .accessibilityLabel("Close")
        }
    }
}
```

However, adding descriptions to images can sometimes be excessive. Here's an example:

```swift
struct HStackButtonSample: View {
    var body: some View {
        Button {
            // go home
        } label: {
            HStack {
                Image(systemName: "house")
                Text("Home")
            }
        }
    }
}
```

In such cases, it's preferable to remove the label from the image as follows:

```swift
struct HStackButtonSample: View {
    var body: some View {
        Button {
            // go home
        } label: {
            HStack {
                Image(systemName: "house")
                    .accessibilityHidden(true)
                Text("Home")
            }
        }
    }
}
```

### State

When a button contains a property that represents state, such as `isSelected`, it's preferable to add state information.

```swift
struct CheckboxSample: View {
    @State var isSelected: Bool = false

    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            if isSelected {
                Image(systemName: "checkmark.square.fill")
                    .accessibilityHidden(true)
            } else {
                Image(systemName: "checkmark.square")
                     .accessibilityHidden(true)
            }
        }
        .accessibilityLabel("Select item")
    }
}
```

The above code lacks state description, so it needs to be added. When a property represents state, add appropriate traits using `.accessibilityAddTraits` and describe the current state using `.accessibilityValue`:

```swift
struct CheckboxSample: View {
    @State var isSelected: Bool = false

    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            if isSelected {
                Image(systemName: "checkmark.square.fill")
                     .accessibilityHidden(true)
            } else {
                Image(systemName: "checkmark.square")
                     .accessibilityHidden(true)
            }
        }
        .accessibilityLabel("Select item")
        .accessibilityAddTraits(.isToggle)
        .accessibilityValue(isSelected ? "Selected" : "Not selected")
    }
}
```

For headings, indicate that they are headings.

```swift
struct SectionHeaderSample: View {
    var body: some View {
        List {
            Section {
                // write some list
            } header: {
                Text("Header")
            }
        }
    }
}
```

In such cases, you need to add state (trait) as follows. Adding the `.isHeader` trait helps VoiceOver users understand the structure:

```swift
struct SectionHeaderSample: View {
    var body: some View {
        List {
            Section {
                // write some list
            } header: {
                Text("Header")
                    .accessibilityAddTraits([.isHeader])
            }
        }
    }
}
```

Sometimes you may need to use `onTapGesture` instead of `Button`. In such cases, adding the `.isButton` trait helps VoiceOver recognize it as a tappable element:

```swift
struct OnTapGestureViewSample: View {
    var body: some View {
        Text("Tap here")
            .background(Color.blue)
            .padding()
            .onTapGesture {
                // do something
            }
    }
}
```

Improve code like this as follows:

```swift
struct OnTapGestureViewSample: View {
    var body: some View {
        Text("Tap here")
            .background(Color.blue)
            .padding()
            .onTapGesture {
                // do something
            }
            .accessibilityAddTraits([.isButton])
    }
}
```

### Values and Hints

For elements with dynamic values, use `.accessibilityValue` to describe the current value:

```swift
struct SliderSample: View {
    @State var value: Double = 0.5

    var body: some View {
        Slider(value: $value, in: 0...1)
    }
}
```

The above code lacks value description. Improve it as follows:

```swift
struct SliderSample: View {
    @State var value: Double = 0.5

    var body: some View {
        Slider(value: $value, in: 0...1)
            .accessibilityValue("\(Int(value * 100)) percent")
    }
}
```

When the intent of an action is not clear, use `.accessibilityHint` to provide a hint about the operation:

```swift
struct SwipeActionSample: View {
    var body: some View {
        Button("Delete") {
            // delete action
        }
    }
}
```

The above code may lack operation hints. Improve it as follows:

```swift
struct SwipeActionSample: View {
    var body: some View {
        Button("Delete") {
            // delete action
        }
        .accessibilityHint("Swipe to delete")
    }
}
```

### Custom Actions

For complex operations, use `.accessibilityAction` to define custom actions:

```swift
struct CustomActionSample: View {
    var body: some View {
        Image(systemName: "photo")
            .onTapGesture {
                // show image
            }
            .onLongPressGesture {
                // show options
            }
    }
}
```

The above code may not be recognized by VoiceOver for gesture operations. Improve it as follows:

```swift
struct CustomActionSample: View {
    var body: some View {
        Image(systemName: "photo")
            .accessibilityLabel("Photo")
            .accessibilityAction(named: "Show") {
                // show image
            }
            .accessibilityAction(named: "Options") {
                // show options
            }
    }
}
```
