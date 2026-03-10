//
//  GameEngine.swift
//  Lab1_sana_karnelia
//
//  Created by Maaz Karnelia on 2026-03-10.
//

import Foundation
import Combine

class GameEngine: ObservableObject {

    
    enum Choice {
           case prime
           case notPrime
       }

    enum RoundState: Equatable {
            case waiting
            case answered(correct: Bool)
            case timedOut
        }
    
    @Published private(set) var state: RoundState = .waiting
    @Published var currentNumber = Int.random(in: 2...100)
    
    
    @Published private(set) var totalCorrect: Int = 0
    @Published private(set) var totalWrong: Int = 0

    // Timer
       private var timerCancellable: AnyCancellable?
       private let secondsPerRound: TimeInterval = 5.0
    
    
    init() {
         startTimer()
     }

     deinit {
         timerCancellable?.cancel()
     }

    
    //user anwer
       func answer(_ choice: Choice) {
           guard state == .waiting else { return }
         
           let actualPrime = isPrime(currentNumber)
           let userThinksPrime = (choice == .prime)
           let isCorrect = (userThinksPrime == actualPrime)

           recordAttempt(isCorrect: isCorrect)
           state = .answered(correct: isCorrect)
          
       }
    private func startTimer() {
         // Fires every 5 seconds; on each tick we end current round and begin next
         timerCancellable = Timer.publish(every: secondsPerRound, on: .main, in: .common)
             .autoconnect()
             .sink { [weak self] _ in
                 self?.timerFired()
             }
     }
    private func timerFired() {
           // If user did not answer in 5 seconds => wrong
           if state == .waiting {
               recordAttempt(isCorrect: false)
               state = .timedOut
           }

           // Move to next round (new number)
           startNewRound()
       }

       private func startNewRound() {
           currentNumber = Int.random(in: 2...100)
           state = .waiting
       }
    
    // MARK: - Scoring
       private func recordAttempt(isCorrect: Bool) {
           

        if isCorrect {
               totalCorrect += 1
            
           } else {
               totalWrong += 1
           }

         
       }
    
    
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
