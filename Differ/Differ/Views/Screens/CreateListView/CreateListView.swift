//
//  CreateListView.swift
//  Differ
//
//  Created by 김유나 on 2022/05/02.
//

import SwiftUI

public extension Binding where Value: Equatable {
    init(_ source: Binding<Value?>, replacingNilWith nilProxy: Value) {
        self.init(
            get: { source.wrappedValue ?? nilProxy },
            set: { newValue in
                if newValue == nilProxy {
                    source.wrappedValue = nil
                }
                else {
                    source.wrappedValue = newValue
                }
            })
    }
}

enum Category: String, CaseIterable, Identifiable {
    
    case 옷, 교통, 음식, 휴식, 운동, 업무, 청소, 인간관계
    
    var id: String { self.rawValue }
}

struct CategoryPicker: View {
    @Binding var selection: Category
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.isShowing = false
            }) {
                HStack {
                    Spacer()
                    Text("Close")
                        .padding(.horizontal, 20)
                }
            }
            
            Picker(selection: $selection, label: Text("")) {
                ForEach(Category.allCases) { category in
                    Text(category.rawValue)
                        .tag(category)
                }
            }
            .frame(width: 230)
            .labelsHidden()
        }
    }
}



struct CreateListView: View {
    
    //@State var differ: String?
    @Binding var differ: String?
    @State private var selectedCategory: Category  = Category.옷
    @State private var isShowingPicker = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    //@Binding var viewState : String
    
    let placeholder = "오늘 새롭게 시도하고 싶은\n변화 한 가지를 직접 입력해주세요."
    
    var body: some View {
        
        GeometryReader { metrics in
            ZStack {
                
                Color(.white).edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .leading) {
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
                    .padding(.top, metrics.size.height * 0.02)
                    .font(.system(size: 20))
                    .padding(.bottom, metrics.size.height * 0.047)
                    
                    Text("직접 입력하기")
                        .font(.system(size: 24, weight: Font.Weight.bold))
                        .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                        .padding(.bottom, metrics.size.height * 0.03)
                    
                    Text("카테고리")
                        .font(.system(size: 15, weight: Font.Weight.light))
                        .foregroundColor(Color(red: 116/255, green: 116/255, blue: 116/255))
                        .padding(.bottom, metrics.size.height * 0.02)
                        .padding(.leading, metrics.size.width * 0.005)
                    
                    HStack {
                        
                        Text(selectedCategory.rawValue)
                            .font(.system(size: 14, weight: Font.Weight.light))
                            .foregroundColor(Color(red: 116/255, green: 116/255, blue: 116/255))
                        
                        Spacer()
                        
                        Image("arrowtriangle.down.fill")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(Color(red: 154/255, green: 194/255, blue: 135/255))
                            .frame(width: 11, height: 11)
                    } // HStack
                    .padding(.horizontal, metrics.size.width * 0.041)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color(red: 232/255, green: 232/255, blue: 232/255))
                            .frame(width: metrics.size.width * 0.88, height: metrics.size.height * 0.06)
                    )
                    .padding(.bottom, metrics.size.height * 0.025)
                    .onTapGesture {
                        self.isShowingPicker.toggle()
                    }
                    
                    Text("시도하고 싶은 변화")
                        .font(.system(size: 15, weight: Font.Weight.light))
                        .foregroundColor(Color(red: 116/255, green: 116/255, blue: 116/255))
                        .padding(.top, metrics.size.height * 0.02)
                        .padding(.leading, metrics.size.width * 0.005)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: Binding($differ, replacingNilWith: ""))
                            .padding(.leading, metrics.size.width * 0.026)
                            .padding(.top, metrics.size.height * 0.008)
                            .frame(width: metrics.size.width * 0.88, height: metrics.size.height * 0.181)
                            .border(Color(red: 232/255, green: 232/255, blue: 232/255), width: 1)
                            .cornerRadius(3)
                            .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14, weight: Font.Weight.light))
                            .lineSpacing(1.7)
                        
                        Text(differ ?? "오늘 새롭게 시도하고 싶은\n변화 한 가지를 직접 입력해주세요.")
                            .padding(.leading, metrics.size.width * 0.036)
                            .padding(.top, metrics.size.height * 0.02)
                            .font(.system(size: 14, weight: Font.Weight.light))
                            .foregroundColor(Color(red: 116/255, green: 116/255, blue: 116/255))
                            .lineSpacing(1.7)
                            .opacity(differ == nil ? 1 : 0)
                    } // ZStack
                    
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color(red: 154/255, green: 194/255, blue: 135/255))
                                .frame(width: metrics.size.width * 0.88, height: metrics.size.height * 0.06, alignment: .center)
                                .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 0)
                            
                            Text("추가하기")
                                .font(.system(size: 16, weight: Font.Weight.semibold))
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(.top, metrics.size.height * 0.03)
                    
                    Spacer()
                    
                    
                } // VStack
                .padding(.horizontal, metrics.size.width * 0.06)
                
                CategoryPicker(selection: self.$selectedCategory, isShowing: self.$isShowingPicker)
                    .animation(.linear)
                    .offset(y: self.isShowingPicker ? 0 : UIScreen.main.bounds.height)
                    .pickerStyle(.wheel)
                
            } // ZStack
        }
        .navigationBarHidden(true)
    }
}


