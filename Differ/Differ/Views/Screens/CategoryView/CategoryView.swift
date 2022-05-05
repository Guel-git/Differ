//
//  CategoryView.swift
//  Differ
//
//  Created by 김유나 on 2022/04/29.
//

import SwiftUI

struct CategoryView: View {
    
    let category = ["옷", "교통", "음식", "휴식", "운동", "업무", "청소", "인간관계"]
    
    @State var clothes = ["사놓고 안 입었던 옷 시도하기", "눈에 띄는 색으로 포인트 주기", "액세사리 하나 더 추가하기","커스텀 신발 만들기"]
    
    @Binding var viewState : String
    
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
    
    
    var body: some View {
        NavigationView {
            GeometryReader { metrics in
                
                ZStack {
                    
                    Color(.white).edgesIgnoringSafeArea(.all)
                    
                    VStack (alignment: .leading) {
                        // top bar -> 나중에 extension 으로 이동
                        HStack {
                            Text("홈")
                                .fontWeight(.heavy)
                                .padding(.trailing, metrics.size.width * 0.05)
                                .onTapGesture {
                                    viewState = "Category"
                                }
                            Text("모음집")
                                .foregroundColor(Color(red: 177/255, green: 177/255, blue: 177/255))
                                .onTapGesture {
                                    viewState = "Storage"
                                }
                            
                            Spacer()
                        } // HStack
                        .padding(.top, metrics.size.height * 0.01)
                        .font(.system(size: 20))
                        .padding(.bottom, metrics.size.height * 0.047)
                        
                        Text("오늘의 변화")
                            .font(.system(size: 24, weight: Font.Weight.bold))
                            .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                            .padding(.bottom, metrics.size.height * 0.005)
                        
                        Text("오늘 새롭게 시도해볼 변화는?\n아래에서 하나를 선택하거나, 직접 추가해보세요!")
                            .font(.system(size: 13, weight: .light))
                            .foregroundColor(Color(red: 142/255, green: 142/255, blue: 142/255))
                            .lineSpacing(1.5)
                            .padding(.bottom, metrics.size.height * 0.02)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(category, id: \.self) { category in
                                    Text(category)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: Font.Weight.bold))
                                        .padding(.horizontal, metrics.size.width * 0.04)
                                        .padding(.vertical, metrics.size.height * 0.009)
                                        .background(
                                            RoundedCornersShape(corners: [.topLeft, .topRight, .bottomRight], radius: 9)
                                                .fill(Color(red: 154/255, green: 194/255, blue: 135/255))
                                        )
                                }
                            }
                        } // ScrollView
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, metrics.size.height * 0.017)
                        
                        VStack(alignment: .center) {
                            ScrollView(showsIndicators: false) {
                                
                                ForEach(clothes, id: \.self) { cloth in
                                    
                                    Text(cloth)
                                        .font(.system(size: 16, weight: Font.Weight.regular))
                                        .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                                        .padding(.vertical, metrics.size.height * 0.02)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 9)
                                                .stroke(Color(red: 232/255, green: 232/255, blue: 232/255))
                                                .frame(width: metrics.size.width * 0.88)
                                            
                                        )
                                        .frame(width: metrics.size.width * 0.89, height: metrics.size.height * 0.071)
                                    
                                }
                                .padding(.bottom, metrics.size.height * 0.003)
                                
                                //.shadow(color: .black, radius: 2, x: 0, y: 0)
                                
                                // navigationlink 로 변경
                                NavigationLink(destination: CreateListView()) {
                                    Text("+ 추가하기")
                                        .font(.system(size: 16, weight: Font.Weight.regular))
                                        .foregroundColor(Color(red: 79/255, green: 79/255, blue: 79/255))
                                        .padding(.vertical, metrics.size.height * 0.018)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 9)
                                                .stroke(Color(red: 232/255, green: 232/255, blue: 232/255), style: StrokeStyle(lineWidth: 2, dash: [8]))
                                                .frame(width: metrics.size.width * 0.89)
                                        )
                                    
                                }
                            } // ScrollView
                            Spacer()
                            
                            NavigationLink(destination: ActView()) {
                                Text("도전하러 가기")
                                    .font(.system(size: 16, weight: Font.Weight.semibold))
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, metrics.size.height * 0.02)
                                    .background(
                                        RoundedRectangle(cornerRadius: 9)
                                            .fill(Color(red: 154/255, green: 194/255, blue: 135/255))
                                            .frame(width: metrics.size.width * 0.89, alignment: .center)
                                            .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 0)
                                    )
                                    .padding(.bottom, metrics.size.width * 0.01)
                            }
                        } // VStack
                        
                    } // VStack
                    .padding(.horizontal, metrics.size.width * 0.06)
                    
                } // ZStack
            } // GeometryReader
            .navigationBarHidden(true)
            
        } // NavigationView
    }
}
