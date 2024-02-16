import SwiftUI

struct RotorExampleView: View {
    
    let places = Place.createRandomData()
    var openedPlaces: [Place] {
        places.filter {$0.isOpen}
    }
    
    var body: some View {
        List(places, id: \.id) { place in
            HStack {
                Text(place.name)
                    .font(.headline)
                Spacer()
                Text(place.isOpen ? "✅" : "⛔️")
                    .accessibilityLabel(place.isOpen ? "Otwarte" : "Zamknięte")
            }
            .accessibilityElement(children: .combine)
            .padding()
        }
        .accessibilityElement(children: .contain)
        .accessibilityRotor("Otwarte", entries: openedPlaces, entryID: \.id, entryLabel: \.name)
    }
}

struct Place: Identifiable {
    var name: String
    var isOpen: Bool
    var id: UUID = .init()
    
    static func createRandomData() -> [Place] {
        let possibleNames = ["Kawiarnia", "Restauracja", "Cukiernia", "Piekarnia"]
        var places = [Place]()
        for _ in 1...40 {
            places.append(
                Place(
                    name: possibleNames.randomElement()!,
                    isOpen: [true, false].randomElement()!)
            )
        }
        return places
    }
}

#Preview {
    RotorExampleView()
}
