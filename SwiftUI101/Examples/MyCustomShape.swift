//
//  PathView.swift
//  SwiftUI101
//
//  Created by Erik Flores on 2/6/21.
//

import SwiftUI

//https://quassummanus.github.io/SVG-to-SwiftUI/

struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.65239*width, y: 0.00052*height))
        path.addLine(to: CGPoint(x: 0.64133*width, y: 0.00052*height))
        path.addLine(to: CGPoint(x: 0.59133*width, y: 0))
        path.addLine(to: CGPoint(x: 0.01646*width, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: 0.01741*height), control1: CGPoint(x: 0.00736*width, y: 0), control2: CGPoint(x: 0, y: 0.00779*height))
        path.addLine(to: CGPoint(x: 0, y: 0.11385*height))
        path.addCurve(to: CGPoint(x: 0.19866*width, y: 0.27787*height), control1: CGPoint(x: 0, y: 0.21963*height), control2: CGPoint(x: 0.07054*width, y: 0.27787*height))
        path.addLine(to: CGPoint(x: 0.65239*width, y: 0.27876*height))
        path.addCurve(to: CGPoint(x: 0.73922*width, y: 0.37063*height), control1: CGPoint(x: 0.70035*width, y: 0.27876*height), control2: CGPoint(x: 0.73922*width, y: 0.3199*height))
        path.addCurve(to: CGPoint(x: 0.6524*width, y: 0.4625*height), control1: CGPoint(x: 0.73922*width, y: 0.42139*height), control2: CGPoint(x: 0.70035*width, y: 0.4625*height))
        path.addLine(to: CGPoint(x: 0.14356*width, y: 0.4625*height))
        path.addCurve(to: CGPoint(x: 0.12786*width, y: 0.47545*height), control1: CGPoint(x: 0.13615*width, y: 0.4625*height), control2: CGPoint(x: 0.12968*width, y: 0.46783*height))
        path.addLine(to: CGPoint(x: 0.00748*width, y: 0.97843*height))
        path.addCurve(to: CGPoint(x: 0.0104*width, y: 0.99314*height), control1: CGPoint(x: 0.00626*width, y: 0.98354*height), control2: CGPoint(x: 0.00733*width, y: 0.98898*height))
        path.addCurve(to: CGPoint(x: 0.02319*width, y: 0.99975*height), control1: CGPoint(x: 0.01346*width, y: 0.99733*height), control2: CGPoint(x: 0.01819*width, y: 0.99975*height))
        path.addLine(to: CGPoint(x: 0.18452*width, y: 0.99975*height))
        path.addCurve(to: CGPoint(x: 0.28084*width, y: 0.91884*height), control1: CGPoint(x: 0.24495*width, y: 0.99975*height), control2: CGPoint(x: 0.27399*width, y: 0.94669*height))
        path.addLine(to: CGPoint(x: 0.32833*width, y: 0.736*height))
        path.addLine(to: CGPoint(x: 0.65239*width, y: 0.736*height))
        path.addCurve(to: CGPoint(x: width, y: 0.36825*height), control1: CGPoint(x: 0.84407*width, y: 0.736*height), control2: CGPoint(x: width, y: 0.57104*height))
        path.addCurve(to: CGPoint(x: 0.65239*width, y: 0.00054*height), control1: CGPoint(x: width, y: 0.16548*height), control2: CGPoint(x: 0.84407*width, y: 0.00054*height))
        return path
    }
}

struct MyCustomShape_Previews: PreviewProvider {
    static var previews: some View {
        MyCustomShape().path(in: CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 300)))
    }
}
