//
//  TodoList.swift
//  TodoList
//
//  Created by noureldeen abouelkassem on 21/04/2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var viewModel : ListViewModel
    
    var body: some View {
        NavigationView{
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
            .navigationTitle("Todo List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination: AddView())
            )
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel())
}
