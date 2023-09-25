//
//  WorkflowView.swift
//  Jannah
//
//  Created by Osman Jalloh on 8/1/23.
//

import Foundation
import SwiftUI
import JannahApi

struct WorkflowRow: View {
    let workflow: WorkflowListQuery.Data.Workflows.Workflow
    private let placeholderImg = Image("Universal 2x")
    
    var body: some View {
        HStack {
            placeholderImg
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text("Workflow Name")
                Text(workflow.name)
                    .font(.system(size: 14))
            }
            Spacer()
        }
        .padding(4)
    }
}