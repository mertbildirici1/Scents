import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = nil

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            DiscoveryView()
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
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
            TabView {
                ForEach(0..<5, id: \.self) { index in
                    PageView(index: index)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(colors[index % colors.count])
                        .clipped()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PageView: View {
    let index: Int
    @State private var isLiked = false
    @State private var isSaved = false
    
    var body: some View {
        VStack {
            Text("Page \(index)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            

            // Buttons aligned on the right side of the screen
            HStack {
                Spacer() // Pushes the buttons to the right
                
                VStack {
                    Button(action: {
                        isLiked.toggle()  // Toggle the like state
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .red : .white)
                            .font(.title)
                            .padding()
                    }

                    Button(action: {
                        isSaved.toggle()  // Toggle the saved state
                    }) {
                        Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                            .foregroundColor(isSaved ? .yellow : .white)
                            .font(.title)
                            .padding()
                    }
                }
            }
            .padding(.trailing, 20)  // Add padding on the right for some spacing from the edge
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colors[index % colors.count])
        .clipped()
    }
}


// Sample color array for background colors
let colors: [Color] = [.red, .green, .blue, .orange, .pink]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

