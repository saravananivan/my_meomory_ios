//
//  memoryGameApp.swift
//  memoryGame
//
//  Created by Mac on 7/10/23.
//

import SwiftUI

@main
struct memoryGameApp: App {
    
    @StateObject var contentViewModel : ContentViewModel = ContentViewModel()
    @State private var isActive = false
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    .navigationTitle(contentViewModel.model.activeMode.description)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Menu("Mode"){
                            Button("Easy"){
                                contentViewModel.reset(activeMode: Modes.easy)
                                }
                            Button("Medium"){
                                contentViewModel.reset(activeMode: Modes.medium)
                                }
                            Button("Hard"){
                                contentViewModel.reset(activeMode: Modes.hard)
                                }
                          }
                    }
                    ToolbarItem(placement: .navigationBarTrailing)  {
                        Menu("New"){
                                        Button(action: {
                                            contentViewModel.reset(activeMode: Modes.easy)
                                            isActive = true
                                        }){
                                            Text("Easy")
                                        }
                            Button(action: {
                                contentViewModel.reset(activeMode: Modes.medium)
                                isActive = true
                            }){
                                Text("Medium")
                                }
                            Button(action: {
                                contentViewModel.reset(activeMode: Modes.hard)
                                isActive = true
                            }){
                                Text("Hard")
                                }
                        }
                        .background(NavigationLink(destination: TemplateView(),  isActive: $isActive){
                            
                        }
                       
                        .onAppear(){
                            isActive = false
                        })
                        
                    }
                }
            }.environmentObject(contentViewModel)
        }
    }
}
