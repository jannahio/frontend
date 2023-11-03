//
//  WorkflowListViewModel.swift
//  Jannah
//
//  Created by Osman Jalloh on 7/29/23.
//

import Foundation
import SwiftUI
import Apollo
import JannahApi


class WorkflowListViewModel: ObservableObject {
    
    @Published var appAlert: AppAlert?
    @Published var notificationMessage: String?
    @Published var workflows = [WorkflowListQuery.Data.Workflows.Workflow]()

    
    init() {
        // TODO (Section 13 - https://www.apollographql.com/docs/ios/tutorial/tutorial-subscriptions#use-your-subscription)
        notificationMessage = ""
        Network.shared.apollo.fetch(query: WorkflowListQuery()) { result in
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
        
    }
    
    func loadMoreWorkflows() {
        Network.shared.apollo.fetch(query: WorkflowListQuery()) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let workflowConnection = graphQLResult.data?.workflows  {
                    self.workflows.append(contentsOf: (workflowConnection.workflows?.compactMap({ $0 }))!)
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
