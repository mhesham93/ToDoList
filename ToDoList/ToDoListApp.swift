//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Mohamed Said on 12/5/22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
