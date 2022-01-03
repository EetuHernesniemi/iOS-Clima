//
//  Environment.swift
//  Clima
//
//  Created by Eetu Hernesniemi on 3.1.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let openWeatherApiKey = "OPEN_WEATHER_API_KEY"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    
    static let openWeatherApiKey: String = {
        guard let apiKey = Environment.infoDictionary[Keys.Plist.openWeatherApiKey] as? String else {
            fatalError("Open Weather API Key not set in plist for this environment")
        }
        if apiKey == "" {
            fatalError("Open Weather API Key has not been defined")
        }
        return apiKey
    }()
}
