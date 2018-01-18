//
//  Player.swift
//  Loups Garous
//
//  Created by Théo Liberman on 17/01/2018.
//  Copyright © 2018 Théo Liberman. All rights reserved.
//

import Foundation

class Player {

    private var name: String!
    private var alive = true
    private var role: Role = .villager
    private var love = false

    init(name: String) {
        self.name = name
    }

    init(name: String, role: Role) {
        self.name = name
        self.role = role
    }

    func setName(_ name: String) {
        self.name = name
    }

    func getName() -> String {
        return name
    }

    func isAlive() -> Bool {
        return alive
    }

    func getRole() -> Role {
        return role
    }

    func inLove() -> Bool {
        return love
    }

    func kill() {
        alive = false
    }

    func fallInLove(with player: Player) {
        love = true
        player.love = true
    }

}

enum Role: String, EnumCollection {
    case villager, wolf, medium, witch, cupid, hunter
}

public protocol EnumCollection: Hashable {
    static func cases() -> AnySequence<Self>
}

public extension EnumCollection {

    public static func cases() -> AnySequence<Self> {
        return AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            return AnyIterator {
                let current: Self = withUnsafePointer(to: &raw) {
                    $0.withMemoryRebound(to: self, capacity: 1) { $0.pointee }
                }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        }
    }

}
