//
//  Notion.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 19/05/25.
//
import Foundation

class NotionAPI: ObservableObject {
    
    var token: String = ""
    
    func connect(token: String) -> NotionAPI {
        self.token = token
        return self
    }
    
    func fetchUsers() async throws -> [User] {
        print("fetching")
        let url = URL(string: "https://api.notion.com/v1/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        request.addValue("2022-06-28", forHTTPHeaderField: "Notion-Version")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, _) = try await URLSession.shared.data(for: request)
        
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let results = json["results"] as? [[String: Any]] else {
            print("Formato JSON inatteso")
            return []
        }
        
        var newUsers: [User] = []
        for user in results {
            if let type = user["type"] as? String, type == "person" {
                let name = user["name"] as? String ?? "Sconosciuto"
                if let person = user["person"] as? [String: Any],
                   let mail = person["email"] as? String {
                    let newUser = User(name: name, mail: mail)
                    newUsers.append(newUser)
                }
            }
        }
        return newUsers
    }
}
