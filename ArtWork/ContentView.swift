//
//  ContentView.swift
//  ArtWork
//
//  Created by ramil on 27.05.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var gap = false
    @State private var rotate = false
    
    var body: some View {
        ZStack {
            Color(red: 0, green: 0, blue: 0)
                .edgesIgnoringSafeArea(.all)

            Text("Create ArtWork")
                .font(.largeTitle)
                .offset(y: -300)
                .foregroundColor(.white)
            
            ZStack {
                ForEach(0..<8) { item in
                    Image(systemName: "paperclip")
                        .resizable()
                        .frame(width: self.rotate ? 220 : 180, height: self.rotate ? 220 : 180)
                        .foregroundColor(.blue)
                        .opacity(self.rotate ? 0.6 : 0.8)
                        .hueRotation(.degrees(self.rotate ? 34 : 9))
                        .offset(x: self.gap ? 0 : 95)
                        .rotationEffect(.degrees(Double(item) * 45))
                        .blendMode(self.rotate ? .lighten : .hardLight)
                        .shadow(color: .blue, radius: 20, x: 0, y: 0)
                }.rotationEffect(.degrees(self.rotate ? 360 : 0))
            }
        }.onTapGesture {
            withAnimation {
                self.rotate.toggle()
                self.gap.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
