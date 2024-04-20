//
//  JsonParser.swift
//  Pokedex
//
//  Created by Putra Nugraha on 20/04/24.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in Bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from Bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let result = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from Bundle")
        }
        
        return result
    }
}
