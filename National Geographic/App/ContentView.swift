//
//  ContentView.swift
//  National Geographic
//
//  Created by Mesut Aygün on 2.07.2021.
//

import SwiftUI

struct ContentView: View {
    //MARK -> PROPERTIES
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive : Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    //MARK -> BODY
    var body: some View {
        NavigationView {
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(width: UIScreen.main.bounds.width , height : 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { item in
                            NavigationLink(destination : AnimalDetailView(animal: item)){
                                AnimalListItemView(animal : item)
                            }//link
                            
                        }//loop
                        
                    }//list
                } else {
                    ScrollView(.vertical , showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination : AnimalDetailView(animal: animal)) {
                                    AnimalGridItem(animal: animal)
                                }//link
                            }//loop
                        }//lazy
                        .padding(10)
                        .animation(.easeIn)
                    }//scroll
                }//condition
                
            }//group
        .navigationBarTitle("NatGeo",displayMode: .large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                HStack(spacing : 1){
                    Button(action : {
                        print("list view active")
                        isGridViewActive = false
                        haptics.impactOccurred()
                    }){
                      Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .primary : .accentColor)
                    }
                    Button(action : {
                        print("grid view is active")
                        isGridViewActive = true
                        haptics.impactOccurred()
                    }){
                        Image(systemName: "square.grid.2x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .accentColor : .primary)
                    }
                }//hstack
            }
        }//toolbar
        }//navigation
    }//body
}


    //MARK -> PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
