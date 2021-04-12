//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Mabast on 3/30/21.
//

import SwiftUI

struct AnimalListItemView: View {
    
    let animal: Animal
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8){
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing,8)
            }
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    
   static let animal: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListItemView(animal: animal[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
