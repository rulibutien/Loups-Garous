//
//  CardSelectorTestCase.swift
//  Loups GarousTests
//
//  Created by Théo Liberman on 18/01/2018.
//  Copyright © 2018 Théo Liberman. All rights reserved.
//

import XCTest
@testable import Loups_Garous

class CardSelectorTestCase: XCTestCase {

    var cardSelector: CardSelector!
    static let cards: [Role: Int] = [.villager: 2, .wolf: 2, .medium: 1, .witch: 1, .cupid: 1, .hunter: 1]

    override func setUp() {
        cardSelector = CardSelector()
    }

    func testWhenCreatingCardSelector_ThenCardSelectorExistsAndCardsDictIsCreated() {
        XCTAssertNotNil(cardSelector)
        for role in Role.cases() {
            XCTAssertEqual(cardSelector.getCards()[role], 0)
        }
    }

    func testGivenCards_WhenCreatingCardsSelector_ThenCardSelectorCardsCardsIsCards() {
        let c = CardSelector(from: CardSelectorTestCase.cards)

        XCTAssertEqual(c.getCards(), CardSelectorTestCase.cards)
    }

    func testGivenCardSelector_WhenAddingRole_ThenIfItsVillagerOrWolfCardIncrementsElseCardOneAndCardsNumersCorrect() {
        for role in Role.cases() {
            cardSelector.add(role)
            cardSelector.add(role)
        }

        var nb = 0
        for card in cardSelector.getCards() {
            nb += 1
            if card.key == .villager || card.key == .wolf {
                XCTAssertEqual(card.value, 2)
            } else {
                XCTAssertEqual(card.value, 1)
            }
        }
        XCTAssertEqual(cardSelector.numberOfCards(), nb + 2)
    }

    func testGivenCardSelector_WhenRemovingRoleAfterAddingIt_ThenIfItsVillagerOrWolfCardsDecrementsElseCardIsZero() {
        for role in Role.cases() {
            cardSelector.add(role)
            cardSelector.add(role)
            cardSelector.remove(role)
        }

        for card in cardSelector.getCards() {
            if card.key == .villager || card.key == .wolf {
                XCTAssertEqual(card.value, 1)
            } else {
                XCTAssertEqual(card.value, 0)
            }
        }
    }

    func testGivenCardSelector_WhenRemovingRoleWithoudAddingItBefore_ThenCardIsZero() {
        for role in Role.cases() {
            cardSelector.remove(role)
        }

        for card in cardSelector.getCards() {
            XCTAssertEqual(card.value, 0)
        }
    }

}
