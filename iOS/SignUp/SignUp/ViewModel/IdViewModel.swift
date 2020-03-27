//
//  IdViewModel.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/25.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class IdViewModel {
    private let networkManager = NetworkManager()
    private let idRegExr = "^[a-z0-9_-]{5,20}$"
    var id = Dynamic<String>.init("")
    var idDidChanged: ((Bool) -> Void) = { _ in }
    var isIdValid = Dynamic<Bool>.init(false)
    var idDuplication: IdDuplicationResult? {
        didSet {
            idDuplicationChanged(idDuplication!.message)
        }
    }
    var idDuplicationChanged: ((Bool) -> Void) = { _ in }
    
    struct IdDuplicationResult: Codable {
        var message: Bool
    }
    
    init() {
        id.boundClosure = { text in
            self.isIdValid.value = self.verifyIdInput(id: text)
        }
        isIdValid.boundClosure = { result in
            self.idDidChanged(result)
            if result {
                self.confirmIdDuplication(id: self.id.value!)
            }
        }
    }
    
    private func verifyIdInput(id: String) -> Bool {
        return !id.match(with: idRegExr).isEmpty
    }
    
    private func confirmIdDuplication(id: String) {
        let urlString = networkManager.idConfirmUrl + id
        guard let url = URL(string: urlString) else { return }
        networkManager.getRequest(url: url) { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                self.idDuplication = try decoder.decode(IdDuplicationResult.self, from: data)
            } catch {
                self.idDuplication = IdDuplicationResult(message: false)
            }
        }
    }
}
