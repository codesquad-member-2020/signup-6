//
//  NetworkManager.swift
//  SignUp
//
//  Created by TTOzzi on 2020/03/27.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class NetworkManager {
    private let session: URLSession = URLSession.shared
    private let serverUrl = "https://87cda762-6dbe-4c52-a3cb-297f7f4c88dd.mock.pstmn.io"
    var idConfirmUrl: String {
        return serverUrl + "/api/users/exist/userId?userId="
    }
    
    func getRequest(url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        session.dataTask(with: request, completionHandler: completionHandler).resume()
    }
}
