//
//  ContentView.swift
//  VerticalPicker
//
//  Created by Doğanay Şahin on 24.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State var selector = ""
    var data : Array<Any>
    var body: some View {
        
        
            HorizontalPicker(data: data)
        
        
        
    }
    
    
    @ViewBuilder
    func HorizontalPicker(data : Array<Any>) -> some View{
        VStack{
            
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(Array(zip(data.indices, data)), id: \.0){ index, element in
                    Image(systemName: data[index] as! String)
                       
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        
                        .padding(3)
                        
                        .frame(width: 100, height:100, alignment: .center)
                        .gesture(TapGesture().onEnded({ () in
                            if data[index] as! String == element as! String{
                                self.selector = element as! String
                            }
                        })).overlay(
                            VStack{
                                Spacer()
                                HStack{
                                    
                                Spacer()
                                    Image(systemName: selector == element as! String ? "checkmark.circle.fill" : "")
                                    .foregroundColor(.green)
                                    .font(.largeTitle)
                                    
                                }

                            }
                        
                            
                        
                        )
                }
            }
        }
            Text(selector)
                .padding()
        }

    }
}

struct EmptyPlaceholderModifier<Items: Collection>: ViewModifier {
    let items: Items
    let placeholder: AnyView

    @ViewBuilder func body(content: Content) -> some View {
        if !items.isEmpty {
            content
        } else {
            placeholder
        }
    }
}

extension View {
    func emptyPlaceholder<Items: Collection, PlaceholderView: View>(_ items: Items, _ placeholder: @escaping () -> PlaceholderView) -> some View {
        modifier(EmptyPlaceholderModifier(items: items, placeholder: AnyView(placeholder())))
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(, placeHolder: T)
//    }
//}
