//
//  ProfileView.swift
//  Scents
//
//  Created by Mert Bildirici on 4/16/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    // Sample data for demonstration
    let numberOfPosts = 34
    let numberOfFollowers = 1200
    let numberOfFollowing = 150
    let userRating = 4.5  // Example user rating out of 5

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                // Profile Image
                Image("headshot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .padding(.top, 20)
                
                // Username
                Text("@mertbildirici")
                    .font(.title2)
                    .fontWeight(.bold)
                
                // User Statistics
                HStack(spacing: 40) {
                    VStack {
                        Text("\(numberOfPosts)")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Posts")
                            .font(.caption)
                    }
                    VStack {
                        Text("\(numberOfFollowers)")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Followers")
                            .font(.caption)
                    }
                    VStack {
                        Text("\(numberOfFollowing)")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Following")
                            .font(.caption)
                    }
                    VStack {
                        Text(String(format: "%.1f", userRating))
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Rating")
                            .font(.caption)
                    }
                }
                .padding(.top, 10)

                // Bio
                Text("Bio goes here. A brief description of the user.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Grid of Images (Alternating between mfk and baccarat)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 2) {
                    ForEach(0..<numberOfPosts, id: \.self) { index in
                        Image(index % 2 == 0 ? "mfk" : "baccarat")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }
                }
                .padding(.top)
            }
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
