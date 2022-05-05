//
//  StorageView.swift
//  Differ
//
//  Created by 김유나 on 2022/04/29.
//

import SwiftUI

struct PageView: View {
    
    let latest = ["친해지고 싶었던 사람에게 말 걸기", "커스텀 신발 만들기", "색다른 소스 조합 먹기"]
    
    var body: some View {
        
        TabView {
            ForEach(latest, id: \.self) { latest in
                ZStack {
                    Color(red: 154/255, green: 194/255, blue: 135/255)
                    VStack {
                        Text("22.04.27")
                            .font(.system(size: 13, weight: Font.Weight.regular))
                            .padding(.top, UIScreen.main.bounds.height * 0.022)
                            .padding(.bottom, UIScreen.main.bounds.height * 0.002)
                        Text(latest)
                            .font(.system(size: 21, weight: Font.Weight.semibold))
                            .padding(.top, 0)
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    
                }
                .clipShape(
                    RoundedRectangle(cornerRadius: 13.0)
                    
                )
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.87, height: UIScreen.main.bounds.height * 0.154)
        .tabViewStyle(PageTabViewStyle())
    }
    
}

struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct StorageView: View {
    
    @Binding var viewState : String
    
    let category = ["옷", "교통", "음식", "휴식", "운동", "업무", "청소", "인간관계"]
    @State var clothes = ["사놓고 안 입었던 옷 시도하기", "눈에 띄는 색으로 포인트 주기", "액세사리 하나 더 추가하기", "커스텀 신발 만들기", "사놓고 안 입었던 옷 시도하기", "사놓고 안 입었던 옷 시도하기"]
    
    var body: some View {
        
        ZStack {
            
            Color(.white).edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .center) {
                HStack {
                    
      
                        Text("홈")
                            .fontWeight(.regular)
                            .padding(.trailing, UIScreen.main.bounds.width * 0.05)
                            .foregroundColor(Color(red: 177/255, green: 177/255, blue: 177/255))
                            .onTapGesture {
                                viewState = "Category"
                            }
                    
                    
                   
                        Text("모음집")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                            .onTapGesture {
                                viewState = "Storage"
                            }
                    
                    Spacer()
                    
                } // HStack
                .padding(.top, UIScreen.main.bounds.height * 0.01)
                .font(.system(size: 20))
                .padding(.bottom, UIScreen.main.bounds.height * 0.03)
                
                ScrollView {
                    LazyHStack {
                        PageView()
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.87, height: 130)
                .padding(.bottom, UIScreen.main.bounds.height * 0.02)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(category, id: \.self) { category in
                            Text(category)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: Font.Weight.bold))
                                .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                                .padding(.vertical, UIScreen.main.bounds.height * 0.009)
                                .background(
                                    RoundedCornersShape(corners: [.topLeft, .topRight, .bottomRight], radius: 9)
                                        .fill(Color(red: 154/255, green: 194/255, blue: 135/255))
                                )
                        }
                    }
                } // ScrollView
                .frame(maxWidth: .infinity)
                .padding(.bottom, UIScreen.main.bounds.height * 0.01)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color(red: 232/255, green: 232/255, blue: 232/255))
                        .frame(height: UIScreen.main.bounds.height * 0.542)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            ForEach(clothes, id: \.self) { cloth in
                                HStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color(red: 221/255, green: 243/255, blue: 159/255))
                                            .frame(width: UIScreen.main.bounds.width * 0.09, height: UIScreen.main.bounds.width * 0.09)
                                        Text("35")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 17, weight: Font.Weight.semibold))
                                    }
                                    .padding(.trailing, UIScreen.main.bounds.width * 0.05)
                                    VStack(alignment: .leading) {
                                        Text(cloth)
                                            .font(.system(size: 16, weight: Font.Weight.light))
                                            .padding(.bottom, UIScreen.main.bounds.height * 0.001)
                                            .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                                        Text("작년에 사둔 생지 바지가 생각보다 예뻤네? ㅋㅋㅋ")
                                            .foregroundColor(Color(red: 166/255, green: 166/255, blue: 166/255))
                                            .font(.system(size: 11, weight: Font.Weight.medium))
                                    }
                                }
                                .padding(.vertical, UIScreen.main.bounds.height * 0.02)
                                
                                Divider()
                            }
                        }
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                        .padding(.top, UIScreen.main.bounds.height * 0.01)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.542)
                }
                
                
                Spacer()
                
            } // VStack
            .padding(.horizontal, UIScreen.main.bounds.width * 0.06)
            
            
        } // ZStack
    }
}
