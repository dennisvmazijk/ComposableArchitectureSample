//
//  Food.swift
//  NavigationStackSample
//
//  Created by Dennis van Mazijk on 2023/12/04.
//

import Foundation

enum Food: CaseIterable {
    case icecream
    case frenchfries
    case pizza

    static var random: Self {
        Self.allCases.randomElement()!
    }

    var image: String {
        switch self {
        case .icecream:
            return "icecream"
        case .frenchfries:
            return "frenchfries"
        case .pizza:
            return "pizza"
        }
    }

    var name: String {
        switch self {
        case .icecream:
            return "アイスクリーム"
        case .frenchfries:
            return "フライドポテト"
        case .pizza:
            return "ピザ"
        }
    }

    var calories: String {
        switch self {
        case .icecream:
            return "250"
        case .frenchfries:
            return "450"
        case .pizza:
            return "1200"
        }
    }
}
