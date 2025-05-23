//
//  User.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 19/05/25.
//

struct User: Identifiable {
    var id: String { mail }
    let name: String
    let mail: String
    var isDone: Bool
}
