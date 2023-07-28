//
//  ContentView.swift
//  SliderGame
//
//  Created by Egor Kruglov on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var sliderValue = Double.random(in: 0...100).rounded()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                UISliderRepresentation(value: $sliderValue)
                Text("100")
            }
            
            Button("Проверь меня") {
                
            }
            
            Button("Начать заново") {
                
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
