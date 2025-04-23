//
//  ListRowView.swift
//  TodoList
//
//  Created by noureldeen abouelkassem on 21/04/2025.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack
        {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    
    let item1 = ItemModel(title: "first item", isCompleted: false)
    let item2 = ItemModel(title: "second item", isCompleted: true)
    
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
