//
//  ChildEditView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//

import SwiftUI
import Foundation

struct ChildEditView: View {
    @EnvironmentObject var model: ChoreChartModel
    @State var child: Child
    @State var childName = ""
    
    var body: some View {
        VStack {
            Text("Edit Child's Name")
                .padding()
                .font(.title)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            
            HStack {
                TextField("Name", text: $childName)
                    .padding()
                    .font(.body)
                
                Button ("Submit") {
                    child.name = childName
                    Task {
                        await model.modifyChild(child: child)
                        await model.readChildren()
                    }
                    model.popoverShowing = false
                }
                .padding()
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            }
            .padding()
            .background(Color.cyan)
            .foregroundStyle(Color.black)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
        }
        .padding()
    }
}
