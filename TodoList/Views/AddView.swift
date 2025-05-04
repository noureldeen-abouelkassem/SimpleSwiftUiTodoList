//
//  AddView.swift
//  TodoList
//
//  Created by noureldeen abouelkassem on 21/04/2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView
        {
            VStack{
                TextField(
                    "Enter your task here ...",
                    text: $textFieldText
                )
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Button(action: saveButtonClicked, label: {
                    Text("SAVE".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
            }.padding(14)
                .navigationTitle("Add an Item 🖋️")
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle))
                }
        }
    }
    
    func saveButtonClicked() {
        addNewItem(textFieldText)
    }
    
    func addNewItem(_ text: String) {
        guard !text.isEmpty else { return }
        if isAppropriateText() {
            viewModel.addNewItem(title: text)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func isAppropriateText() -> Bool {
        if textFieldText.count < 3 {
            showAlert.toggle()
            alertTitle = "Please enter at least 3 characters."
            return false
        }
        return true
    }
}

#Preview {
    NavigationStack {
        AddView()
    }.environmentObject(ListViewModel())
}
