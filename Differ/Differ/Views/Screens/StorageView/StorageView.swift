//
//  StorageView.swift
//  Differ
//
//  Created by 김유나 on 2022/04/29.
//

import SwiftUI

struct PageView: View {
    
    let latest = [["22.05.03", "친해지고 싶었던 사람에게 말 걸기"], ["22.05.04", "커스텀 신발 만들기"], ["22.05.05", "색다른 소스 조합 먹기"]]
    
    var body: some View {
        
        TabView {
            ForEach(latest, id: \.self) { latest in
                ZStack {
                    Color(red: 154/255, green: 194/255, blue: 135/255)
                    VStack {
                        Text(latest[0])
                            .font(.system(size: 13, weight: Font.Weight.regular))
                            .padding(.top, UIScreen.main.bounds.height * 0.022)
                            .padding(.bottom, UIScreen.main.bounds.height * 0.002)
                        Text(latest[1])
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
    @State var selected = 0
    
    @Binding var amount: Double
    @Binding var comment: String
    
    let category = ["옷", "교통", "음식", "휴식", "운동", "업무", "청소", "인간관계"]
    
    let clothes = [["98", "눈에 띄는 색으로 포인트 주기", "색깔이 추가돼서 그런지 생기가 있었다!"], ["92", "액세사리 하나 더 추가하기", "손에 낀 반지 볼 때마다 행복.."]]
    
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
                        ForEach(category.indices) { index in
                            Button(action: {
                                selected = Int(index)
//                                        print("\(selected)")
                            }) {
                                Text(category[index])
                                    .foregroundColor(index == selected ? .white : Color(red: 79/255, green: 79/255, blue: 79/255))
                                    .font(.system(size: 15, weight: Font.Weight.bold))
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                                    .padding(.vertical, UIScreen.main.bounds.height * 0.009)
                                    .background(
                                        RoundedCornersShape(corners: [.topLeft, .topRight, .bottomRight], radius: 9)
                                            .fill(index == selected ? Color(red: 154/255, green: 194/255, blue: 135/255) : Color(red: 242/255, green: 242/255, blue: 242/255))
                                    )
                            }
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
                                        Text(cloth[0])
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 17, weight: Font.Weight.semibold))
                                    }
                                    .padding(.trailing, UIScreen.main.bounds.width * 0.05)
                                    VStack(alignment: .leading) {
                                        Text(cloth[1])
                                            .font(.system(size: 16, weight: Font.Weight.light))
                                            .padding(.bottom, UIScreen.main.bounds.height * 0.001)
                                            .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                                        Text(cloth[2])
                                            .foregroundColor(Color(red: 166/255, green: 166/255, blue: 166/255))
                                            .font(.system(size: 11, weight: Font.Weight.medium))
                                    }
                                }
                                .padding(.vertical, UIScreen.main.bounds.height * 0.02)
                                
                                Divider()
                            }
                            
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(red: 221/255, green: 243/255, blue: 159/255))
                                        .frame(width: UIScreen.main.bounds.width * 0.09, height: UIScreen.main.bounds.width * 0.09)
                                    Text(String(Int(amount)))
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 17, weight: Font.Weight.semibold))
                                }
                                .padding(.trailing, UIScreen.main.bounds.width * 0.05)
                                VStack(alignment: .leading) {
                                    Text("사놓고 안 입었던 옷 시도하기")
                                        .font(.system(size: 16, weight: Font.Weight.light))
                                        .padding(.bottom, UIScreen.main.bounds.height * 0.001)
                                        .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                                    Text(comment)
                                        .foregroundColor(Color(red: 166/255, green: 166/255, blue: 166/255))
                                        .font(.system(size: 11, weight: Font.Weight.medium))
                                }
                            }
                            .padding(.vertical, UIScreen.main.bounds.height * 0.02)
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
