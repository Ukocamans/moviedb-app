//
//  NetworkRequest.swift
//  Core
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

protocol Request {
    var endpoint: String {get}
    var showLoading: Bool {get}
    var httpMethod: HTTPMethod { get }
    var blockUI: Bool {get}
}

public enum NetworkResult<T> {
    case success(T)
    case failure(Error)
    case empty
}

open class NetworkRequest<RM: Codable, M: Codable>: Request {
    
    public init() {
        
    }
    
    var urlSession = URLSession.shared
    
    public var endpoint: String = ""
    public var httpMethod: HTTPMethod = .get
    public var showLoading: Bool = false
    public var blockUI: Bool = false
    
    public func send(reqModel: RM?, completion: @escaping ((NetworkResult<M>) -> Void)) -> Void {
        
        let request = URLRequestBuilder(endpoint: endpoint)
            .set(method: httpMethod)
            .setURL(with: reqModel)
            .setBody(with: reqModel)
            .build()
        
        call(request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let resp = try decoder.decode(M.self, from: data)
                    completion(.success(resp))
                }
                catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            case .empty:
                completion(.empty)
            }
        }
    }
    
    private func call(_ request: URLRequest, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (NetworkResult<Data>) -> Void) {
        urlSession.dataTask(with: request) { (data, _, error) in
            if let error = error {
                deliverQueue.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                deliverQueue.async {
                    completion(.success(data))
                }
            } else {
                deliverQueue.async {
                    completion(.empty)
                }
            }
        }.resume()
    }
    
}
