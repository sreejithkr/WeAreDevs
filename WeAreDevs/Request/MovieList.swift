//
//  MovieList.swift
//  WeAreDevs
//
//  Created by sreejitkr on 18/11/19.
//  Copyright © 2019 SKR. All rights reserved.
//
import Foundation

struct MovieListRequest: BaseRequest {
    
    var url: URL {
      return URL(string: basePath+relativePath)!
    }
    var basePath: String = AppConfig.current.environment.basePath
    var relativePath: String 
    var headers: [String : Any]?
    
    init(relativePath: String) {
        self.relativePath = relativePath
    }
    
    func parse(data: Data?, response: URLResponse?, error: Error?) -> MoviesListResponse {
        var response = handleError(data: data, error: error)
        guard let data = data, response.error == nil else {
            return response
        }
        do {
            let decoder = JSONDecoder()
            let moviesList = try decoder.decode(MoviesListResponse.Data.self, from: data)
            response.data = moviesList
        } catch let err {
            response.error = ServiceError(reason: err.localizedDescription)
        }
        return response
    }
    
     func handleError(data: Data?, error: Error?) -> MoviesListResponse {
        var response = MoviesListResponse()
        if let error = error  {
            response.error = ServiceError(reason: error.localizedDescription)
            return response
        }
        guard data != nil else {
            response.error = ServiceError(reason: "No Data")
            return response
        }
        return response
    }
}

struct Movie: Codable {
    let title: String
    let releaseDate, mpaaRating: String
    let distributor: String
    let source, majorGenre, creativeType: String?
  
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case releaseDate = "Release_Date"
        case mpaaRating = "MPAA_Rating"
        case distributor = "Distributor"
        case source = "Source"
        case majorGenre = "Major_Genre"
        case creativeType = "Creative_Type"
    }
}

struct MoviesListResponse: BaseResponse {
    var error: ServiceError?
    var data: [Movie]?
}
