//
//  CharacterMemory.swift
//  SwiftUI101
//
//  Created by Erik Flores on 2/6/21.
//

import Foundation

struct CharacterMemory: Identifiable {
    let id: UUID = UUID()
    let name: String
}

let charactersMemory = [CharacterMemory(name: "Rick"),
                        CharacterMemory(name: "Morty"),
                        CharacterMemory(name: "EvilMorty"),
                        CharacterMemory(name: "Rick"),
                        CharacterMemory(name: "Morty"),
                        CharacterMemory(name: "EvilMorty")]
