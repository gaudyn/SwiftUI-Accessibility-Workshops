import SwiftUI

struct GiftCardView: View {
    private var data: GiftCardsPreviewData = GiftCardsPreviewData(
        title: "50,00 zł",
        subtitle: "Karta podarunkowa",
        description: "na zakupy w kategorii Kultura i rozrywka oraz Sport i turystyka",
        bottomLabel: "Ważna jeszcze 26 dni"
    )
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                amountBody
                textBody
            }.overlay(RoundedRectangle(cornerRadius: 4.0)
                .strokeBorder(.black, lineWidth: 1.0))
        }.padding([.leading, .trailing])
            .accessibilitySortPriority(0)
            .accessibilityElement(children: .combine)
    }
    
    var amountBody: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "gift")
                    .renderingMode(.template)
                    .foregroundColor(.orange)
                    .padding(.leading)
                    .accessibilityHidden(true)
                Text(data.title)
                    .font(.headline)
                Spacer()
            }
            .padding([.top, .bottom])
            .accessibilitySortPriority(0)
            Text(data.subtitle)
                .font(.subheadline).bold()
                .padding(.leading)
                .accessibilitySortPriority(1)
        }
        // Tego nam brakowało na warsztatach -> wtedy cały VStack ma SortPriority 1
        .accessibilityElement(children: .combine)
    }

    var textBody: some View {
        VStack(alignment: .leading) {
            Text(data.description)
                .font(.body)
                .padding(.leading)
            Text(data.bottomLabel)
                .font(.caption)
                .foregroundColor(.secondary)
                .padding([.leading, .top, .bottom])
        }
    }
}

private struct GiftCardsPreviewData: Codable, Equatable {
    let title: String
    let subtitle: String
    let description: String
    let bottomLabel: String
}

#Preview {
    GiftCardView()
}
