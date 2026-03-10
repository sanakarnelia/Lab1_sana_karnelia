//
//  GameEngine.swift
//  Lab1_sana_karnelia
//
//  Created by Maaz Karnelia on 2026-03-10.
//

import Foundation
import Combine

class GameEngine: ObservableObject {
    @Published var currentNumber = Int.random(in: 2...100)
    
    
    //prime/notprime logic
    private func isPrime(_ n: Int) -> Bool {
           if n < 2 { return false }
           if n == 2 { return true }
           if n % 2 == 0 { return false }

           let limit = Int(Double(n).squareRoot())
           if limit < 3 { return true }

           var i = 3
           while i <= limit {
               if n % i == 0 { return false }
               i += 2
           }
           return true
       }
}
