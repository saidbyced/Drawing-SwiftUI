//
//  ContentView.swift
//  Drawing
//
//  Created by Chris Eadie on 05/07/2020.
//

import SwiftUI

struct ContentView: View {
  
  @State private var petalOffset = -60.0
  @State private var petalWidth = 150.0
  
  var body: some View {
//    GeometryReader { geometry in
//      ZStack {
//        Color.purple
//          .edgesIgnoringSafeArea(.all)
//        Color.white.frame(width: geometry.size.width - 5, height: geometry.size.height - 5)
//          .edgesIgnoringSafeArea(.all)
//        Circle()
//          .strokeBorder(Color.green, lineWidth: 40)
//        TriangleFromRect()
//          .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//          .frame(width: 300, height: 300)
//        TriangleFromPath()
//        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//          .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//          .frame(width: 150, height: 150)
//      }
//    }
    VStack {
      Flower(petalOffset: petalOffset, petalWidth: petalWidth)
        .fill(Color.pink, style: FillStyle(eoFill: true))
      Text("Offset")
      Slider(value: $petalOffset, in: -60...60)
      Text("Width")
      Slider(value: $petalWidth, in: 0...150)
    }
  }
  
//  struct TriangleFromPath: View {
//    var body: some View {
//      Path { path in
//        let locationAdjustment = 50
//        let sizeRatio = 2
//        let width = 60 * sizeRatio
//        let height = 45 * sizeRatio
//
//        path.move(to: CGPoint(x: (width / 2) + locationAdjustment, y: 0 + locationAdjustment))
//        path.addLine(to: CGPoint(x: width + locationAdjustment, y: height + locationAdjustment))
//        path.addLine(to: CGPoint(x: 0 + locationAdjustment, y: height + locationAdjustment))
//        path.addLine(to: CGPoint(x: (width / 2) + locationAdjustment, y: 0 + locationAdjustment))
//      }
//      .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//    }
//  }
//
//  struct TriangleFromRect: Shape {
//    func path(in rect:CGRect) -> Path {
//      var path = Path()
//
//      path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//      path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//      path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//      path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//
//      return path
//    }
//  }
//
//  struct Arc: InsettableShape {
//    let startAngle: Angle
//    let endAngle: Angle
//    let clockwise: Bool
//    var insetAmount: CGFloat = 0
//
//    func path(in rect: CGRect) -> Path {
//      let rotationAdjustment = Angle.degrees(90)
//      let modifiedStart = startAngle - rotationAdjustment
//      let modifiedEnd = endAngle - rotationAdjustment
//
//      var path = Path()
//      path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//
//      return path
//    }
//
//    func inset(by amount: CGFloat) -> some InsettableShape {
//      var arc = self
//      arc.insetAmount += amount
//      return arc
//    }
//  }
  
  struct Flower: Shape {
    var petalOffset: Double = -20
    var petalWidth: Double = 100

    func path(in rect: CGRect) -> Path {
      var path = Path()

      for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
        let rotation = CGAffineTransform(rotationAngle: number)

        let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))

        let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))

        let rotatedPetal = originalPetal.applying(position)

        path.addPath(rotatedPetal)
      }

      return path
    }
  }
    
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
