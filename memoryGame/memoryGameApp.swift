//
//  memoryGameApp.swift
//  memoryGame
//
//  Created by Mac on 7/10/23.
//

import SwiftUI

@main
struct memoryGameApp: App {
    
    @State var model : Models = Models(activeMode: Modes.easy)
    
    var body: some Scene {
        WindowGroup {
           // ContentView()
            NavigationView{
            ContentView(m: $model)
                .navigationTitle(model.activeMode.description)
                .toolbar{
                    ToolbarItem{
                        Menu("Mode"){
                            Button("Easy"){
                                model = Models(activeMode: Modes.easy)
                                }
                            Button("Medium"){
                                model = Models(activeMode: Modes.medium)
                                }
                            Button("Hard"){
                                model = Models(activeMode: Modes.hard)
                                }
                          }
                    }
                }
            }

            
        }
    }
}
