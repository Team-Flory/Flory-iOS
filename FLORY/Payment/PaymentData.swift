//
//  PaymentData.swift
//  FLORY
//
//  Created by gourderased on 11/15/23.
//

import Foundation

struct PaymentData: Codable {
    var memberId: Int
    var receiverNickname: String
    var flowerId: Int
    var receiveDate: String
}
