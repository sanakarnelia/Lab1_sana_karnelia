//
//  ContentView.swift
//  Lab1_sana_karnelia
//
//  Created by Maaz Karnelia on 2026-03-10.
//

import SwiftUI


struct ContentView: View {
    @State private var currentNumber = Int.random(in: 2...100)
    var body: some View {
       
        Text("\(currentNumber)")
    }
}

#Preview {
    ContentView()
}
    
