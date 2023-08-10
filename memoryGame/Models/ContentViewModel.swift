//
//  ContentViewModel.swift
//  memoryGame
//
//  Created by Mac on 8/10/23.
//

import Foundation
import SwiftUI

class ContentViewModel : ObservableObject{
    @Published var selectedButtons = [Int]()
    @Published var matchedButtons = [Int]()
    @Published var model = Models(activeMode: Modes.easy)
    @Published var moves = 0
    
    func reset(activeMode : Modes){
        self.model = Models(activeMode: activeMode)
        self.selectedButtons.removeAll()
        self.matchedButtons.removeAll()
        self.moves = 0
    }
    
    func updateSelectButton(value: Int) {
        
        var isMatched = false

        if self.matchedButtons.contains(value) || self.selectedButtons.contains(value){
            print("Already exists....")
            return
        }
        
        if let previousValue = self.selectedButtons.last{
            
            if model.imageSlice[previousValue]  ==  model.imageSlice[value]{
                print("Both are matching.......")
                self.matchedButtons.append(previousValue)
                self.matchedButtons.append(value)
                
                isMatched = true
                if let index = self.selectedButtons.firstIndex(of: previousValue) {
                    self.selectedButtons.remove(at: index)
                    }
            }
            
        }
        
        if !isMatched{
            self.selectedButtons.append(value)
        }
        
        if self.selectedButtons.count == 4 || isMatched{
            self.selectedButtons = []
            if !isMatched{
                self.selectedButtons.append(value)
            }
        }
        
        self.moves += 1
      }
    
    func setBackground(index: Int) -> Color{
        return self.matchedButtons.contains(index) ? Color.white : Color.purple
    }
    
    func setForeground(index :  Int) -> Color{
        return (self.matchedButtons.contains(index) || self.selectedButtons.contains(index)) ? Color.yellow : Color.purple
    }
}
