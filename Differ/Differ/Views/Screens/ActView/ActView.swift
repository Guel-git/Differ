//
//  ActView.swift
//  Differ
//
//  Created by 김유나 on 2022/04/29.
//

import SwiftUI
import HalfASheet

struct ActView: View {
    
    @State var isShowing = false
    @Binding var amount: Double
    @Binding var comment: String
    
    //@Binding var selectedAct: String?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                
                Color(.white).edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .center) {
                    HStack {
                        Button(action: {
                            self.mode.wrappedValue.dismiss()
                        }){
                            Image("lessthan")
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: 12, height: 15)
                                .padding(.trailing, metrics.size.width * 0.05)
                        }
                        
                        Spacer()
                        
                    } // HStack
                    .padding(.top, metrics.size.height * 0.01)
                    .font(.system(size: 20))
                    .padding(.bottom, metrics.size.height * 0.047)
                    
                    
                    Text("오늘 새롭게 시도할 변화")
                        .padding(.bottom, metrics.size.height * 0.006)
                        .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                        .font(.system(size: 16, weight: Font.Weight.light))
                    
                    Text("사놓고 안 입었던 옷 시도하기")
                        .font(.system(size: 23, weight: Font.Weight.bold))
                        .padding(.bottom, metrics.size.height * 0.031)
                        .foregroundColor(Color(red: 154/255, green: 194/255, blue: 135/255))
                    
                    
                    Image("fire")
                        .resizable()
                        .frame(width: metrics.size.width * 0.7, height: metrics.size.width * 0.7)
                    
                    Spacer()
                    
                    Button(action: {
                        isShowing.toggle()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color(red: 154/255, green: 194/255, blue: 135/255))
                                .frame(width: metrics.size.width * 0.88, height: metrics.size.height * 0.06, alignment: .center)
                                .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 0)
                            
                            Text("도전 완료")
                                .font(.system(size: 16, weight: Font.Weight.semibold))
                                .foregroundColor(Color.white)
                        } // ZStack
                    }
                    .padding(.top, metrics.size.height * 0.03)
                    
                } // VStack
                .padding(.horizontal, metrics.size.width * 0.058)
                
                HalfASheet(isPresented: $isShowing) {
                    VStack(alignment: .leading) {
                        Text("오늘 시도한 변화 한 가지, 어떠셨나요?")
                            .padding(.bottom, metrics.size.height * 0.028)
                            .font(.system(size: 20, weight: Font.Weight.semibold))
                            .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                        
                        HStack {
                            Text("아래 원을 움직여서 만족도를 표시해주세요!")
                                .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                                .padding(.trailing, 3)
                            
                            Text("\(Int(amount))")
                        } // HStack
                        .font(.system(size: 14, weight: Font.Weight.regular))
                        
                        HStack {
                            Text("0")
                            
                            Slider(value: $amount, in: 0...100, step: 1)
                                .accentColor(Color(red: 221/255, green: 243/255, blue: 159/255))
                                .padding(.horizontal, metrics.size.width * 0.008)
                            
                            Text("100")
                        } // HStack
                        .font(.system(size: 12, weight: Font.Weight.regular))
                        .padding(.bottom, metrics.size.height * 0.02)
                        
                        Text("간단한 코멘트도 남겨 주세요!")
                            .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                            .font(.system(size: 14, weight: Font.Weight.regular))
                        
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $comment)
                                .padding(.leading, metrics.size.width * 0.026)
                                .padding(.top, metrics.size.height * 0.008)
                                .frame(width: metrics.size.width * 0.86, height: metrics.size.height * 0.086)
                                .border(Color(red: 232/255, green: 232/255, blue: 232/255), width: 1)
                                .cornerRadius(3)
                                .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 14, weight: Font.Weight.light))
                                .lineSpacing(1.7)
                            
                            Text(comment ?? "20자 이내")
                                .padding(.leading, metrics.size.width * 0.036)
                                .padding(.top, metrics.size.height * 0.02)
                                .font(.system(size: 14, weight: Font.Weight.light))
                                .foregroundColor(Color(red: 116/255, green: 116/255, blue: 116/255))
                                .lineSpacing(1.7)
                                .opacity(comment == nil ? 1 : 0)
                        } // ZStack
                        .padding(.bottom, metrics.size.height * 0.005)
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(Color(red: 154/255, green: 194/255, blue: 135/255))
                                    .frame(width: metrics.size.width * 0.86, height: metrics.size.height * 0.06, alignment: .center)
                                    .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 0)
                                
                                Text("후기 남기기")
                                    .font(.system(size: 16, weight: Font.Weight.semibold))
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(.top, metrics.size.height * 0.02)
                        
                    } // VStack
                    
                } // HalfASheet
                .height(.proportional(0.45))
                .backgroundColor(.white)
                .contentInsets(EdgeInsets(top: metrics.size.height * 0.03, leading: metrics.size.width * 0.071, bottom: metrics.size.height * 0.0, trailing: metrics.size.width * 0.071))
                .closeButtonColor(.white)
            } // ZStack
        } // GeomtryReader
        .navigationBarHidden(true)
    }
}


