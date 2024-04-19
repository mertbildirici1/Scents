import SwiftUI

struct SettingsView: View {
    // Environment object or state to manage login status
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    Text("Edit Profile")
                    Text("Change Password")
                }
                Section(header: Text("Preferences")) {
                    Toggle("Notifications", isOn: .constant(true))
                }
                Section(header: Text("More")) {
                    Text("Privacy Policy")
                    Text("Terms of Service")
                    Button("Log Out", action: {
                        // Trigger log out functionality
                        authViewModel.logOut()
                    })
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AuthViewModel()) // Mock environment object for preview
    }
}
