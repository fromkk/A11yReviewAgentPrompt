---
applyTo: '**/*.swift'
---

## アクセシビリティ

SwiftUI向けのアクセシビリティの静的確認を行います。

### ラベル

VoiceOver 対応においてラベルの存在はとても重要です。特に画像や動画などのテキスト情報が無い場合は代替テキストが必須です。
以下にサンプルコードをいくつか掲載するので、悪い例を改善例の様に提案してください。

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

この様なコードを見つけた場合は、以下の様に提案してください。アクセシビリティラベルには、ボタンの機能を明確に説明する具体的なテキストを使用してください。

```swift
struct OnlyImageButtonSample: View {
    var body: some View {
        Button {
            // do some action
        } label: {
            Image(systemName: "xmark")
                .accessibilityLabel("閉じる")
        }
    }
}
```

また画像に説明を加えると過剰なことがあります。以下に例を示します。

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

この様な場合は以下の様に画像からラベルを取り除くことが望ましいです。

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

画像や動画だけを表示する場合には必ず気を付けてください。例えば以下の様な例です。

```swift
struct OnlyImageView: View {
    var body: some View {
        Image(.banner)
    }
}
```

これでは画像が何を表現しているのか分からないので、以下の様にラベルを追加します。

```swift
struct OnlyImageView: View {
    var body: some View {
        Image(.banner)
            .accessibilityLabel("New product image")
    }
}
```

### 状態

ボタン内に `isSelected` の様な状態を表すプロパティがある場合には、状態を付与することが望ましいです。

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
        .accessibilityLabel("項目を選択")
    }
}
```

上記のコードには状態の説明が足りてないので追加する必要があります。状態を表すプロパティがある場合は、`.accessibilityAddTraits`で適切なトレイトを追加し、`.accessibilityValue`で現在の状態を説明してください。

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
        .accessibilityLabel("項目を選択")
        .accessibilityAddTraits(.isToggle)
    }
}
```

見出しには見出しであることを提示しましょう。

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

このような場合には以下のように状態（trait）を付与する必要があります。見出しには`.isHeader`トレイトを追加することで、VoiceOverユーザーが構造を理解しやすくなります。

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

やむをえず Button が使えず onTapGesture を利用することがあるかもしれません。その場合でも `.isButton` を追加することで押せるものだと認識してもらうことができます。

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

この様なコードは以下の様にします。

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


### 値とヒント

動的な値を持つ要素には、`.accessibilityValue`を使用して現在の値を説明してください。

```swift
struct SliderSample: View {
    @State var value: Double = 0.5

    var body: some View {
        Slider(value: $value, in: 0...1)
    }
}
```

上記のコードには値の説明が不足しています。以下のように改善してください。

```swift
struct SliderSample: View {
    @State var value: Double = 0.5

    var body: some View {
        Slider(value: $value, in: 0...1)
            .accessibilityValue("\(Int(value * 100))パーセント")
    }
}
```

操作の意図が明確でない場合は、`.accessibilityHint`を使用して操作のヒントを提供してください。

```swift
struct SwipeActionSample: View {
    var body: some View {
        Button("削除") {
            // delete action
        }
    }
}
```

上記のコードには操作のヒントが不足している場合があります。以下のように改善してください。

```swift
struct SwipeActionSample: View {
    var body: some View {
        Button("削除") {
            // delete action
        }
        .accessibilityHint("スワイプして削除します")
    }
}
```

### カスタムアクション

複雑な操作には、`.accessibilityAction`を使用してカスタムアクションを定義できます。

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

上記のコードは、ジェスチャー操作がVoiceOverで認識されない可能性があります。以下のように改善してください。

```swift
struct CustomActionSample: View {
    var body: some View {
        Image(systemName: "photo")
            .accessibilityLabel("写真")
            .accessibilityAction(named: "表示") {
                // show image
            }
            .accessibilityAction(named: "オプション") {
                // show options
            }
    }
}
```
