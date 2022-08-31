//
//  Mocker.swift
//  SpaceX
//
//  Created by mac on 29.08.2022.
//

import Foundation
import UIKit

class Mocker {
    static func loadJson(fileName: String) -> [String: Any] {
        guard let jsonDictionary = JSONExposer().loadFileAsDictionary(fileName) else { return [:] }
        guard let data = jsonDictionary["data"] as? [String: Any] else { return [:] }

        return data
    }

    static func loadHomeInfoMock() throws -> (HomeInfoQuery.Data) {
        do {
            let json = Mocker.loadJson(fileName: "homeInfo")
            let data = try HomeInfoQuery.Data(jsonObject: json)
            return data
        } catch {
            throw error
        }
    }

    static func loadLauchesMock() throws -> (LaunchesQuery.Data) {
        do {
            let json = Mocker.loadJson(fileName: "launches")
            let data = try LaunchesQuery.Data(jsonObject: json)
            return data
        } catch {
            throw error
        }
    }
}

public class JSONExposer: NSObject {
    @objc public func loadFileAsDictionary(_ name: String) -> [String: Any]? {
        let optionalAsset = NSDataAsset(name: name, bundle: Bundle(for: type(of: self)))
        guard let asset = optionalAsset else {
            fatalError("could not find \(name)")
        }
        let json = try? JSONSerialization.jsonObject(with: asset.data, options: JSONSerialization.ReadingOptions.allowFragments)
        return json as? [String: Any]
    }
}
