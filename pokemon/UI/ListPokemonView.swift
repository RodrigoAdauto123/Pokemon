//
//  ListPokemonView.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 5/02/24.
//

import SwiftUI

struct ListPokemonView: View {
    
    @StateObject var model = ListPokemonViewModel()
    
    var body: some View {
        VStack {
            Image("logo_pokemon", bundle: Bundle.main)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
                List(model.listName.nameList, id: \.self) { name in
                    HStack {
                        Spacer()
                        Text(name)
                            .multilineTextAlignment(.center)
                            .frame(alignment: .trailing)
                        Spacer()
                        Image(systemName: "eye.fill")
                            .foregroundStyle(.green)
                    }
                }
                .padding()
                .font(.system(.title3))
        }
        .onAppear(perform: {
            model.fetch()
//            Task {
//                let result = await model.fetchDetail()
//                print(result)
//            }
            
        })
    }
}

#Preview {
    ListPokemonView()
}
