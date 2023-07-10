//
//  ContentView.swift
//  memoryGame
//
//  Created by Mac on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    
    let m = Models(activeMode: Modes.easy)
    
    var body: some View {
        VStack{
            GeometryReader { gp in
                LazyVGrid(columns: m.column) {
                ForEach(0..<m.imgCount, id: \.self){ index in
                    Button(action: {
                        print(index)
                    }, label: {
                        Image(systemName: m.imageSlice[index])
                        .font(.largeTitle)
                            .padding(8)
                            .frame(maxWidth: gp.size.width/2, minHeight:  (gp.size.height - 80)/m.rows)
                    })
                    .frame(maxWidth: gp.size.width/2, maxHeight: .infinity)
                  }
                }
            .padding()
            }
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Text("Moves : 0")
                                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                                            .foregroundColor(.black)
                                            .background(Color.white)
                                    })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Text("Pairs : 0/0")
                                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                                            .foregroundColor(.black)
                                            .background(Color.white)
                                    })
            }
            .padding(8)
            .frame(maxHeight: 60,alignment: .bottom)
            .background(Color.green)
    }

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
