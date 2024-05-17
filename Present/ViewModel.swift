//
//  ViewModel.swift
//  TestDIContainer
//
//  Created by 김형진 on 2024/05/16.
//

import Combine
import SwiftUI

class ViewModel: ObservableObject {
    let userService: UserServiceProtocol // data interface
    var itemPublisher = CurrentValueSubject<[User], Never>([]) // view data interface
    @Published var users: [User] // binding object
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
        self.users = userService.users
    }
    
    func addUser(_ user: User) {
        userService.add(user)
        itemPublisher.send(userService.users)
    }
    
    func deleteUser(_ index: IndexSet) {
        userService.delete(index)
        itemPublisher.send(userService.users)
    }
}

