//
//  ViewRouter.swift
//  Differ
//
//  Created by 김유나 on 2022/05/05.
//

import SwiftUI

struct ViewRouter: View {
    
    @State var viewState = "";
    @State var amount: Double = 0.0
    @State var comment: String = ""
    
    var body: some View {
        switch viewState {
        case "Category":
            CategoryView(viewState: $viewState, amount: $amount, comment: $comment)
        case "Storage":
            StorageView(viewState: $viewState, amount: $amount, comment: $comment)
        default :
            CategoryView(viewState: $viewState, amount: $amount, comment: $comment)
        }
    }
    
}
