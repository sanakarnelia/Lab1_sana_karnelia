//
//  ContentView.swift
//  Lab1_sana_karnelia
//
//  Created by Maaz Karnelia on 2026-03-10.
//

import SwiftUI


struct ContentView: View {
  
    
    //GameEngine
    @StateObject private var engine = GameEngine()
    var body: some View {
       
        Text("\(engine.currentNumber)")
        
        VStack{
            Text("Prime")
            Text("Not Prime")
            }
        .font(.system(size: 34))
        .foregroundColor(.teal)
    }
}

#Preview {
    ContentView()
}
    
