//
//  ListRowView.swift
//  SwiftUITodoList
//
//  Created by Sergio Buitrago on 25/07/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

//#Preview {
//
//    let item: ItemModel = ItemModel(title: "Prueba", isCompleted: false)
//
//    ListRowView(item: item)
//
//}


struct ListRowView_Previews: PreviewProvider {
    
static var item1: ItemModel = ItemModel(title: "First Item", isCompleted: false)
    static var item2: ItemModel = ItemModel(title: "First Item", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
       
    }
    
}
