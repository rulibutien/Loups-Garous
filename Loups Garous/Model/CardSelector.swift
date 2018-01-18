//
//  CardSelector.swift
//  Loups Garous
//
//  Created by Théo Liberman on 18/01/2018.
//  Copyright © 2018 Théo Liberman. All rights reserved.
//

import Foundation

class CardSelector {

    private var cards = [Role: Int]()

    init() {
        for role in Role.cases() {
            cards[role] = 0
        }
    }

    init(from cards: [Role: Int]) {
        self.cards = cards
    }

    func getCards() -> [Role: Int] {
        return cards
    }

    func add(_ role: Role) {
        if role == .villager || role == .wolf {
            cards[role]! += 1
        } else {
            cards[role] = 1
        }
    }

    func remove(_ role: Role) {
        if (role == .villager || role == .wolf) && cards[role]! > 0 {
            cards[role]! -= 1
        } else {
            cards[role] = 0
        }
    }

    func numberOfCards() -> Int {
        var nb = 0
        for (_, v) in cards {
            nb += v
        }
        return nb
    }

}
