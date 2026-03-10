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
}
