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
    
    var body: some View {
        VStack {
            Text("Page \(index)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
