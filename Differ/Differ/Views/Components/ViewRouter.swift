//
//  ViewRouter.swift
//  Differ
//
//  Created by 김유나 on 2022/05/05.
//

import SwiftUI

struct ViewRouter: View {
    
    @State var viewState = "";
    
    init() {
        print("여기는 view router")
    }
    
    var body: some View {
        switch viewState {
        case "Category":
            CategoryView(viewState: $viewState)
        case "Storage":
            StorageView(viewState: $viewState)
        default :
            CategoryView(viewState: $viewState)
        }
    }
    
}
