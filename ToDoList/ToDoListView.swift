//
//  ContentView.swift
//  ToDoList
//
//  Created by Mohamed Said on 12/5/22.
//

import SwiftUI

struct ToDoListView: View {
    
    var toDos = ["Learn Swift",
                 "Build Apps",
                 "Change the world",
                 "Bring the awesome",
                 "take a vacation"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self){
                    toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                }
            }
            .navigationTitle("To do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
        
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}


