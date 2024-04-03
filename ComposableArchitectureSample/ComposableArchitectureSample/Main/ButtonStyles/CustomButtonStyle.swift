//
//  CustomButtonStyle.swift
//  NavigationStackSample
//
//  Created by Dennis van Mazijk on 2023/12/05.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .bold()
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
