//
//  ServerManager.swift
//  Moran'sCultureTrip
//
//  Created by moran levi on 21/03/2021.
//

import Foundation
class ServerManager{
    
        private static var sharedInstance:ServerManager?
    //singletone- one instance-allow me to do a single instance.need to init only one time.
        private init(){}
        public  static func getServerManager()->ServerManager
        {
            if ServerManager.sharedInstance == nil{
                ServerManager.sharedInstance = ServerManager()
            }
            return ServerManager.sharedInstance!
        }
        //escapint in order to use from outside.
        
        //prepefe for request- creates the func' but yet not call it
        func getArticlesListJson(completion:@escaping(ArticlesList?)->())  {
            guard let url = URL(string: "https://cdn.theculturetrip.com/home-assignment/response.json") else {return}
            URLSession.shared.dataTask(with: url){(data,respose,error) in
                if error != nil {
                    // handle the transport error
                    completion(nil)
                    return
                }
                do{
                    let articlesList = try JSONDecoder().decode(ArticlesList.self, from: data!)
                    print(articlesList)
                    completion(articlesList)
                }
                catch{
                    print(error.localizedDescription)
                    completion(nil)
                }
                }.resume()
        }
      
        func getMovieJson(url:String,completion: @escaping (Article?) -> ())  {
            guard let url = URL(string: url) else {return}
            URLSession.shared.dataTask(with: url){(data,respose,error) in
                if error != nil {
                    // handle the transport error
                    completion(nil)
                    return
                }
                do{

                    let article = try JSONDecoder().decode(Article.self, from: data!);
                    completion(article)
                }
                catch{
                    print("error")
                    completion(nil)
                }
                }.resume()
        }
    }

