//
//  EmptyListView.swift
//  TodoList
//
//  Created by noureldeen abouelkassem on 22/04/2025.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    @StateObject var viewModel: ListViewModel
    let secondaryAccentColor: Color = Color("SecondaryAccentColor")
    
    // MARK: First Section
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Would like to organize your day and not miss a thing? Add an item below!")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(viewModel: viewModel),
                    label: {
                        Text("Add something new... 📝")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    }
                ).padding(.horizontal, animate ? 30: 50)
                    .shadow(
                        color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30
                    )
                    .scaleEffect(y: animate ? 1.1 :1)
                    .offset(y: animate ? -7 : 0)
            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: Second Section
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoItemsView(viewModel: ListViewModel())
            .navigationTitle(Text("No Items"))
    }
}
