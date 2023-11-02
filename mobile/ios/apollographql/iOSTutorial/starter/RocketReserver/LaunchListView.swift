import SwiftUI

struct LaunchListView: View {
    
    @StateObject private var viewModel = LaunchListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<viewModel.launches.count, id: \.self) { index in
                    LaunchRow(launch: viewModel.launches[index])
                }
            }
            .task {
                // TODO (Section 6 - https://www.apollographql.com/docs/ios/tutorial/tutorial-connect-queries-to-ui#use-launches-in-the-ui)
                viewModel.loadMoreLaunches() 
            }
            .navigationTitle("Rocket Launches")
            .appAlert($viewModel.appAlert)
        }
        .notificationView(message: $viewModel.notificationMessage)
    }
    
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
    }
}
