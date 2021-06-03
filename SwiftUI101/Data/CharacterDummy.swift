//
//  CharacterDummy.swift
//  SwiftUI101
//
//  Created by Erik Flores on 2/6/21.
//

import Foundation
import RickAndMortyAPI

struct CharacterDummy {
    static func getCharacter() -> Character {
        guard let jsonFileURL = Bundle.main.url(forResource: "Character", withExtension: "json") else {
            fatalError("Problems with JSON URL")
        }
        do {
            let data = try Data(contentsOf: jsonFileURL)
            return try JSONDecoder().decode(Character.self, from: data)
        } catch {
            fatalError("Data parse error: \(error.localizedDescription)")
        }
    }
}
