//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Uday Gajera on 18/01/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondayAccentColor")
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There are no Items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text ("Add something to you to do list")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(),
                               label: { Text("Add Something")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)           
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
    
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()) {
                animate.toggle()
            }
        }
    }
 
}

#Preview {
    NavigationView{
        NoItemsView()
            .navigationTitle("title")
    }
    
}
