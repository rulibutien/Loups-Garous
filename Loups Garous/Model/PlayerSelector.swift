//
//  PlayerSelector.swift
//  Loups Garous
//
//  Created by Théo Liberman on 18/01/2018.
//  Copyright © 2018 Théo Liberman. All rights reserved.
//

import Foundation

class PlayerSelector {

    private var players = [Player]()

    init(from cards: [Role: Int]) {
        let roles = createRolesFrom(cards: cards)
        assignRolesRandomly(roles: roles)
        for p in players {
            print("\(p.getName()) is \(p.getRole())")
        }
    }

    func createRolesFrom(cards: [Role: Int]) -> [Role] {
        var roles = [Role]()
        for (role, n) in cards where n > 0 {
            for _ in 1...n {
                roles.append(role)
            }
        }
        return roles
    }

    func assignRolesRandomly(roles: [Role]) {
        var rolesBuffer = roles
        for _ in roles {
            let role = rolesBuffer.remove(at: Int(arc4random_uniform(UInt32(rolesBuffer.count))))
            players.append(Player(name: "", role: role))
        }
    }

    func getPlayers() -> [Player] {
        return players
    }

    func changeName(of player: Player, with name: String) {
        player.setName(name)
    }

}
