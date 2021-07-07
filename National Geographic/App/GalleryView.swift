//
//  GalleryView.swift
//  National Geographic
//
//  Created by Mesut Aygün on 2.07.2021.
//

import SwiftUI

struct GalleryView: View {
    //MARK -> PROPERTIES
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    @State private var selectedAnimal : String = "lion"
    
    
        //simple grid defination
//    let gridLayout : [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    //dynamic grid def.
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    //MARK -> BODY
    var body: some View {
        ScrollView(.vertical , showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white , lineWidth: 8))
                
                Slider(value: $gridColumn, in: 2...4 , step : 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white , lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }//loop
                
                }//grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//vstack
            .padding(.horizontal, 10).padding(.vertical, 50)
        }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(MotionAnimationView())
        
    }
}
    //MARK -> PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
