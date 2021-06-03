//
//  AnimationView.swift
//  SwiftUI101
//
//  Created by Erik Flores on 2/6/21.
//

import SwiftUI

struct AnimationView: View {
    @State var animate: Bool = false

    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Text("Hello, World!")
                    .scaleEffect(animate ? 1 : 1.5)
                    .animation(.spring())
                Button(action: {
                    animate.toggle()
                }, label: {
                    Text("Animate")
                })
            }
            BottomSheet(presented: $animate) {
                VStack {
                    Text("Hola!").padding()
                    Spacer()
                }
            }
        }
    }
}

struct BottomSheet<Content: View>: View {
    @Binding var presented: Bool
    let content: Content

    init(presented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._presented = presented
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .shadow(color: .gray, radius: 4, x: 5, y: 0)
            content
        }
        .frame(maxWidth: .infinity, maxHeight: 400)
        .offset(CGSize(width: 0, height: presented ? 300 : 610))
        .animation(.spring())
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
