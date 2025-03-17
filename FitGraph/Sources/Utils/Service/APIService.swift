import SwiftUI

protocol APIErrorProtocol: Error {
    var message: String { get }
}

protocol APIRequestProtocol {
//    associatedtype UserData
//    associatedtype ImageData
    associatedtype ResponseData
    
    var endpoint: String { get }
    var requestType: RequestType { get }
}

enum RequestType: Any {
    case userData
    case imageData
}

// 특정 API 요청 정의
struct GetUserRequest: APIRequestProtocol {
//    typealias UserData = User
//    typealias ImageData = UIImage
    typealias ResponseData = Any
    
    var endpoint: String = "/user"
    let requestType: RequestType
    
    init(requestType: RequestType) {
        self.requestType = requestType
    }
}

enum DefaultAPIError: APIErrorProtocol {
    case urlError
    case serverError
    
    var message: String {
        switch self {
        case .urlError: return "URL ERROR"
        case .serverError: return "SERVER ERROR"
        }
    }
}

typealias APICompletion<Response, APIError: APIErrorProtocol> = (Result<Response, APIError>) -> Void

protocol APIClientProtocol {
    associatedtype Request: APIRequestProtocol
    associatedtype APIError: APIErrorProtocol
    
    func performRequest(request: Request, completion: @escaping APICompletion<Request.ResponseData, APIError>)
}

// API Client 구현체
struct DefaultAPIClient: APIClientProtocol {
    typealias Request = GetUserRequest
    typealias APIError = DefaultAPIError
    
    func performRequest(request: Request, completion: @escaping APICompletion<Request.ResponseData, APIError>) {
        // 네트워크 요청 시뮬레이션
        switch request.requestType {
        case .userData:
            let user = User(name: "ckw", age: 30)
            completion(.success(user))
        case .imageData:
            let image = UIImage(systemName: "photo")!
            completion(.success(image))
        }
        
        // 에러 발생 시:
//        completion(.failure(.serverError))
    }
}

// 모델
struct User: Decodable {
    let name: String
    let age: Int
}
