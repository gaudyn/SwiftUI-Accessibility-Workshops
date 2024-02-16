import SwiftUI

struct TraitsExampleView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("Napis")
                .accessibilityAddTraits(.isButton)
            Text("Napis")
                .accessibilityAddTraits(.isHeader)
            Text("Napis")
                .accessibilityAddTraits(.isLink)
            Text("Napis")
                .accessibilityAddTraits(.isSelected)
        }
        .padding()
    }
}

#Preview {
    TraitsExampleView()
}
