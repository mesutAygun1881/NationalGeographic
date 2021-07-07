//
//  CoverImageView.swift
//  National Geographic
//
//  Created by Mesut Aygün on 3.07.2021.
//

import SwiftUI

struct CoverImageView: View {
    //MARK -> PROPERTIES
    
    let CoverImages : [CoverImage] =
    Bundle.main.decode("covers.json")
    
    //MARK -> BODY
    var body: some View {
        TabView{
            ForEach(CoverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            }
            
        }//TabView
        .tabViewStyle(PageTabViewStyle())
    }
}



    //MARK -> PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 300))
    }
}
