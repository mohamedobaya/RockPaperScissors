//
//  customModifiers.swift
//  RockPaperScissors
//
//  Created by Mohamed Obaya on 28/04/2025.
//


import SwiftUI


struct ComputerChoiceStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .font(.system(size: 180))
            .minimumScaleFactor(0.01)
    }
}

struct ChoiceButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .background(LinearGradient(colors: [.cyan, .blue, .indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
            .font(.system(size: 100))
            .minimumScaleFactor(0.01)
            .aspectRatio(contentMode: .fit)
            .clipShape(.rect(cornerRadius: 20))
    }
}

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.ultraThickMaterial)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleStyle())
    }
    
    func computerChoiceStyle() -> some View {
        modifier(ComputerChoiceStyle())
    }
    
    func choiceButtonStyle() -> some View{
        modifier(ChoiceButtonStyle())
    }
}
