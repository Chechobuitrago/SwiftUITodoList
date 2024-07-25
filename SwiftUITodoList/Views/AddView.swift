//
//  AddView.swift
//  SwiftUITodoList
//
//  Created by Sergio Buitrago on 25/07/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismissScreen
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...",
                          text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })

            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
    
    func saveButtonPressed(){
        
        if textIsAppropiate() {
            listViewModel.addItem(title: textFieldText)
            dismissScreen()
        }
        
    }
    
    func textIsAppropiate()-> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😤😤😤"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
    .environmentObject(ListViewModel())
}
