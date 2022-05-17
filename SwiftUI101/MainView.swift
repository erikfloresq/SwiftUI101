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
            VStack(spacing: 5) {
                Image("rick")
                    .scaledToFill()
                Text("Wubba Lubba Dub Dub!")
                    .font(.title)
                    .foregroundColor(.white)
                    .marquee(duration: 3)
            }
            .background(.black)
            .ignoresSafeArea()
        })
    }
}

struct CellView: View {
    let character: Character

    var body: some View {
        HStack(spacing: 10.0) {
            AsyncImage(url: URL(string: character.image)) { image in
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
            Text(character.name)
                .font(.title2)
        }
    }
}

struct DetailView: View {
    let character: Character

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                } placeholder: {
                    Image("placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                }
                VStack {
                    Spacer()
                    HStack {
                        Text(character.name)
                            .font(.title)
                            .padding()
                        Spacer()
                    }

                }.frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
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
