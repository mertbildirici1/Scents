//
//  ContentView.swift
//  Scents
//
//  Created by Mert Bildirici on 4/15/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            DiscoveryView()
                .tabItem {
                    Label("Discovery", systemImage: "magnifyingglass")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, Mert!")
                NavigationLink(destination: DiscoveryView()) {
                    Text("DISCOVER")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



