import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = true

    // Log out function
    func logOut() {
        // Clear authentication tokens or user session data
        isAuthenticated = false
        // Additional clean up as necessary
    }
}
