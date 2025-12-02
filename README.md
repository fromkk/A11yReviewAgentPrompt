# SwiftUI Accessibility Review Agent Prompt

A collection of GitHub Copilot prompts for reviewing SwiftUI code to ensure accessibility compliance. This repository provides sample prompts that help developers check if their SwiftUI implementations follow accessibility best practices.

## Overview

This repository contains prompts designed to work with GitHub Copilot to review SwiftUI code for accessibility issues. These prompts can help identify common accessibility problems and suggest improvements to make your SwiftUI apps more inclusive.

## Quick Start

1. Copy `accessibility.instructions.md` to your repository's `.github/instructions/` directory
2. Configure automatic reviews in your repository settings (see [Automatic Review Setup](#automatic-review-setup))
3. Create a pull request - Copilot will automatically review your SwiftUI code for accessibility compliance

## Setup

Before using the accessibility review prompts, you need to set up the instruction files in your repository:

1. Create the `.github/instructions` directory in your repository if it doesn't exist
2. Copy `accessibility.instructions.md` (or `accessibility.ja.instructions.md` for Japanese) to that directory

## Files

This repository contains the following instruction files:

- **`accessibility.instructions.md`** - English version of accessibility review instructions for SwiftUI code
- **`accessibility.ja.instructions.md`** - Japanese version (日本語版) of accessibility review instructions

Both files contain the same accessibility checking rules and examples. Choose the one that matches your team's language preference.

## Usage

### Manual Review Request

1. Create a pull request with your SwiftUI code changes
2. Request a review from GitHub Copilot
3. Copilot will use the instructions in `.github/instructions/accessibility.instructions.md` to review your code
4. Follow the suggestions to improve accessibility

### Automatic Review Setup

To enable automatic Copilot code reviews:

1. Ensure you have completed the [Setup](#setup) steps above
2. Go to your repository **Settings**
3. Navigate to **Rulesets** and create a new ruleset
4. Enable **Automatically request Copilot code review**
5. Copilot will automatically review pull requests using the accessibility prompts from `.github/instructions/`

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues with additional prompt examples or improvements.

## Resources

- [Apple Accessibility Documentation](https://developer.apple.com/accessibility/)
- [SwiftUI Accessibility Guide](https://developer.apple.com/documentation/swiftui/accessibility)
- [WCAG Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
