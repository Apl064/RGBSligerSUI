//
//  ContentView.swift
//  RGBSligerSUI
//
//  Created by Pavel Metelin on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    @State private var sliderValue = Double.random(in: 0...255)
    
    @State private var tempText = "333"
    
    var body: some View {
        
        ZStack {
            backgroudColor
            
            VStack(spacing: 40) {
                RGBView(red: sliderValue,
                        green: sliderValue,
                        blue: sliderValue)
                
                VStack(spacing: 10) {
                    CustomSliderView(value: $sliderValue,
                                     valueText: $sliderValue, color: .red)
//                    HStack(spacing: 8) {
//                        Text("R: \(lround(sliderValue))")
//                            .frame(width: 55, height: 30, alignment: .leading)
//                        Text("0")
//                            .foregroundColor(.red)
//                        Slider(value: $sliderValue, in: 0...255, step: 1)
//                            .tint(.red)
//                        Text("255")
//                            .foregroundColor(.red)
//                        TextField("", text: $tempText)
//                            .frame(width: 35, height: 30, alignment: .center)
//                            .border(.black, width: 1)
//                    }.padding(.horizontal, 8)
                    
                    HStack(spacing: 8) {
                        Text("G: \(lround(sliderValue))")
                            .frame(width: 55, height: 30, alignment: .leading)
                        Text("0")
                            .foregroundColor(.green)
                        Slider(value: $sliderValue, in: 0...255, step: 1)
                            .tint(.green)
                        Text("255")
                            .foregroundColor(.green)
                        TextField("", text: $tempText)
                            .frame(width: 35, height: 30, alignment: .center)
                            .border(.black, width: 1)
                    }.padding(.horizontal, 8)
                    
                    HStack(spacing: 8) {
                        Text("B: \(lround(sliderValue))")
                            .frame(width: 55, height: 30, alignment: .leading)
                        Text("0")
                            .foregroundColor(.blue)
                        Slider(value: $sliderValue, in: 0...255, step: 1)
                            .tint(.blue)
                        Text("255")
                            .foregroundColor(.blue)
                        TextField("", text: $tempText)
                            .frame(width: 35, height: 30, alignment: .center)
                            .border(.black, width: 1).tint(.red)
                    }.padding(.horizontal, 8)
            }
                Spacer()
            }.padding()
        }
    }
}

private var backgroudColor: some View {
    Color(cgColor: CGColor(red: 229/255,
                           green: 229/255,
                           blue: 229/255,
                           alpha: 1))
        .ignoresSafeArea()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
