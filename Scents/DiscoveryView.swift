//
//  DiscoveryView.swift
//  Scents
//
//  Created by Mert Bildirici on 4/16/24.
//

import Foundation
import SwiftUI

struct DiscoveryView: View {
    // Example data array, replace with your data fetching logic
    let imageNames = ["mfk", "baccarat", "headshot"]

    var body: some View {
        VStack {
            // Search Bar at the top
            TextField("Search", text: .constant(""))
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top)

            // Scrollable grid of images
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 2)], spacing: 2) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(imageName) // Replace with your actual image names or URLs
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle("Discover", displayMode: .inline)
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView()
    }
}


