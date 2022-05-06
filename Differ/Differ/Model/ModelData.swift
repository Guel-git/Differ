//
//  ModelData.swift
//  Landmarks
//
//  Created by 김유나 on 2022/04/02.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var Lists: [List] = load("DifferList.json")
}

// json 파일에서 Landmark가 있는 리스트를 받아오기 위해 ModelData.swift 파일 생성
// json 파일에서 데이터를 가져오는 load 라는 이름의 function 정의
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
