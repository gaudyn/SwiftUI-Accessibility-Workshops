import SwiftUI

struct BasicFormView: View {
    @State private var textfield1Value: String = ""
    @State private var textfield2Value: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Prosty formularz")
            textfield(label: "Email", placeholder: "jan.kowalski@mail.pl", value: $textfield1Value)
            Text("To pole zawiera błędy")
                .font(.caption)
                .foregroundStyle(.red)
            Text("Na ten email będziemy wysyłać Twoje faktury")
                .font(.caption)
            textfield(label: "Telefon", placeholder: "123456789", value: $textfield2Value)
            Text("To pole zawiera błędy")
                .font(.caption)
                .foregroundStyle(.red)
            Text("Na ten numer będziemy wysyłać Ci jednorazowe kody do logowania")
                .font(.caption)
        }
        .padding()
    }
    
    func textfield(label: String, placeholder: String, value text: Binding<String>) -> some View {
        // Bardzo nam zależy, żeby VoiceOver przeczytało 'Pole tekstowe' tutaj
        HStack {
            Text(label)
                .accessibilityHidden(true)
            TextField(text: text, label: { Text(placeholder) })
                .accessibilityLabel(label)
                .accessibilityValue(text.wrappedValue.isEmpty ? placeholder : text.wrappedValue)
        }
        .padding()
        .border(.black)
    }
}

#Preview {
    BasicFormView()
}
