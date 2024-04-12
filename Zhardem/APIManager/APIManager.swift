//
//  APIManager.swift
//  Zhardem
//
//  Created by Akmaral Ergesh on 02.04.2024.
//

import UIKit
import Alamofire

enum APIError: Error {
    case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIError>) -> Void 

class APIManager {
    static let shareInstance = APIManager()
    
    //MARK: - Register
    func callingRegisterAPI(register: RegisterModel, completionHandler: @escaping (Bool, String) -> ()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result {
                case .success(let data):
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        if response.response?.statusCode == 201 {
                            completionHandler(true, "Your account has been successfully registered")
                        } else {
                            completionHandler(false, "Please try again!")
                        }
                    } catch {
                        print(error.localizedDescription)
                        completionHandler(false, "Please try again!")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    completionHandler(false, "Please try again!")
            }
        }
    }
    
    //MARK: - Login
    func callingLoginAPI(login: LoginModel, completionHandler: @escaping (Bool, String) -> ()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(login_url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            
            switch response.result {
                case .success(let data):
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        if response.response?.statusCode == 200 {
                            completionHandler(true, "Once again you login successfully into Zhardem app")
                        } else {
                            completionHandler(false, "*The password you entered is wrong")
                        }
                    } catch {
                        print(error.localizedDescription)
                        completionHandler(false, "Please try again!")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    completionHandler(false, "Please try again!")
            }
        }
    }
    
}
