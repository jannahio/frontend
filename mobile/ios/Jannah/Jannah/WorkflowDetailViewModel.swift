//
//  WorkflowDetailViewModel.swift
//  Jannah
//
//  Created by osman jalloh on 12/28/23.
//

import Foundation
import SwiftUI
import JannahApi

class WorkflowDetailViewModel: ObservableObject {
    let workflowID: JannahApi.ID
    
    @Published var workflow: WorkflowDetailsQuery.Data.Workflow?
    @Published var isShowingLogin = false
    @Published var appAlert: AppAlert?
    
    init(workflowID: JannahApi.ID) {
        self.workflowID = workflowID
    }
    
    func loadWorkflowDetails() {
        guard workflowID != workflow?.id else {
            return
        }

        Network.shared.apollo.fetch(query: WorkflowDetailsQuery(id: workflowID)) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let workflow = graphQLResult.data?.workflow {
                    self.workflow = workflow
                }

                if let errors = graphQLResult.errors {
                    self.appAlert = .errors(errors: errors)
                }
            case .failure(let error):
                self.appAlert = .errors(errors: [error])
            }
        }
    }
    
    func startOrStop() {
        guard self.isLoggedIn() else {
            isShowingLogin = true
            return
        }
        
        // TODO (Section 12 - https://www.apollographql.com/docs/ios/tutorial/tutorial-define-additional-mutations#implement-the-canceltrip-logic)
    }
    
    private func startFlow() {
        print("Start Workflow!")
        // TODO (Section 12 - https://www.apollographql.com/docs/ios/tutorial/tutorial-define-additional-mutations#implement-the-booktrip-logic)
    }
    
    private func cancelTrip() {
        print("Start Workflow!")
        // TODO (Section 12 - https://www.apollographql.com/docs/ios/tutorial/tutorial-define-additional-mutations#implement-the-canceltrip-logic)
    }
    
    private func isLoggedIn() -> Bool {
        // TODO (Section 10 - https://www.apollographql.com/docs/ios/tutorial/tutorial-first-mutation#display-the-login-view)
        return false
    }
    
}
