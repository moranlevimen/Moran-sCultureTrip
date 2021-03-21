//
//  ArticlesViewController.swift
//  Moran'sCultureTrip
//
//  Created by moran levi on 21/03/2021.
//

import UIKit
class ArticlesViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        vcInit()
        getData()
        self.tableView.tableFooterView = UIView()
    }
    
    func vcInit(){
    //    self.activityIndicator.startAnimating()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 500
        let nib = UINib(nibName: "ArticleCell", bundle: nil);
        self.tableView.register(nib, forCellReuseIdentifier: "ArticleCell");
    }
    
    func getData(){

        DispatchQueue.global(qos: .background).async {

            ServerManager.getServerManager().getArticlesListJson() { (data) in
                if  let articlesList = data{ //if the data exsit
                    DataManager.getDataManager().setArticlesArray(articlesList: articlesList)
                    DispatchQueue.main.async {
                        
                        self.tableView.reloadData()
                       // self.activityIndicator.stopAnimating()

                    }
                }
                else{
                    print("No Data")
                }
            }
        }
        
    }
}

extension ArticlesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.getDataManager().getArticlesArray().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell;
        cell.setArticleCell(article: DataManager.getDataManager().getArticlesArray()[indexPath.row])

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
