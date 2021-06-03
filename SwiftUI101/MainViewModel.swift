//
//  MainViewModel.swift
//  SwiftUI101
//
//  Created by Erik Flores on 2/6/21.
//

import Combine
import RickAndMortyAPI

class MainViewModel: ObservableObject {
    let rickAndMortyAPI = RickAndMortyAPI()
    @Published var characters = [Character]()
    var cancellable = Set<AnyCancellable>()

    func getCharacter() {
        rickAndMortyAPI
            .getCharacter()
            .map { $0.results }
            .sink { (completion) in
                print("completed!")
            } receiveValue: { (characters) in
                self.characters = characters
            }.store(in: &cancellable)
    }
}
