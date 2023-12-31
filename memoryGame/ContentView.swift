//
//  ContentView.swift
//  memoryGame
//
//  Created by Mac on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var contentViewModel : ContentViewModel
    
    var body: some View {
        VStack{
            GeometryReader { gp in
                LazyVGrid(columns: contentViewModel.model.column) {
                    ForEach(0..<contentViewModel.model.imgCount, id: \.self){ index in
                    Button(action: {
                        print(index)
                        self.contentViewModel.updateSelectButton(value:index)
                    }, label: {
                        Image(systemName: contentViewModel.model.imageSlice[index] )
                            .foregroundColor(contentViewModel.setForeground(index: index))
                        .font(.largeTitle)
                            .padding(8)
                            .frame(maxWidth: gp.size.width/2, minHeight:  (gp.size.height - 80)/contentViewModel.model.rows)
                    })
                    .background(contentViewModel.setBackground(index: index))
                    .frame(maxWidth: gp.size.width/2, maxHeight: .infinity)
                  }
                }
            .padding()
            }
            
            HStack {
                Text("Moves : \(contentViewModel.moves)")
                   .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                   .foregroundColor(.black)
                   .background(Color.white)
                                
                Text("Pairs : \(contentViewModel.matchedButtons.count/2)/\(contentViewModel.model.imgCount/2)")
                   .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                   .foregroundColor(.black)
                   .background(Color.white)
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





