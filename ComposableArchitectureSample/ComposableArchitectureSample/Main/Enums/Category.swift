//
//  Category.swift
//  NavigationStackSample
//
//  Created by Dennis van Mazijk on 2023/12/12.
//

import Foundation

enum Category: Hashable {
    case food(Food)
    case drink(Drink)

    var image: String {
        switch self {
        case .food(let food):
            return food.image
        case .drink(let drink):
            return drink.image
        }
    }

    var title: String {
        switch self {
        case .food(let food):
            return food.name
        case .drink(let drink):
            return drink.name
        }
    }

    var calories: Int {
        switch self {
        case .food(let food):
            return food.calories
        case .drink(let drink):
            return drink.calories
        }
    }
}
