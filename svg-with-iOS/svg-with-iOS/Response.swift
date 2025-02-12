//
//  Response.swift
//  svg-with-iOS
//
//  Created by 이승준 on 2/12/25.
//

struct PuppyInfoResponse: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: PuppyInfoResult
}

struct PuppyInfoResult: Codable {
    let puppyId: Int
    let puppyName: String
    let level: Int
    let levelName: String
    let imageUrl: String?
    let levelMinExp: Int
    let levelMaxExp: Int
    let puppyExp: Int
}


struct PuppyNameResponse: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: String
}


struct PuppyPointResponse: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: Int?
}
