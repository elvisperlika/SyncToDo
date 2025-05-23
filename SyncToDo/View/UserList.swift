//
//  UserList.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 21/05/25.
//

import SwiftUI

struct UserList: View {
    @Binding var users: [User]
    
    init(users: Binding<[User]>) {
        self._users = users
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List($users) { $user in
            UserRow(user: $user)
                .listRowBackground(Color.clear)
        }
        .background(.clear)
    }
}
