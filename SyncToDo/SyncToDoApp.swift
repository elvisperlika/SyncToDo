//
//  SyncToDoApp.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 18/05/25.
//

import SwiftUI

@main
struct SyncToDoApp: App {
    init() {
        fun()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

}

func fun() -> Void {
    
    let notionToken = ProcessInfo.processInfo.environment["NOTION_TOKEN"] ?? ""
    let notion = NotionAPI().connect(token: notionToken)
    notion.getUsers()
}
