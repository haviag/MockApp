//
//  ApiCaller.swift
//  MockApp
//
//  Created by Harold Villacob on 29/01/24.
//

import Foundation

final class ApiCaller {
    static let shared = ApiCaller()
    
    private struct Constants {
        static let endpoint = "https://api.weatherapi.com/v1/current.json?key=9745357b64764a1c926173930223105&q=London&aqi=no"
    }
    
    private init() {}
    
    public func getEndpointData(completion: @escaping (Result<WeatherData, Error>) -> Void) {
        
        guard let url = URL(string: Constants.endpoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(.success(weatherData))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
