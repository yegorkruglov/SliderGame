//
//  UISliderRepresentation.swift
//  SliderGame
//
//  Created by Egor Kruglov on 28.07.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var value: Double
    @Binding var score: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.sizeToFit()
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didMovedSlider),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        let alpha = Double(score) / 100
        uiView.value = Float(value)
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(alpha))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

struct UISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(value: .constant(50), score: .constant(50))
    }
}


extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func didMovedSlider(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}
