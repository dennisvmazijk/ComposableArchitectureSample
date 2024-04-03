//
//  MenuDetailView.swift
//  NavigationStackSample
//
//  Created by Dennis van Mazijk on 2023/12/18.
//

import SwiftUI
import ComposableArchitecture

struct MenuDetailView: View {
    @Bindable var store: StoreOf<MenuDetailStore>

    var body: some View {
        VStack {
            Image(store.category.image)

            VStack(spacing: 12) {
                NavigationLink {
                    Text("\(store.category.calories) kcal")
                        .font(.system(size: 75))
                        .onAppear {
                            store.send(.caloriesTapped(store.category))
                        }
                } label: {
                    Text("カロリー")
                }
                .buttonStyle(CustomButtonStyle())
                .background(.blue)
                .cornerRadius(12)

                Button {
                    store.send(.goToRoot)
                } label: {
                    Text("一覧に戻る")
                }
                .buttonStyle(CustomButtonStyle())
                .background(.pink)
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle(store.category.title)
    }
}
