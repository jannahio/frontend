import SwiftUI
import Apollo
import RocketReserverAPI

class LaunchListViewModel: ObservableObject {
    
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    
    init() {
        // TODO (Section 13 - https://www.apollographql.com/docs/ios/tutorial/tutorial-subscriptions#use-your-subscription)
//        Network.shared.apollo.fetch(query: LaunchListQuery()) { result in
//            switch result {
//            case .success(let graphQLResult):
//                print("Success! Result: \(graphQLResult)")
//            case .failure(let error):
//                print("Failure! Error: \(error)")
//            }
//        }
    }
    
    // MARK: - Subscriptions
    
    func startSubscription() {
        // TODO (Section 13 - https://www.apollographql.com/docs/ios/tutorial/tutorial-subscriptions#use-your-subscription)
    }
    
    private func handleTripsBooked(value: Int) {
        var message: String
        switch value {
        case 1:
            message = "A new trip was booked! 🚀"
        case -1:
            message = "A trip was cancelled! 😭"
        default:
            appAlert = .basic(title: "Unexpected Value",
                              message: "Subscription returned an unexpected value: \(value)")
            return
        }
        
        notificationMessage = message
    }
    
    // MARK: - Launch Loading
    
    func loadMoreLaunchesIfTheyExist() {
        // TODO (Section 8 - https://www.apollographql.com/docs/ios/tutorial/tutorial-paginate-results#update-launchlistviewmodel-to-use-cursor)
    }
    
    func loadMoreLaunches() {
        // TODO (Section 6 - https://www.apollographql.com/docs/ios/tutorial/tutorial-connect-queries-to-ui#configure-launchlistviewmodel)
    }
    
}
