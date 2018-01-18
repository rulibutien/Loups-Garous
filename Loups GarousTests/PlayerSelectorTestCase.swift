//
//  PlayerSelectorTestCase.swift
//  Loups GarousTests
//
//  Created by Théo Liberman on 18/01/2018.
//  Copyright © 2018 Théo Liberman. All rights reserved.
//

import XCTest
@testable import Loups_Garous

class PlayerSelectorTestCase: XCTestCase {

    var playerSelector: PlayerSelector!

    override func setUp() {
        playerSelector = PlayerSelector(from: CardSelectorTestCase.cards)
    }

    func testGivenCards_WhenCreatingPlayerSelector_NumberOfPlayersEqualsNumberOfCardsAndNamesAreEmpty() {
        let numberOfCards = CardSelector(from: CardSelectorTestCase.cards).numberOfCards()
        XCTAssertEqual(playerSelector.getPlayers().count, numberOfCards)
        for player in playerSelector.getPlayers() {
            XCTAssertEqual(player.getName(), "")
        }
    }

    func testGivenPlayerSelector_WhenChanginNameOfFirstPlayer_ThenNameOfFirstPlayerHasChanged() {
        let player = playerSelector.getPlayers().first!
        playerSelector.changeName(of: player, with: "New Name")

        XCTAssertEqual(playerSelector.getPlayers().first!.getName(), "New Name")
    }

}
