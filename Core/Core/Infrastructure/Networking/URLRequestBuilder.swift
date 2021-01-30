//
//  URLRequestBuilder.swift
//  Core
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

class URLRequestBuilder<RM: Codable> {
    
    var url: URL?
    var body: Data?
    var httpMethod: HTTPMethod?
    var baseURL: String = "https://api.themoviedb.org"
    var endpoint: String = ""
    
    init(endpoint: String) {
        self.endpoint = endpoint
    }
    
    func set(method: HTTPMethod) -> URLRequestBuilder {
        self.httpMethod = method
        return self
    }
    
    func setURL(with requestModel: RM?) -> URLRequestBuilder {
        guard httpMethod != nil else { return self }
        url = createPath(reqModel: requestModel)
        return self
    }
    
    func setBody(with requestModel: RM?) -> URLRequestBuilder {
        body = requestModel?.convertData
        return self
    }
    
    func build() -> URLRequest {
        guard let url = url else {
            fatalError("URL could not be built")
        }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod?.rawValue
        request.httpBody = httpMethod == .get ? nil : body
        
        return request
    }
    
    private func createPath(reqModel: RM?) -> URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = endpoint
        
        if httpMethod == .get {
            // add query items to url
            guard let parameters = reqModel.dictionary as? [String: String] else {
                fatalError("parameters for GET http method must conform to [String: String]")
            }
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        return urlComponents?.url
    }
}
