//
//  Models.swift
//  memoryGame
//
//  Created by Mac on 7/10/23.
//

import Foundation
import SwiftUI

struct Models : Equatable{
    
    var imageIcons = ["cloud.heavyrain.fill", "car.fill" , "bus.doubledecker",
    "tram.fill", "bicycle", "bolt", "drop", "tortoise.fill", "candybarphone", "keyboard", "display", "macmini"]
    
    var imgCount: Int {
        if activeMode == Modes.easy{
            return 8
        }else if activeMode == Modes.medium{
            return 18
        }
        return 24
    }
    
    var rows: CGFloat{
        if activeMode == Modes.easy{
            return 4
        }else if activeMode == Modes.medium{
            return 6
        }
        return 6
        
    }
    
    var column : Array<GridItem>{
        if activeMode == Modes.easy{
            return [GridItem(.flexible()), GridItem(.flexible())]
        }else if activeMode == Modes.medium{
            return [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        }
        return [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    }
    
    var imageSlice: Array<String>{
        return  Array(imageIcons[..<(imgCount/2)]) +  Array(imageIcons[..<(imgCount/2)])
    }
    
    let activeMode: Modes
    
    init(activeMode: Modes) {
        self.activeMode = activeMode
    }
        
}

enum Modes : Equatable{
    case easy
     case medium
     case hard
    
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .easy: return "Easy"
        case .medium: return "Medium"
        case .hard: return "Hard"
        }
    }
}
