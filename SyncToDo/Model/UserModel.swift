//
//  UserModel.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 19/05/25.
//

import Foundation

@MainActor
class UserModel: ObservableObject {
    @Published var users: [User] = []
    private var notion: NotionAPI

    init() {
        let token = ProcessInfo.processInfo.environment["NOTION_TOKEN"] ?? ""
        self.notion = NotionAPI().connect(token: token)

        Task {
            await loadUsers()
        }
    }

    func loadUsers() async {
        do {
            self.users = try await notion.fetchUsers()
        } catch {
            print("Errore nel fetch utenti:", error)
        }
    }
}
