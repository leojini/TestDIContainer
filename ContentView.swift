//
//  ContentView.swift
//  TestDIContainer
//
//  Created by 김형진 on 2024/05/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MainScreen()
        }
        .padding()
    }
}

struct MainScreen: View {
    // 등록된 ViewModel을 사용
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                
                List {
                    ForEach(0..<viewModel.users.count, id: \.self) { index in
                        ItemRow(at: viewModel.users[index])
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.deleteUser(indexSet)
                    })
                }
                .listStyle(.insetGrouped)
            }
            .onAppear {
                viewModel.itemPublisher.assign(to: &viewModel.$users)
            }

            Button(action: {
                // Item 추가 메서드
                viewModel.addUser(User(name: "Test Name", age: 20))
            }, label: {
                Text("Button")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.red)
                    .padding(.bottom)
            })
        }
    }

    // Row 뷰를 만드는 메서드
    @ViewBuilder
    func ItemRow(at user: User) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("User 이름: \(user.name)")
                .font(.headline)

            Text("User 나이: \(user.age)")
                .font(.caption2)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    ContentView()
        .userDIContainer() // 최상단 뷰에 의존성 주입
}
