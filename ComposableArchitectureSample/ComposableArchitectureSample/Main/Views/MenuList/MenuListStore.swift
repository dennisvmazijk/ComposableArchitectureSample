//
//  MenuListStore.swift
//  ComposableArchitectureSample
//
//  Created by Dennis van Mazijk on 2024/04/03.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct MenuListStore {
    @ObservableState
    struct State: Equatable {
        var path = StackState<Path.State>()
    }

    enum Action {
        case path(StackAction<Path.State, Path.Action>)
        case addRandomPath(Category)
    }

    @Reducer(state: .equatable)
    enum Path {
        case foodDetail(MenuDetailStore)
        case drinkDetail(MenuDetailStore)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path(.element(_, action: .foodDetail(.goToRoot))):
                state.path.removeLast(state.path.count)
                return .none
            case .path(.element(_, action: .drinkDetail(.goToRoot))):
                state.path.removeLast(state.path.count)
                return .none
            case .path(.element(_, action: .foodDetail(.caloriesTapped(let category)))):
                if category.calories > 350 {
                    print("Food:", category.title)
                    print("Calories:", category.calories)
                }
                return .none
            case let .addRandomPath(category):
                switch category {
                case .food:
                    state.path.append(.foodDetail(MenuDetailStore.State(category: category)))
                case .drink:
                    state.path.append(.drinkDetail(MenuDetailStore.State(category: category)))
                }
                return .none
            default:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}
