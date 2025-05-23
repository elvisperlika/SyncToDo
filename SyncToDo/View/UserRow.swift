//
//  UserRow.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 21/05/25.
//

import SwiftUI

struct UserRow: View {
    @Binding var user: User
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.system(size: 25))
                    .foregroundColor(user.isDone ? .gray : .primary)
                    .strikethrough(user.isDone, color: .gray)
                    .animation(.easeInOut, value: user.isDone)
            }
            Spacer()
        }
        .contentShape(Rectangle()) // <- abilita tap su tutto
        .onTapGesture {
            user.isDone.toggle()
        }
    }
}
