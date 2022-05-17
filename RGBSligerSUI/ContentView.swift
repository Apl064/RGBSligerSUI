//
//  ContentView.swift
//  RGBSligerSUI
//
//  Created by Pavel Metelin on 16.05.2022.
//

import SwiftUI

private enum RGBTextField {
    case redTF
    case greenTF
    case blueTF
}

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    @State private var redTFValue = ""
    @State private var greenTFValue = ""
    @State private var blueTFValue = ""
    
    var body: some View {
        
        ZStack {
            backgroudColor
            VStack(spacing: 40) {
                RGBView(red: redSliderValue,
                        green: greenSliderValue,
                        blue: blueSliderValue)
                VStack(spacing: 10) {
                    
                    HStack(spacing: 8) {
                        Text("\(lround(redSliderValue))")
                            .frame(width: 35, height: 30, alignment: .leading)
                        Slider(value: $redSliderValue, in: 0...255, step: 1)
                            .tint(.red)
                            .onChange(of: redSliderValue) { newValue in
                                redTFValue = "\(lround(redSliderValue))"
                            }
                            .onAppear {
                                redTFValue = "\(lround(redSliderValue))"
                            }
                        TextField("", text: $redTFValue)
                            .frame(width: 35, height: 30, alignment: .center)
                            .border(.black, width: 1)
                            .onSubmit {
                                checkTFValue(inputText: redTFValue,
                                             txtField: .redTF)
                            }
                            .onChange(of: redTFValue) { newValue in
                                guard let isNum = Double(redTFValue) else {
                                    redTFValue = ""
                                    return
                                }
                                redTFValue = String(format: "%.f", isNum)
                            }
                    }.padding(.horizontal, 8)
                    
                    HStack(spacing: 8) {
                        Text("\(lround(greenSliderValue))")
                            .frame(width: 35, height: 30, alignment: .leading)
                        Slider(value: $greenSliderValue, in: 0...255, step: 1)
                            .tint(.green)
                            .onChange(of: greenSliderValue) { newValue in
                                greenTFValue = "\(lround(greenSliderValue))"
                            }
                            .onAppear {
                                greenTFValue = "\(lround(greenSliderValue))"
                            }
                        TextField("", text: $greenTFValue)
                            .frame(width: 35, height: 30, alignment: .center)
                            .border(.black, width: 1)
                            .onSubmit {
                                checkTFValue(inputText: greenTFValue,
                                             txtField: .greenTF)
                            }
                            .onChange(of: greenTFValue) { newValue in
                                guard let isNum = Double(greenTFValue) else {
                                    greenTFValue = ""
                                    return
                                }
                                greenTFValue = String(format: "%.f", isNum)
                            }
                    }.padding(.horizontal, 8)
                    
                    HStack(spacing: 8) {
                        Text("\(lround(blueSliderValue))")
                            .frame(width: 35, height: 30, alignment: .leading)
                        Slider(value: $blueSliderValue, in: 0...255, step: 1)
                            .tint(.blue)
                            .onChange(of: blueSliderValue) { newValue in
                                blueTFValue = "\(lround(blueSliderValue))"
                            }
                            .onAppear {
                                blueTFValue = "\(lround(blueSliderValue))"
                            }
                        TextField("", text: $blueTFValue)
                            .frame(width: 35, height: 30, alignment: .center)
                            .border(.black, width: 1)
                            .onSubmit {
                                checkTFValue(inputText: blueTFValue,
                                             txtField: .blueTF)
                            }
                            .onChange(of: blueTFValue) { newValue in
                                guard let isNum = Double(blueTFValue) else {
                                    blueTFValue = ""
                                    return
                                }
                                blueTFValue = String(format: "%.f", isNum)
                            }
                    }.padding(.horizontal, 8)
                }
                Spacer()
            }.padding()
        }
    }
    
    private func checkTFValue(inputText: String, txtField: RGBTextField) {
        switch txtField {
        case .redTF:
            guard let newNumber = Double(inputText), newNumber <= 255 else {
                redTFValue = String(255)
                redSliderValue = 255
                return
            }
            redTFValue = String(format: "%.f", newNumber)
            redSliderValue = newNumber
        case .greenTF:
            guard let newNumber = Double(inputText), newNumber <= 255 else {
                greenTFValue = String(255)
                greenSliderValue = 255
                return
            }
            greenTFValue = String(format: "%.f", newNumber)
            greenSliderValue = newNumber
        case .blueTF:
            guard let newNumber = Double(inputText), newNumber <= 255 else {
                blueTFValue = String(255)
                blueSliderValue = 255
                return
            }
            blueTFValue = String(format: "%.f", newNumber)
            blueSliderValue = newNumber
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
