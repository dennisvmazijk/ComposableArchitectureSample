//
//  ComposableArchitectureSampleApp.swift
//  ComposableArchitectureSample
//
//  Created by Dennis van Mazijk on 2024/04/03.
//

import SwiftUI
import ComposableArchitecture

@main
struct ComposableArchitectureSampleApp: App {
    var body: some Scene {
        WindowGroup {
            MenuListView(store: Store(initialState: MenuListStore.State(),
                                      reducer: { MenuListStore() }))
        }
    }
}
