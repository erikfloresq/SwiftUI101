//
//  AsyncView.swift
//  SwiftUI101
//
//  Created by Erik Flores on 17/5/22.
//

import SwiftUI
import RickAndMortyAPI

class AsyncViewModel {
    private let api = RickAndMortyAPI()

    func getCharacter() async throws -> Character {
        try await api.getCharacter(id: "1")
    }
}

struct AsyncView: View {
    @State var character: Character?
    let viewModel = AsyncViewModel()

    var body: some View {
        AsyncImage(url: URL(string: character?.image ?? "")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
        } placeholder: {
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
        }
        .task {
            do {
                character = try await viewModel.getCharacter()
            } catch {
                character =  nil
            }
        }

    }
}

struct AsyncView_Preview: PreviewProvider {
    static var previews: some View {
        AsyncView()
    }
}
