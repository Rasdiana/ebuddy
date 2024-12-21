//
//  FigmaView.swift
//  EbuddyProject
//
//  Created by Rasdiana Sari on 21/12/24.
//


import SwiftUI
import _PhotosUI_SwiftUI

struct FigmaView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ScrollView(){
            VStack{
                VStack(alignment: .leading){
                    HStack{
                        Text("Zynx").font(.system(size: 24)).bold()
                        Image(.eclipse).resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Spacer()
                        Image(.verified).resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                        Image(.instagram).resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                    }.padding(.trailing, 20).padding(.leading)
                    Image(.user)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding(.leading)
                        .padding(.trailing)
                    HStack(alignment: .firstTextBaseline) {
                        Image(.star)
                        Text("4.9").bold().font(.title3)
                        Text("(61)").font(.title3).foregroundStyle(.gray)
                    }.padding(.leading)
                    HStack(alignment: .firstTextBaseline) {
                        Image(.fire).padding(.trailing, 5)
                        Text("110").bold().font(.title2)+Text(".00").font(.title3).foregroundColor(colorScheme == .light ? Color(hex: 0x1D1D20) : .white)+Text("/1Hr").font(.title3).foregroundColor(colorScheme == .light ? Color(hex: 0x1D1D20) : .white)
                    }.padding(.leading)
                }.frame(minWidth: 50)
            }
            Spacer(minLength: 50)
            VStack(alignment: .leading){
                HStack{
                    Text("Zynx").font(.system(size: 24)).bold()
                    Image(.eclipse).resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Spacer()
                    Image(.verified).resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.trailing)
                    Image(.instagram).resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                }.padding(.trailing, 20).padding(.leading)
                VStack(alignment: .center){
                    Image(.user)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding(.leading)
                        .padding(.trailing)
                        .overlay(
                                Image(.available).resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                    .padding(.top, -100),
                                alignment: .top
                            
                        )
                        .overlay(
                            Image(.sound).resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 100)
                            .padding(.trailing, 40)
                            .padding(.bottom, 10)
                            ,
                            alignment: .bottomTrailing)
                    
                }
                HStack(alignment: .firstTextBaseline) {
                    Image(.star)
                    Text("4.9").bold().font(.title3)
                    Text("(61)").font(.title3).foregroundStyle(.gray)
                }.padding(.leading)
                HStack(alignment: .firstTextBaseline) {
                    Image(.fire).padding(.trailing, 5)
                    Text("110").bold().font(.title2)+Text(".00").font(.title3).foregroundColor(colorScheme == .light ? Color(hex: 0x1D1D20) : .white)+Text("/1Hr").font(.title3).foregroundColor(colorScheme == .light ? Color(hex: 0x1D1D20) : .white)
                }.padding(.leading)
            }.frame(minWidth: 50)
        }
        
    }
}

#Preview {
    //CHANGE TO LIGHT
    //COMMIT 8
    FigmaView().preferredColorScheme(.dark)
}
