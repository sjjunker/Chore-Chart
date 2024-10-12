//
//  ChildNavigationView.swift
//  Chore Chart
//
//  Created by Sandi Junker on 10/12/24.
//
import SwiftUI

struct ChildNavigationView: View {
    @EnvironmentObject var model: ChoreChartModel
    
    var body: some View {

        NavigationStack{
            
            //Title
            Text("Children")
                .font(.title)
                .padding(.top)
                .italic()
            
            //Child list
            ScrollView {
                ForEach(model.children.indices, id: \.self) {index in
                    
                    HStack {
                        NavigationLink(model.children[index].name ?? "", destination: ChildView(child: model.children[index]))
                            .padding()
                        
                        Spacer()
                        
                        //Delete child
                        Button {
                            Task {
                                await model.deleteChild(child: model.children[index])
                            }
                        } label: {
                            Image(systemName: "x.circle")
                                .foregroundStyle(Color.red)
                                .bold()
                        }
                        .padding()
                    }
                    .background(model.setColor(index: index))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    .foregroundStyle(Color.black)
                    .padding(.horizontal, 10)
                }
            }
            .padding()
            
            AddChildView()
        }
    }
}
