//
//  JokesHomepage.swift
//  URLSession-Api
//
//  Created by Cihan Yilmaz on 08/08/2025.
//

import SwiftUI

struct JokesHomepage: View {
    
    @StateObject var jokesVM = JokesViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Setup joke")
                .font(.title)
                .bold()
            Text(jokesVM.setup)
            
            Text("Delivery joke")
                .font(.title)
                .bold()
            Text(jokesVM.delivery)
            
            Button {
                jokesVM.fetchJoke()
            } label: {
                Text("Generate")
                    .padding()
                    .background(Color(.systemBlue))
                    .foregroundStyle(Color.white)
                    .cornerRadius(16)
            }
            .padding(.top, 50)

        }
        .padding()
        .onAppear {
            jokesVM.fetchJoke()
        }
    }
}

#Preview {
    JokesHomepage()
}
