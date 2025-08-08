//
//  JokesViewModel.swift
//  URLSession-Api
//
//  Created by Cihan Yilmaz on 08/08/2025.
//

import Foundation

class JokesViewModel: ObservableObject {
    @Published var category = ""
    @Published var setup = ""
    @Published var delivery = ""
    
    func fetchJoke() {
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
        
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                let joke = try JSONDecoder().decode(JokeModel.self, from: data)
                DispatchQueue.main.async {
                    self.category = joke.category
                    self.setup = joke.setup
                    self.delivery = joke.delivery
                }
                
            } catch {
                print(error)
            }
        }
        .resume()
        
        
        
    }
}
