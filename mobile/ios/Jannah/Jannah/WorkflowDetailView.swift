//
//  WorkflowDetailView.swift
//  Jannah
//
//  Created by osman jalloh on 12/28/23.
//

import Foundation
import SDWebImageSwiftUI
import SwiftUI
import JannahApi


struct WorkflowDetailView: View {
    private let placeholderImg = Image("placeholder")
    
    @StateObject private var viewModel: WorkflowDetailViewModel
    
    init(workflowID: JannahApi.ID) {
        _viewModel = StateObject(wrappedValue: WorkflowDetailViewModel(workflowID: workflowID))
    }
    
    var body: some View {
        VStack {
            if let workflow = viewModel.workflow {
                HStack(spacing: 10) {
                    placeholderImg
                        .resizable()
                        .scaledToFit()
                        .frame(width: 165, height: 165)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(workflow.name)
                            .font(.system(size: 24, weight: .bold))

                        Text("\(workflow.description)")
                                .font(.system(size: 18))
                        

                        if workflow.isStarted{
                                Text("Started")
                                    .font(.system(size: 14))
                        }
                        else{
                                Text("Not started")
                                    .font(.system(size: 14))
                        }
                    }

                    Spacer()
                }

                if workflow.isStarted {
                    stopWorkflowButton()
                } else {
                    startWorkflowButton()
                }
            }
            Spacer()
        }
        .padding(10)
        .navigationTitle(viewModel.workflow?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            viewModel.loadWorkflowDetails()
        }
        .sheet(isPresented: $viewModel.isShowingLogin) {
            LoginView(isPresented: $viewModel.isShowingLogin)
        }
        .appAlert($viewModel.appAlert)
    }
    
    private func startWorkflowButton() -> some View {
        Button(action: viewModel.startOrStop) {
            Text("Start now!")
                .foregroundColor(.black)
        }
        .frame(width: 200, height: 50)
        .background(.green)
        .cornerRadius(8)
    }
    
    private func stopWorkflowButton() -> some View {
        Button(action: viewModel.startOrStop) {
            Text("Stop")
                .foregroundColor(.black)
        }
        .frame(width: 200, height: 50)
        .background(.red)
        .cornerRadius(8)
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkflowDetailView(workflowID: "110")
    }
}
