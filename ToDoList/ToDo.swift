//
//  ToDo.swift
//  ToDoList
//
//  Created by Mohamed Said on 12/6/22.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String?
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isComleted = false
}
