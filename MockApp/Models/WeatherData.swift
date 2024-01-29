//
//  WeatherData.swift
//  MockApp
//
//  Created by Harold Villacob on 29/01/24.
//

import Foundation

struct WeatherData: Codable {
    let location: Location
    let current: Current
}

struct Location: Codable {
    let region: String
    let localtime: String
}

struct Current: Codable {
    let condition: Condition
}

struct Condition: Codable {
    let text: String
    let icon: String
    let code: Double
}
