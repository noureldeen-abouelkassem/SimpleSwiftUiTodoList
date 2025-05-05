//
//  TodoList.swift
//  TodoList
//
//  Created by noureldeen abouelkassem on 21/04/2025.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel : ListViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.items.isEmpty {
                    NoItemsView(viewModel: viewModel)
                        .transition(AnyTransition.opacity
                            .animation(.easeIn))
                } else {
                    List {
                        ForEach(viewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation{
                                        viewModel.updateItem(item: item)
                                    }
                                }
                        }.onDelete(perform: viewModel.deleteItem)
                            .onMove(perform: viewModel.moveItem)
                    }
                }
            }.navigationTitle("Todo List 📝")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        NavigationLink("Add", destination: AddView(viewModel: viewModel))
                )
                .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    NavigationStack {
        ListView(viewModel: ListViewModel())
    }
}
