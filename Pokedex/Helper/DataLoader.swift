//
//  DataLoader.swift
//  Pokedex
//
//  Created by Putra Nugraha on 20/04/24.
//

import Foundation

extension Bundle {
    
    func load<T: Decodable>(
        url: String,
        model: T.Type,
        onSuccess: @escaping(T) -> (),
        onError: @escaping(Error) -> ()
    ) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    onError(error)
                }
                
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                onSuccess(serverData)
            } catch {
                onError(error)
            }
        }
        .resume()
    }
}
