//
//  API.swift
//  Duino-Coin
//
//  Created by Fahim Rahman on 11/29/21.
//

import Foundation

class Networking {
    
    static func getRequest<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) async {
        
        guard let url = url else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedData = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(decodedData))
            }
        }
        catch {
            completion(.failure(error))
        }
    }
}
