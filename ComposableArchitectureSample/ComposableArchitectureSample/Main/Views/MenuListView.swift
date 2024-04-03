//
//  MenuListView.swift
//  NavigationStackSample
//
//  Created by Dennis van Mazijk on 2023/12/05.
//
//
import SwiftUI

struct MenuListView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("食べ物") {
                    ForEach(Food.allCases, id: \.self) { food in
                        NavigationLink(value: food) {
                            Text(food.name)
                        }
                    }
                }
                Section("飲み物") {
                    ForEach(Drink.allCases, id: \.self) { drink in
                        NavigationLink(value: drink) {
                            Text(drink.name)
                        }
                    }
                }
            }
            .navigationTitle("メニュー")
            .navigationDestination(for: Food.self) { food in
                MenuDetailView(path: $path, category: .food(food))
                    .toolbar { foodToolbar }
            }
            .navigationDestination(for: Drink.self) { drink in
                MenuDetailView(path: $path, category: .drink(drink))
                    .toolbar { drinkToolbar }
            }
        }
    }

    @ToolbarContentBuilder
    var foodToolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                path.append(Drink.random)
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
                path.append(Food.random)
            } label: {
                Text("ランダム食べ物")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    MenuListView()
}
