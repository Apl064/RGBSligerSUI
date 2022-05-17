//
//  CustomSliderView.swift
//  RGBSligerSUI
//
//  Created by Pavel Metelin on 17.05.2022.
//

import SwiftUI

struct CustomSliderView: View {
    @Binding var value: Double
    @Binding var valueText: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            TextLabel(textValue: "R: \(lround(value))", colorText: .black)
            TextLabel(textValue: "0", colorText: color)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
            TextLabel(textValue: "255", colorText: color)
            TextField(valueTextField: $valueText)
        }.padding(.horizontal, 8)
    }
}

//struct CustomSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSliderView()
//    }
//}

struct TextLabel: View {
    let textValue: String
    let colorText: Color
    
    var body: some View {
        Text(textValue)
            .frame(width: 55, height: 30, alignment: .leading)
            .foregroundColor(colorText)
    }
}

struct TextField: View {
    @Binding var valueTextField: String
    
    var body: some View {
        TextField(valueTextField: $valueTextField)
            .frame(width: 35, height: 30, alignment: .center)
            .border(.black, width: 1)
    }
}
