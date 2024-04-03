//
//  MenuDetailView.swift
//  NavigationStackSample
//
//  Created by Dennis van Mazijk on 2023/12/18.
//

import SwiftUI

struct MenuDetailView: View {
    @Binding var path: NavigationPath

    var category: Category

    var body: some View {
        VStack {
            Image(category.image)

            VStack(spacing: 12) {
                NavigationLink {
                    Text("\(category.calories) kcal")
                        .font(.system(size: 75))
                } label: {
                    Text("カロリー")
                }
                .buttonStyle(CustomButtonStyle())
                .background(.blue)
                .cornerRadius(12)

                Button {
                    path.removeLast(path.count)
                } label: {
                    Text("一覧に戻る")
                }
                .buttonStyle(CustomButtonStyle())
                .background(.pink)
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle(category.title)
    }
}
