import SwiftUI

struct DeliveryExerciseView: View {
    
    @StateObject private var viewModel: DeliveryViewModel = DeliveryViewModel()
    
    var body: some View {
        List(Array(viewModel.methods.enumerated()), id: \.offset) { index, method in
            DeliveryMethodView(method: method)
                .onTapGesture {
                    viewModel.selectMethod(at: index)
                }
        }
    }
}

private struct DeliveryMethodView: View {
    var method: DeliveryMethod
    
    var body: some View {
        HStack {
            Text(method.title)
            Spacer()
            Text(method.price)
            if method.isSelected {
                Image(systemName: "checkmark")
                    .frame(width: 30, height: 30)
            } else {
                Color.clear
                    .contentShape(.rect)
                    .frame(width: 30, height: 30)
            }
        }
    }
}

private final class DeliveryViewModel: ObservableObject {
    var methods: [DeliveryMethod] = [
        .init(title: "Paczkomat inPost", price: "10 zł", isSelected: true),
        .init(title: "Kurier", price: "16 zł"),
        .init(title: "Allegro OneBox", price: "8 zł")
    ]
    
    func selectMethod(at index: Int) {
        for (i, _) in methods.enumerated() {
            methods[i].isSelected = false
        }
        methods[index].isSelected = true
        objectWillChange.send()
    }
}

private struct DeliveryMethod {
    var title: String
    var price: String
    var isSelected: Bool = false
}

#Preview {
    DeliveryView()
}
