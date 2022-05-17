//
//  RGBView.swift
//  RGBSligerSUI
//
//  Created by Pavel Metelin on 17.05.2022.
//

import SwiftUI

struct RGBView: View {
    let red: Double
    let green: Double
    let blue: Double
    var color: Color {
        Color(red: CGFloat(red/255),
              green: CGFloat(green/255),
              blue: CGFloat(blue/255))
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(color)
            .frame(width: 320, height: 200)
            .shadow(color: color, radius: 15, x: 0, y: 0)
    }
}

struct RGBView_Previews: PreviewProvider {
    static var previews: some View {
        RGBView(red: 1, green: 1, blue: 1)
    }
}
