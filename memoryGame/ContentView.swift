//
//  ContentView.swift
//  memoryGame
//
//  Created by Mac on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedButtons = [Int]()
    @State private var matchedButtons = [Int]()
    @State private var moves = 0
    
    let m = Models(activeMode: Modes.easy)
    
    var body: some View {
        VStack{
            GeometryReader { gp in
                LazyVGrid(columns: m.column) {
                ForEach(0..<m.imgCount, id: \.self){ index in
                    Button(action: {
                        print(index)
                        updateSelectButton(value:index)
                    }, label: {
                        Image(systemName: m.imageSlice[index] )
                            .foregroundColor((self.matchedButtons.contains(index) || self.selectedButtons.contains(index)) ? Color.yellow : Color.purple)
                        .font(.largeTitle)
                            .padding(8)
                            .frame(maxWidth: gp.size.width/2, minHeight:  (gp.size.height - 80)/m.rows)
                            
                    })
                    .background(self.matchedButtons.contains(index) ? Color.white : //(self.selectedButtons.contains(index)  ? Color.green  : Color.purple) )
                                     Color.purple)
                    .frame(maxWidth: gp.size.width/2, maxHeight: .infinity)
                    
                    
                  }
                }
            .padding()
            }
            
            HStack {
                   Text("Moves : \(moves)")
                   .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                   .foregroundColor(.black)
                   .background(Color.white)
                                
                Text("Pairs : \(matchedButtons.count/2)/\(m.imgCount/2)")
                   .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                   .foregroundColor(.black)
                   .background(Color.white)
                               
            }
            .padding(8)
            .frame(maxHeight: 60,alignment: .bottom)
            .background(Color.green)
        }

    }
    
    func updateSelectButton(value: Int) {
        
        var isMatched = false
    
        if self.matchedButtons.contains(value) || self.selectedButtons.contains(value){
            print("Already exists....")
            return
        }
        
        if let previousValue = self.selectedButtons.last{
            
            if m.imageSlice[previousValue]  ==  m.imageSlice[value]{
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
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 Pro Max")
          
        }
    }
}
