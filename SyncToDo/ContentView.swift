//
//  ContentView.swift
//  SyncToDo
//
//  Created by Elvis Perlika on 18/05/25.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(fun())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

func fun() -> String {
    print("->")
    let url = URL(string: "https://api.notion.com/v1/search")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    request.addValue("Bearer MY_NOTION_TOKEN", forHTTPHeaderField: "Authorization")
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
                for page in results {
                    if let properties = page["properties"] as? [String: Any],
                       let titleProp = properties["title"] as? [String: Any],
                       let titleArray = titleProp["title"] as? [[String: Any]],
                       let firstTitle = titleArray.first,
                       let text = firstTitle["text"] as? [String: Any],
                       let content = text["content"] as? String {
                        print("📄 Titolo pagina: \(content)")
                    }
                }
            } else {
                print("Formato JSON inatteso")
            }
        } catch {
            print("Errore parsing JSON: \(error)")
        }
    }.resume()
    
    return "HELLO WORLD"
}
