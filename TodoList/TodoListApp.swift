//
//  TodoListApp.swift
//  TodoList
//
//  Created by noureldeen abouelkassem on 21/04/2025.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject private var viewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView(viewModel: viewModel)
        }
    }
}
