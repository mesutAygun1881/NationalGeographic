//
//  AnimalGridItem.swift
//  National Geographic
//
//  Created by Mesut Aygün on 7.07.2021.
//

import SwiftUI

struct AnimalGridItem: View {
    let animal : Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItem_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItem(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
