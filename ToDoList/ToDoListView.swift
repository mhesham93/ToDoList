//
//  ContentView.swift
//  ToDoList
//
//  Created by Mohamed Said on 12/5/22.
//

import SwiftUI

struct ToDoListView: View {
    
    @State private var sheetIsPresented = false
    @EnvironmentObject var toDosVM: ToDosViewModel
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDosVM.toDos){
                    toDo in
                    HStack{
                        Image(systemName: toDo.isComleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDosVM.toggleCompleted(toDo: toDo)
                            }
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                        
                            Text(toDo.item)
                        }
                    }
                }.onDelete { indexSet in
                    toDosVM.delete(indexSet: indexSet)
                }.onMove { indexSet, index in
                    toDosVM.move(indexSet: indexSet, index: index)
                }
                
                
            }
            .navigationTitle("To do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())
                }
            }
        }
        
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDosViewModel())
    }
}


