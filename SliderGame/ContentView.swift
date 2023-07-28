//
//  ContentView.swift
//  SliderGame
//
//  Created by Egor Kruglov on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = 0
    @State private var sliderValue = 0.0
    @State private var score = 0
    @State private var isAlerPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                UISliderRepresentation(value: $sliderValue)
                Text("100")
            }
            
            Button("Проверь себя") {
                score = computeScore()
                isAlerPresented.toggle()
            }
            .alert("Ваш результат:", isPresented: $isAlerPresented, actions: {}) {
                Text("\(score)")
            }
            
            Button("Начать заново") {
                randomizeValues()
            }
        }
        .padding()
        .onAppear(perform: randomizeValues)
    }
    
    private func randomizeValues() {
        targetValue = Int.random(in: 0...100)
        sliderValue = Double.random(in: 0...100).rounded()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
