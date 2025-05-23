//
//  MyItem.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 21/05/25.
//

enum Status {
    case Done
    case InProgress
    case ToDo
}

struct MyItem {
    var title: String
    var status: Status
    var note: String    
}
