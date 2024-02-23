//
//  NetworkManager.swift
//  Appertizer
//
//  Created by Long Nguyễn on 22/12/2023.
//

import UIKit

final class NetworkManager {
   
   static let shared = NetworkManager()
   private let cache = NSCache<NSString, UIImage>()
   
   static private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
   private let appetizerURL = baseURL + "appetizers"
   
   private init() {}
   
   func getAppetizer2(completed: @escaping (Result<[Appetizer], APError>) -> (Void)) {
      
      guard let url = URL(string: appetizerURL) else {
         completed(.failure(.invalidURL))
         return
      }
      
      let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
         if let _ = error {
            completed(.failure(.unableToComplete))
            return
         }
         
         guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            completed(.failure(.invalidResponse)) 
            return
         }
         
         guard let data else {
            completed(.failure(.invalidData))
            return
         }
         
         do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            completed(.success(decodedResponse.request))
         } catch {
            completed(.failure(.invalidData))
         }
      }
      
      task.resume()
   }
   
   func getAppetizer() async throws -> [Appetizer] {
      guard let url = URL(string: appetizerURL) else {
         throw APError.invalidURL
      }
      
      let (data, _) = try await URLSession.shared.data(from: url)
      
      do {
         let decoder = JSONDecoder()
         return try decoder.decode(AppetizerResponse.self, from: data).request
      } catch {
         throw APError.invalidData
      }
   }
   
   func downloadImage(fromUrlString: String, complete: @escaping ((UIImage?) -> Void)) {
      
      let cacheKey = NSString(string: fromUrlString)
      if let image = cache.object(forKey: cacheKey) {
         complete(image)
         return
      }
      
      guard let url = URL(string: fromUrlString) else {
         complete(nil)
         return
      }
      
      let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
         guard let data, let image = UIImage(data: data) else {
            complete(nil)
            return
         }
         
         self.cache.setObject(image, forKey: cacheKey)
         complete(image)
      }
      
      task.resume()
   }
}
