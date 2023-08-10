//
//  TemplateView.swift
//  memoryGame
//
//  Created by Mac on 8/10/23.
//

import SwiftUI
import PhotosUI

struct TemplateView: View {
    @EnvironmentObject var contentViewModel : ContentViewModel
    @State var image: Image? = nil
    @State var showImagePicker: Bool = false
    
    var body: some View {
        VStack{
            GeometryReader { gp in
                LazyVGrid(columns: contentViewModel.model.column) {
                    ForEach(0..<contentViewModel.model.imgCount, id: \.self){ index in
                    Button(action: {
                        print("Image picker selecteddddd.......")
                        //self.showImagePicker.toggle()
                        showImagePicker = true
                    }, label: {
                        ZStack{}
                            .foregroundColor(contentViewModel.setForeground(index: index))
                            .padding(8)
                            .frame(maxWidth: gp.size.width/2, minHeight:  (gp.size.height - 80)/contentViewModel.model.rows)
                    })
                    .background(contentViewModel.setBackground(index: index))
                    .frame(maxWidth: gp.size.width/2, maxHeight: .infinity)
                    .sheet(isPresented: $showImagePicker) {
                                   ImagePicker(sourceType: .photoLibrary) { image in
                                       self.image = Image(uiImage: image)
                                   }
                               }
                  }
                }
            .padding()
            }
        }
    }
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}

