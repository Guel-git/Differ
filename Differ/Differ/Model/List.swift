//
//  Landmark.swift
//  Landmarks
//
//  Created by 김유나 on 2022/04/02.
//

import Foundation
import SwiftUI

struct List: Hashable, Codable, Identifiable {
    var id: Int
    var category: String
    var name: String
}
