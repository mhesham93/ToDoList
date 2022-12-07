//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Mohamed Said on 12/6/22.
//

import Foundation

class ToDosViewModel : ObservableObject{
    @Published var toDos: [ToDo] = []
    
    init() {
//        toDos.append(ToDo(id: UUID().uuidString, item: "Learn Swift"))
//        toDos.append(ToDo(id: UUID().uuidString, item: "Change the World!"))
//        toDos.append(ToDo(id: UUID().uuidString, item: "I'm awesome!"))
        loadData()
    }
    
    func saveToDo(toDo: ToDo){
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
            
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}){
                toDos[index] = toDo
            }
        }
        saveData()
    }
    
    func toggleCompleted(toDo: ToDo){
        guard toDo.id != nil else {return}
        
        var newToDo = toDo
        newToDo.isComleted.toggle()
        
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id}){
            toDos[index] = newToDo
        }
        saveData()
    }
    
    func delete(indexSet: IndexSet){
        toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func move(indexSet: IndexSet, index: Int){
        toDos.move(fromOffsets: indexSet, toOffset: index)
        saveData()
    }
    
    func saveData(){
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos)
        do {
            try data?.write(to: path)
        } catch {
            print("ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func loadData(){
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("ERROR: Could not load data \(error.localizedDescription)")
        }
    }
    
    func deleteData(){
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode("")
        do {
            try data?.write(to: path)
        } catch {
            print("ERROR: Could not save data \(error.localizedDescription)")
        }
    }
}
