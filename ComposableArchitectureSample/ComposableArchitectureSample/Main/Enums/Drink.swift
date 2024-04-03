//
//  Drink.swift
//  NavigationStackSample
//
//  Created by Dennis van Mazijk on 2023/12/05.
//

import SwiftUI

enum Drink: CaseIterable {
    case coffee
    case juice

    static var random: Self {
        Self.allCases.randomElement()!
    }

    var image: String {
        switch self {
        case .coffee:
            return "coffee"
        case .juice:
            return "juice"
        }
    }

    var name: String {
        switch self {
        case .coffee:
            return "コーヒー"
        case .juice:
            return "ジュース"
        }
    }

    var calories: String {
        switch self {
        case .coffee:
            return "10"
        case .juice:
            return "120"
        }
    }
}
