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
        UserList(users: $model.users)
    }
}

#Preview {
    ContentView()
}
