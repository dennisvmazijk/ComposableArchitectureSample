//
//  MenuListView.swift
//  NavigationStackSample
//
//  Created by Dennis van Mazijk on 2023/12/05.
//
//

import SwiftUI
import ComposableArchitecture

struct MenuListView: View {
    @Bindable var store: StoreOf<MenuListStore>

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            List {
                Section("食べ物") {
                    ForEach(Food.allCases, id: \.self) { food in
                        NavigationLink(state: MenuListStore.Path.State.foodDetail(MenuDetailStore.State(category: .food(food)))) {
                            Text(food.name)
                        }
                    }
                }
                Section("飲み物") {
                    ForEach(Drink.allCases, id: \.self) { drink in
                        NavigationLink(state: MenuListStore.Path.State.drinkDetail(MenuDetailStore.State(category: .drink(drink)))) {
                            Text(drink.name)
                        }
                    }
                }
            }
            .navigationTitle("メニュー")
        } destination: { store in
            switch store.case {
            case let .foodDetail(store):
                MenuDetailView(store: store)
                    .toolbar { foodToolbar }
            case let .drinkDetail(store):
                MenuDetailView(store: store)
                    .toolbar { drinkToolbar }
            }
        }
    }

    @ToolbarContentBuilder
    var foodToolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                store.send(.addRandomPath(.drink(Drink.random)))
            } label: {
                Text("ランダム飲み物")
                    .foregroundColor(.blue)
            }
        }
    }

    @ToolbarContentBuilder
    var drinkToolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                store.send(.addRandomPath(.food(Food.random)))
            } label: {
                Text("ランダム食べ物")
                    .foregroundColor(.blue)
            }
        }
    }
}
