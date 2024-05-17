//
//  TestDIContainerApp.swift
//  TestDIContainer
//
//  Created by 김형진 on 2024/05/16.
//

import SwiftUI

@main
struct TestDIContainerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .userDIContainer() // 최상단 뷰에 의존성 주입
        }
    }
}
