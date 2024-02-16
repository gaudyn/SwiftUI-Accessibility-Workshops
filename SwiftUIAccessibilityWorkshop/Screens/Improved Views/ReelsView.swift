//
//  ReelsView.swift
//  SwiftUIAccessibilityWorkshop
//
//  Created by Gniewomir Gaudyn on 13/02/2024.
//

import SwiftUI

struct ReelsView: View {
    var reels: [Reel] = Reel.createData()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Rolki")
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            ScrollView(.horizontal) {
                HStack{
                    ForEach(reels, id: \.name) { reel in
                        reelCell(for: reel)
                    }
                }
            }
            Text("Posty")
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
                .padding(.top)
            Text(Constants.exampleText)
        }
        .padding(.horizontal)
    }
    
    func reelCell(for data: Reel) -> some View {
        VStack {
            Image(systemName: "person")
                .foregroundStyle(data.color)
                .frame(width: 40, height: 40)
                .clipShape(.circle)
                .overlay {
                    Circle()
                        .stroke(.black, lineWidth: 1)
                }
                .accessibilityHidden(true)
            Text(data.name)
        }
        .padding(.horizontal)
    }
}

struct Reel {
    var name: String
    var color: Color
    
    static func createData() -> [Reel] {
        
        let possibleColors: [Color] = [.red, .blue, .orange, .purple, .cyan]
        return Array(1...20).map { i in
            Reel(name: "Rolka \(i)", color: possibleColors.randomElement()!)
        }
    }
}

private struct Constants {
    static let exampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium venenatis tellus venenatis euismod. Integer efficitur semper mi in consequat. Nunc auctor auctor malesuada. Quisque eu sapien at lorem rutrum lobortis at quis leo. Aliquam a tortor sapien. Aenean condimentum nisl quis tortor finibus iaculis. Sed urna neque, commodo vel dui vitae, dictum imperdiet nibh. Sed suscipit quam at elementum rutrum. Morbi porta risus quis mollis dapibus. Aliquam egestas nulla in lorem tincidunt, eget volutpat justo blandit. Quisque lobortis ullamcorper bibendum."
}

#Preview {
    ReelsView()
}
