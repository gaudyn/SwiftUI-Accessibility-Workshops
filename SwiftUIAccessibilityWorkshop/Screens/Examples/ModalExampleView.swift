import SwiftUI

struct ModalExampleView: View {
    @State var isModalShown: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 32) {
                Text(Constants.firstParagraph)
                Button(action: {
                    isModalShown = true
                }, label: {
                    Text("Show modal")
                })
                Text(Constants.secondParagraph)
            }
            .padding()
            if isModalShown {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .transition(.opacity)
                VStack {
                    HStack{ 
                        Spacer()
                        Button(action: {
                            isModalShown = false
                        }, label: {
                            Image(systemName: "xmark")
                                .padding()
                        })
                    }
                    Text(Constants.firstParagraph)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(
                    Color.white.ignoresSafeArea()
                )
                .accessibilityAddTraits(.isModal)
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.easeInOut, value: isModalShown)
    }
}

private struct Constants {
    static let firstParagraph = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium venenatis tellus venenatis euismod. Integer efficitur semper mi in consequat. Nunc auctor auctor malesuada. Quisque eu sapien at lorem rutrum lobortis at quis leo. Aliquam a tortor sapien. Aenean condimentum nisl quis tortor finibus iaculis. Sed urna neque, commodo vel dui vitae, dictum imperdiet nibh. Sed suscipit quam at elementum rutrum. Morbi porta risus quis mollis dapibus. Aliquam egestas nulla in lorem tincidunt, eget volutpat justo blandit. Quisque lobortis ullamcorper bibendum."
    static let secondParagraph = "Praesent ut lacus a tellus sollicitudin viverra at eu nulla. Suspendisse potenti. Nullam ut elit ac ex porta dignissim ac sed felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus dapibus feugiat turpis, vitae tincidunt neque finibus vel. Aliquam vehicula justo id arcu condimentum elementum. Nulla vulputate consequat felis, nec feugiat tellus elementum ac. Suspendisse potenti. Integer accumsan vehicula aliquam. Nunc vitae iaculis elit, condimentum suscipit augue. Phasellus eu tristique urna."
}

#Preview {
    ModalExampleView()
}
