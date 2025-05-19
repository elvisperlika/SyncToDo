//
//  Notion.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 19/05/25.
//
import Foundation

struct NotionAPI {
    
    var notionToken: String = ""
    
    func connect(token: String) -> NotionAPI {
        var notion = NotionAPI()
        notion.notionToken = token
        return notion
    }
    
    func getUsers() -> Void {
        let url = URL(string: "https://api.notion.com/v1/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.addValue("Bearer " + notionToken, forHTTPHeaderField: "Authorization")
        request.addValue("2022-06-28", forHTTPHeaderField: "Notion-Version")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Errore: \(error)")
                return
            }
            
            guard let data = data else {
                print("Nessun dato ricevuto.")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let results = json["results"] as? [[String: Any]] {
                    print(results)
                } else {
                    print("Formato JSON inatteso")
                }
            } catch {
                print("Errore parsing JSON: \(error)")
            }
            
        }.resume()
    }
    
}
