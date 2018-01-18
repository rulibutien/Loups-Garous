//
//  PlayerTestCase.swift
//  Loups GarousTests
//
//  Created by Théo Liberman on 17/01/2018.
//  Copyright © 2018 Théo Liberman. All rights reserved.
//

import XCTest
@testable import Loups_Garous

class PlayerTestCase: XCTestCase {

    var player: Player!

    override func setUp() {
        player = Player(name: "Player")
    }

    func testGivenNameAndRole_WhenCreatingPlayer_ThenPlayersNameIsPlayerAndIsAliveAndRoleIsRoleAndIsNotLover() {
        XCTAssertEqual(player.getName(), "Player")
        XCTAssertTrue(player.isAlive())
        XCTAssertEqual(player.getRole(), .villager)
        XCTAssertFalse(player.inLove())
    }

    func testGivenPlayer_WhenSettingName_ThenPlayersNameHasChanged() {
        player.setName("New Name")

        XCTAssertEqual(player.getName(), "New Name")
    }

    func testGivenNameAndRole_WhenCreatingPlayer_ThenPlayersNameIsGivenNameAndRoleIsGivenRole() {
        let name = "name"
        let role: Role = .wolf

        let p = Player(name: name, role: role)

        XCTAssertEqual(p.getName(), name)
        XCTAssertEqual(p.getRole(), role)
    }

    func testGivenPlayer_WhenFallingInLoveWithOtherPlayer_ThenBothPlayersAreInLoveAndNobodyElse() {
        let p = Player(name: "OtherPlayer")
        let q = Player(name: "LastPlayer")

        player.fallInLove(with: p)

        XCTAssertTrue(player.inLove())
        XCTAssertTrue(p.inLove())
        XCTAssertFalse(q.inLove())
    }

    func testGivenPlayer_WhenKillingPlayer_ThenPlayerIsNotAlive() {
        player.kill()

        XCTAssertFalse(player.isAlive())
    }

}
