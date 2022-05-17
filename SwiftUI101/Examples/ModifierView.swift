//
//  ModifierExample.swift
//  SwiftUI101
//
//  Created by Erik Flores on 17/5/22.
//

import SwiftUI

struct ModifierView: View {
    var body: some View {
        VStack {
            Text("Bye, World!")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .background(
                    LinearGradient(
                        colors: [Color.red, Color.black],
                        startPoint: .top, endPoint: .bottom
                    )
                )
                .cornerRadius(20)

            Text("Bye, World!")
                .modifier(OldFriend())

            Text("Bye, World!")
                .oldFriendStyle()
        }

    }
}

struct OldFriend: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background(
                LinearGradient(
                    colors: [Color.red, Color.black],
                    startPoint: .top, endPoint: .bottom
                )
            )
            .cornerRadius(20)
    }
}

extension View {
    func oldFriendStyle() -> some View {
        modifier(OldFriend())
    }
}


struct ModifierExample_Previews: PreviewProvider {
    static var previews: some View {
        ModifierView()
    }
}
