//
//  UserDIContainer.swift
//  TestDIContainer
//
//  Created by 김형진 on 2024/05/16.
//

import SwiftUI

struct UserDIContainerModifer: ViewModifier {
    
    let userService: UserServiceProtocol
    
    init() {
        userService = UserService()
    }
    
    func body(content: Content) -> some View {
        content
            .environmentObject(ViewModel(userService: userService))
        
    }
}

extension View {
    func userDIContainer() -> some View {
        modifier(UserDIContainerModifer())
    }
}
