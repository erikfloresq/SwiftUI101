//
//  MainView.swift
//  SwiftUI101
//
//  Created by Erik Flores on 29/5/21.
//

import SwiftUI
import Combine
import RickAndMortyAPI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                NavigationLink(
                    destination: DetailView(character: character),
                    label: {
                        CellView(character: character)
                    })
            }
            .navigationTitle("Rick&Morty")
            .navigationBarItems(trailing: SettingsButton())
            .onAppear {
                viewModel.getCharacter()
            }
        }
    }
}

struct SettingsButton: View {
    @State var settingPresented: Bool = false

    var body: some View {
        Button(action: {
            settingPresented.toggle()
        }, label: {
            Image(systemName: "gearshape")
        })
        .sheet(isPresented: $settingPresented, content: {
            ZStack {
                Color(.systemRed).ignoresSafeArea()
                Text("Hello")
            }
        })
    }
}

struct CellView: View {
    let character: Character

    var body: some View {
        HStack(spacing: 10.0) {
            Image(systemName: "applelogo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100, maxHeight: 100)
            Text(character.name)
                .font(.title2)
                .padding()
        }.padding()
    }
}

struct DetailView: View {
    let character: Character

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image(systemName: "applelogo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                VStack {
                    Spacer()
                    HStack {
                        Text(character.name)
                            .font(.title)
                            .padding()
                        Spacer()
                    }

                }.frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity, maxHeight: 300)
            Text("lorem ipsum").padding()
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewDevice("iPhone 8")
            DetailView(character: CharacterDummy.getCharacter())
        }
    }
}
