//
//  WeatherViewModel.swift
//  MockApp
//
//  Created by Harold Villacob on 29/01/24.
//

import Foundation

class WeatherViewModel {
    
    var region: String? {
        return model?.location.region
    }
    var localTime: String? {
        return model?.location.localtime
    }
    var conditionText: String? {
        return model?.current.condition.text
    }
    var model: WeatherData?
    
    var successCallback: (() -> Void)?
    
    init() {
        
    }
    
    func fetchWeatherData() {
        ApiCaller.shared.getEndpointData(completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.model = data
                self?.successCallback?()
            case .failure(_):
                print("Error")
            }
        })
    }
}
