//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Uday Gajera on 08/01/24.
//
/*
 MVVM Architecture
 
 model - data point
 view - ui
 viewModel - manages model for view
 */
import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene{
        WindowGroup{
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
