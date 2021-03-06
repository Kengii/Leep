//
//  LocalDataFetcher.swift
//  instas
//
//  Created by Владимир Данилович on 27.03.22.
//

import Foundation


final class LocalDataFetcher: NetworkDataFetcher {
    override func fetchGenericJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T: Decodable {
        // достаем URL
        guard let localFileURL = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Couldn't find \(urlString) in main bundle.")
            response(nil)
            return
        }

        // достаем Data
        let data = try? Data(contentsOf: localFileURL)

        // парсим
        let decoded = self.decodeJSON(type: T.self, data: data)
        response(decoded)
    }
}
