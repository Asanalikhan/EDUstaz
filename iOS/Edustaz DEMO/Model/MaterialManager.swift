//
//  MaterialManager.swift
//  Edustaz DEMO
//
//  Created by Yernur Adilbek on 5/5/25.
//

import Foundation

class MaterialManager {
    static let shared = MaterialManager()
    private init() {
        loadMyMaterials()
    }

    var materials: [Material] = Material.materialsData

    private(set) var myMaterials: [Material] = []

    func add(_ material: Material) {
        materials.append(material)
        myMaterials.append(material)
        saveMyMaterials()
    }

    private let myMaterialsKey = "MyMaterials"

    private func saveMyMaterials() {
        if let encoded = try? JSONEncoder().encode(myMaterials) {
            UserDefaults.standard.set(encoded, forKey: myMaterialsKey)
        }
    }

    private func loadMyMaterials() {
        if let data = UserDefaults.standard.data(forKey: myMaterialsKey),
           let decoded = try? JSONDecoder().decode([Material].self, from: data) {
            myMaterials = decoded
        }
    }
}

