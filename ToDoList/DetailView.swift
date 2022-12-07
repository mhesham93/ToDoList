//
//  DetailView.swift
//  ToDoList
//
//  Created by Mohamed Said on 12/5/22.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State var toDo: ToDo
    var newToDo = false
    
    var body: some View {
            List {
                TextField("Enter To Do here", text: $toDo.item)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminder: ", isOn: $toDo.reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
                DatePicker("Date", selection: $toDo.dueDate)
                    .listRowSeparator(.hidden)
                    .disabled(!toDo.reminderIsOn)
                
                Text("Notes:").padding(.top)
                
                TextField("Notes", text: $toDo.notes, axis: .vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed", isOn: $toDo.isComleted)
                    .padding(.top)
                    .listRowSeparator(.hidden)
            }
            .navigationBarBackButtonHidden()
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save"){
                        toDosVM.saveToDo(toDo: toDo)
                        dismiss()
                    }
                }
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(toDo: ToDo())
            .environmentObject(ToDosViewModel())
    }
}
