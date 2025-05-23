//
//  UserDetail.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 21/05/25.
//

import SwiftUI

struct UserDetail: View {
    @Binding var user: User
    
    var body: some View {
        Text("to fill")
            .navigationTitle(user.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

