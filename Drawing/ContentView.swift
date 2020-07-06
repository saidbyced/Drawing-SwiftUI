//
//  ContentView.swift
//  Drawing
//
//  Created by Chris Eadie on 05/07/2020.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Color.purple
          .edgesIgnoringSafeArea(.all)
        Color.white.frame(width: geometry.size.width - 5, height: geometry.size.height - 5)
          .edgesIgnoringSafeArea(.all)
        TriangleFromRect()
          .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
          .frame(width: 300, height: 300)
        TriangleFromPath()
      }
    }
  }
  
  struct TriangleFromPath: View {
    var body: some View {
      Path { path in
        path.move(to: CGPoint(x: 200/3 + 50, y: 0 + 50))
        path.addLine(to: CGPoint(x: 400/3 + 50, y: 300/3 + 50))
        path.addLine(to: CGPoint(x: 0 + 50, y: 300/3 + 50))
        path.addLine(to: CGPoint(x: 200/3 + 50, y: 0 + 50))
      }
      .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
  }
  
  struct TriangleFromRect: Shape {
    func path(in rect:CGRect) -> Path {
      var path = Path()
      
      path.move(to: CGPoint(x: rect.midX, y: rect.minY))
      path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
      
      return path
    }
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
