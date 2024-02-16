import SwiftUI

struct ListingExerciseView: View {
    @State private var listingData: [ListingData] = ListingData.exampleData
    
    var body: some View {
        List(Array(listingData.enumerated()), id: \.offset) { index, _ in
            ListingCell(data: $listingData[index])
        }
        .listStyle(.plain)
    }
}

private struct ListingCell: View {
    @Binding var data: ListingData
    
    var body: some View {
        HStack(alignment: .top) {
            Image(uiImage: data.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(4)
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button(action: {
                        data.isFavorite.toggle()
                    }, label: {
                        Image(systemName: data.isFavorite ? "heart.fill" : "heart")
                            .font(.largeTitle)
                            .foregroundStyle(.pink)
                    })
                }
                Text(data.title)
                    .font(.title2)
                Text(data.price)
                    .font(.title)
                Text("\(data.priceWithDelivery) z dostawą")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

private struct ListingData {
    var title: String
    var price: String
    var priceWithDelivery: String
    var image: UIImage
    var isFavorite: Bool = false
    
    static var exampleData: [ListingData] = [
        .init(
            title: "iPhone",
            price: "2000 zł",
            priceWithDelivery: "2010 zł",
            image: UIImage(systemName: "iphone")!
        ),
        .init(
            title: "Fajny telewizor",
            price: "3500 zł",
            priceWithDelivery: "3600 zł",
            image: UIImage(systemName: "tv")!
        ),
        .init(
            title: "młotek",
            price: "20 zł",
            priceWithDelivery: "28 zł",
            image: UIImage(systemName: "hammer") ?? UIImage()
        )
    
    ]
}

#Preview {
    ListingView()
}
