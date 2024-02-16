import SwiftUI

struct BaseView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(Screen.allCases, id: \.rawValue) { screen in
                    NavigationLink(screen.rawValue, value: screen)
                }
            }
            .navigationTitle("Dostępność w SwiftUI")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationDestination(for: Screen.self) { screen in
                screen.getView()
            }
        }
    }
}

enum Screen: String, CaseIterable, Hashable {
    
    case elementsExample = "Przykład z łączeniem elementów"
    case giftCard = "Podgląd karty podarunkowej"
    case descriptionExample = "Przykład z opisem"
    case traitsExample = "Przykład z cechami"
    case modalExample = "Przykład modalu"
    case deliveryMethods = "Metody dostawy"
    case actionsExample = "Przykład z czynnościami"
    case reels = "Rolki"
    case rotorExample = "Przykład z pokrętłem"
    case listing = "Listing"
    case focusExample = "Przykład z focusem"
    case formExample = "Formularz"
    
    @ViewBuilder
    func getView() -> some View {
        switch self {
        case .elementsExample: ElementMergeView()
        case .giftCard: GiftCardView()
        case .modalExample: ModalExampleView()
        case .traitsExample: TraitsExampleView()
        case .actionsExample: ActionsExampleView()
        case .descriptionExample: DescriptionExampleView()
        case .deliveryMethods: DeliveryView()
        case .listing: ListingView()
        case .reels: ReelsView()
        case .rotorExample: RotorExampleView()
        case .focusExample: FocusExampleView()
        case .formExample: BasicFormView()
        }
    }
}

#Preview {
    BaseView()
}
