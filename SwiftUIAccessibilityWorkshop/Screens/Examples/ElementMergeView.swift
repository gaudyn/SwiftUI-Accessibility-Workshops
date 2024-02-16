import SwiftUI

struct ElementMergeView: View {
    var body: some View {
        VStack(spacing: 32) {
            Text("Bez łączenia")
            HStack {
                exampleStack
                exampleStack
            }
            Text("Contain")
            HStack {
                exampleStack
                    .accessibilityElement(children: .contain)
                exampleStack
                    .accessibilityElement(children: .contain)
            }
            Text("Combine")
            exampleStack
                .accessibilityElement(children: .combine)
                .accessibilitySortPriority(0)
            Text("Ignore")
            exampleStack
                .accessibilityElement(children: .ignore)
        }
    }
    
    var exampleStack: some View {
        VStack {
            Text("Tekst pierwszy")
            Text("Tekst drugi")
            Text("Tekst trzeci")
        }
    }
}

#Preview {
    ElementMergeView()
}
