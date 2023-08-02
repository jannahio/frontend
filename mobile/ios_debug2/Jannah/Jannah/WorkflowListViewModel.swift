//
//  WorkflowListViewModel.swift
//  Jannah
//
//  Created by Osman Jalloh on 7/29/23.
//

import Foundation
import SwiftUI
import JannahApi

class WorkflowListViewModel: ObservableObject {
    
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    @Published var workflows = [GetWorkflowListQuery.Data.AllWorkflows]()
//    @Published var allSites = [GetWorkflowListQuery.Data.AllSite]()
//    @Published var allBoots = [GetWorkflowListQuery.Data.AllBoot]()
//    @Published var allNetworks = [GetWorkflowListQuery.Data.AllNetwork]()
//    @Published var allStorages = [GetWorkflowListQuery.Data.AllStorage]()
//    @Published var allComputes = [GetWorkflowListQuery.Data.AllCompute]()
//    @Published var allUXs = [GetWorkflowListQuery.Data.AllUx]()
//    @Published var allFeedbacks = [GetWorkflowListQuery.Data.AllFeedback]()
//

    
    init() {
        // TODO (Section 13 - https://www.apollographql.com/docs/ios/tutorial/tutorial-subscriptions#use-your-subscription)
        Network.shared.apollo.fetch(query: GetWorkflowListQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }

    func startSubscription() {
        // TODO (Section 13 - https://www.apollographql.com/docs/ios/tutorial/tutorial-subscriptions#use-your-subscription)
    }
    
    private func handleWorkflowStarted(value: Int) {
        var message: String
        switch value {
        case 1:
            message = "A new workflow was started! 🚀"
        case -1:
            message = "A workflow was cancelled! 😭"
        default:
            appAlert = .basic(title: "Unexpected Value",
                              message: "Subscription returned an unexpected value: \(value)")
            return
        }
        
        notificationMessage = message
    }
    
    func loadMoreWorkflowsIfTheyExist() {
        // TODO (Section 8 - https://www.apollographql.com/docs/ios/tutorial/tutorial-paginate-results#update-launchlistviewmodel-to-use-cursor)
    }
    
    func loadMoreWorkflows() {
        // TODO (Section 6 - https://www.apollographql.com/docs/ios/tutorial/tutorial-connect-queries-to-ui#configure-launchlistviewmodel)
        Network.shared.apollo.fetch(query: GetWorkflowListQuery()) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let workflowConnection = graphQLResult.data?.  {
                    self.workflows.append(contentsOf: workflowConnection.workflows.compactMap({ $0 }))
                }

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
    
}
