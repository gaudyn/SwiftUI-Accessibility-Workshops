import SwiftUI

struct ActionsExampleView: View {
    @State var lastAction: String = ""
    
    var body: some View {
        Text("Ostatnia czynność: \(lastAction)")
            .accessibilityValue(lastAction)
            .accessibilityAction(.default) {
                lastAction = "Aktywuj"
            }
            .accessibilityAction(.escape) {
                lastAction = "Zamknij"
            }
            .accessibilityAction(.magicTap) {
                lastAction = "Magiczne tapnięcie"
            }
            .accessibilityAction(named: namedActions.show.rawValue) {
                lastAction = namedActions.show.rawValue
            }
            .accessibilityAction(named: namedActions.hide.rawValue) {
                lastAction = namedActions.hide.rawValue
            }
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    lastAction = "Następny"
                case .decrement:
                    lastAction = "Poprzedni"
                default:
                    lastAction = "Regulacja: domyślny"
                }
            }
    }
    
    private enum namedActions: String {
        case show = "Pokaż"
        case hide = "Ukryj"
    }
}

#Preview {
    ActionsExampleView()
}
