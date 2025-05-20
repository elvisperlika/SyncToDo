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
        // let token = ProcessInfo.processInfo.environment["NOTION_TOKEN"] ?? ""
        let token = loadNotionToken()
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

func loadNotionToken() -> String {
    guard let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
          let data = try? Data(contentsOf: url),
          let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any],
          let key = plist["NOTION_TOKEN"] as? String else {
        fatalError("Chiave NOTION_KEY non trovata in Secrets.plist")
    }
    return key
}

