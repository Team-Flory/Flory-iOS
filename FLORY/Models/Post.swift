//
//  Post.swift
//  FLORY
//
//  Created by gourderased on 2023/10/24.
//

import Foundation

struct Post: Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
    var userId: Int
}
