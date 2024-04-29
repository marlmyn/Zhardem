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

//typealias Handler = (Swift.Result<Any?, APIError>) -> Void

typealias Handler = (Result<ResponseModel, APIError>) -> Void

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
    func callingLoginAPI(login: LoginModel, completionHandler: @escaping Handler) {
        let headers: HTTPHeaders = [.contentType("application/json")]
        AF.request(login_url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            
            switch response.result {
                case .success(let data):
                    guard let data = data else {
                        completionHandler(.failure(.custom(message: "No data was received from the server.")))
                        return
                    }
                    do {
                        let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                        print(responseModel)  // Debug print the model to verify correct decoding
                        completionHandler(.success(responseModel))
                    } catch {
                        print("Decoding error: \(error.localizedDescription)")
                        completionHandler(.failure(.custom(message: "Failed to decode the response. Please try again!")))
                    }
                    
                case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
                    completionHandler(.failure(.custom(message: "Network request failed: Please try again!")))
            }
        }
    }
    
    
    //MARK: - Logout
    func callingLogoutAPI(vc: UIViewController) {
        let headers: HTTPHeaders = [
            "user-token": "\(String(describing: TokenManager.tokenInstance.getToken))"
        ]
        
        AF.request(logout_url, method: .get, headers: headers).response{
            response in
            switch response.result {
                case .success(_):
                    TokenManager.tokenInstance.removeToken()
                    let rootVC = UIApplication.shared.windows.first?.rootViewController
                    if let topVC = UIApplication.topViewController() {
                        if rootVC?.children.first is TabBarController {
                            topVC.navigationController?.pushViewController(PageViewController.shareInstance(), animated: true)
                        } else {
                            topVC.navigationController?.popViewController(animated: true)
                        }
                    }
                case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
    
    //MARK: - Get Top Doctor
    func getDoctorList(accessToken: String, completion: @escaping (Result<[DoctorModel], Error>) -> Void) {
        let urlString = "https://sea-lion-app-usoaj.ondigitalocean.app/api/v1/doctor/getTopDoctor"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request(urlString, method: .get, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            let doctorList = try decoder.decode([DoctorModel].self, from: data)
                            completion(.success(doctorList))
                        } catch {
                            completion(.failure(error))
                        }
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
    }
  
    //MARK: - Get Articles
    
    func getArticleList(accessToken: String, completion: @escaping (Result<[ArticleModel], Error>) -> Void) {
//        let urlString = "https://sea-lion-app-usoaj.ondigitalocean.app/api/v1/doctor/getTopDoctor"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        AF.request(article_url, method: .get, headers: headers)
            .validate()
            .responseData { response in
                switch response.result {
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            let articleList = try decoder.decode([ArticleModel].self, from: data)
                            completion(.success(articleList))
                        } catch {
                            completion(.failure(error))
                        }
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
    }
    
}

