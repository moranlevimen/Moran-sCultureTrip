//
//  DataManager.swift
//  Moran'sCultureTrip
//
//  Created by moran levi on 21/03/2021.
//

import Foundation

class DataManager {
    private static var sharedInstance:DataManager?;
    private init(){}
    //singletone
    public  static func getDataManager()->DataManager
    {
        if DataManager.sharedInstance == nil{
            DataManager.sharedInstance = DataManager();
        }
        return DataManager.sharedInstance!
    }
    
    private var articles:[Article] = []
    
    func setArticlesArray(articlesList:ArticlesList)  {
        self.articles = articlesList.data.sorted(by: {$0.likesCount ?? 1 > $1.likesCount ?? 0})
    }
    func getArticlesArray() -> [Article] {
        return self.articles
    }

}
