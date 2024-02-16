import SwiftUI

struct DescriptionExampleView: View {
    @State var counter: Int = 0
    @State var counter2: Int = 0
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Napis")
            
            Text("Napis ze zmienioną labelką")
                .accessibilityLabel("Napis")
            
            Text("Zwiększ licznik \(counter)")
            .accessibilityLabel("Zwiększ licznik")
            .accessibilityValue("\(counter)")
            .accessibilityAction {
                counter += 1
            }
            
            Button(action: {}, label: {
                Text("Super przycisk")
            })
            .accessibilityHint("Nic nie robi")
        }
    }
}

#Preview {
    DescriptionExampleView()
}
