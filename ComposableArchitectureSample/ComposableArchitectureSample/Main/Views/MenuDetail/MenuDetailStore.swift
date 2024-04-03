//
//  MenuDetailStore.swift
//  ComposableArchitectureSample
//
//  Created by Dennis van Mazijk on 2024/04/03.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct MenuDetailStore {
    @ObservableState
    struct State: Equatable {
        var category: Category
    }

    enum Action {
        case goToRoot
        case caloriesTapped(Category)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
