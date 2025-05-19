//
//  ContentView.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 18/05/25.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @StateObject private var model = UserModel()

    var body: some View {
        NavigationView {
            List(model.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name).bold()
                    Text(user.mail).font(.subheadline).foregroundColor(.gray)
                }
            }
            .navigationTitle("Utenti")
        }
    }
}

#Preview {
    ContentView()
}
