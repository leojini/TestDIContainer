//
//  UserDomain.swift
//  TestDIContainer
//
//  Created by 김형진 on 2024/05/16.
//

import Foundation

struct User {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

protocol UserServiceProtocol {
    var users: [User] { get set }
    
    func add(_ user: User)
    func delete(_ index: IndexSet)
}

class UserService: UserServiceProtocol {
    var users: [User] = []
    
    func add(_ user: User) {
        users.append(user)
    }
    
    func delete(_ index: IndexSet) {
        users.remove(atOffsets: index)
    }
}
