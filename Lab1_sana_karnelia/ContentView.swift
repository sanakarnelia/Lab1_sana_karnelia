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
        
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 26) {
                Spacer()
                
                // Random number
                Text("\(engine.currentNumber)")
                    .font(.system(size: 64, weight: .semibold, design: .serif))
                    .foregroundColor(.teal)
                
                // Tappable labels (Prime / Not Prime)
                VStack(spacing: 18) {
                    choiceLabel("Prime") {
                        engine.answer(.prime)
                    }
                    
                    choiceLabel("not Prime") {
                        engine.answer(.notPrime)
                    }
                }
                // Feedback icon based on state machine
                feedbackView
                    .frame(height: 90)
                
                Spacer()
                
                // addd to check
                HStack(spacing: 16) {
                    Text("Correct: \(engine.totalCorrect)")
                    Text("Wrong: \(engine.totalWrong)")
                }
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
                
            }
            
        }
       
    
    }
        

    
        //ui helper
        private func choiceLabel(_ title: String, action: @escaping () -> Void) -> some View {
            Text(title)
                .font(.system(size: 34, weight: .regular, design: .serif))
                .foregroundColor(.teal)
                .padding(.vertical, 6)
                .contentShape(Rectangle()) // bigger tap area
                .onTapGesture {
                    action()
                }
        }
    
    private var feedbackView: some View {
        switch engine.state {
        case .waiting:
            return AnyView(EmptyView())
        case .answered(let correct):
            return AnyView(
                Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .font(.system(size: 72))
                    .foregroundColor(correct ? .green : .red)
            )
        case .timedOut:
            return AnyView(
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 72))
                    .foregroundColor(.red)
            )
        }
    }
        
    }

            
#Preview {
    ContentView()
}
    
