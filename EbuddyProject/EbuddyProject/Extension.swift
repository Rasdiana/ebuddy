//
//  Extension.swift
//  EbuddyProject
//
//  Created by Rasdiana Sari on 20/12/24.
//

import SwiftUICore

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
extension Int {
    var stringValue:String {
        return "\(self)"
    }
}
