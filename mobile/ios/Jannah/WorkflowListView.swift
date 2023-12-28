//
//  WorkflowListView.swift
//  Jannah
//
//  Created by Osman Jalloh on 8/3/23.
//

//import Foundation
//import Apollo
import SwiftUI


struct WorkflowListView: View {
    
    @StateObject private var viewModel = WorkflowListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<viewModel.workflows.count, id: \.self) { index in
                    WorkflowRow(workflow: viewModel.workflows[index])
                }
                if viewModel.lastConnection?.hasMore != false {
                    if viewModel.activeRequest == nil {
                            Button(action: viewModel.loadMoreLaunchesIfTheyExist) {
                                Text("Tap to load more")
                            }
                        } else {
                            Text("Loading...")
                        }
                    }
            }
            .task {
                // TODO (Section 6 - https://www.apollographql.com/docs/ios/tutorial/tutorial-connect-queries-to-ui#use-launches-in-the-ui)
                viewModel.loadMoreLaunchesIfTheyExist()
            }
            .navigationTitle("Workflows Starts")
            .appAlert($viewModel.appAlert)
        }
        //.notificationView(message: $viewModel.notificationMessage)
    }
    
}


struct WorkflowListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkflowListView()
    }
}
