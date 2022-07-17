//
//  APICaller.swift
//  Netflix CloneCoding
//
//  Created by heojaenyeong on 2022/07/17.
//

import Foundation
struct Constants {
    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyDqX8axTGeNpXRiISTGL7Tya7fjKJDYi4g"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}
enum APIError: Error{
    case failedTogetData
    
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                //let results = try JSONSerialization.jsonObject(with:data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self,from:data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    func getTrendingTvs(completion: @escaping (Result<[String],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONSerialization.jsonObject(with:data, options: .fragmentsAllowed)
                //let results = try JSONDecoder().decode(TrendingMoviesResponse.self,from:data)
                //completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
}
