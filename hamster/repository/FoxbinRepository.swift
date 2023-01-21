//
//  FoxbinRepository.swift
//  hamster
//
//  Created by mi11ion on 20/01/2023.
//

import Foundation

class FoxbinRepository: BaseRepository {
    
    func provideContent(key: String) async -> Result<String, Error> {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://foxbin.f0x1d.com/get/\(key)")!)
            
            let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
            guard let note = (json["note"] as? [String: Any]) else {
                throw FoxbinError(message: json["error"] as! String)
            }
            let content = note["content"] as! String
            
            return Result.success(content)
        } catch let error {
            return Result.failure(error)
        }
    }
}

struct FoxbinError: Error {
    var message: String
}
