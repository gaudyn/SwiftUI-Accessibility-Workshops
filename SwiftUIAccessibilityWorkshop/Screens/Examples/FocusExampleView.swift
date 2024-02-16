import SwiftUI

struct FocusExampleView: View {
    private enum focusedElement {
        case text1, text2
    }
    
    @AccessibilityFocusState private var elementFocusedByVoiceOver: focusedElement?
    
    var body: some View {
        VStack {
            Button(
                action: { elementFocusedByVoiceOver = .text1 },
                label: { Text("Przejdź do tekstu 1")}
            )
            Button(
                action: { elementFocusedByVoiceOver = .text2 },
                label: { Text("Przejdź do tekstu 2")}
            )
            Text("Tekst 1")
                .accessibilityFocused($elementFocusedByVoiceOver, equals: .text1)
            Text("Tekst 2")
                .accessibilityFocused($elementFocusedByVoiceOver, equals: .text2)
        }
        .padding()
    }
}

#Preview {
    FocusExampleView()
}
