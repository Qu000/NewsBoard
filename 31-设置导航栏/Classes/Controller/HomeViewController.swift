//
//  HomeViewController.swift
//  31-设置导航栏
//
//  Created by qujiahong on 2017/11/28.
//  Copyright © 2017年 瞿嘉洪. All rights reserved.
//

import UIKit
import Alamofire
// MARK: - 定义全局常量
private let kHomeCellID = "kHomeCellID"

// MARK: - 类的声明
class HomeViewController: UIViewController {

    // MARK: - 懒加载属性
    fileprivate lazy var newsModels : [NewsModel] = [NewsModel]()
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        //1.创建tableView
        let tableView = UITableView()
        
        //2.设置tableView相关的属性
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        
        //3.注册cell
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kHomeCellID)
        
        tableView.register(UINib(nibName: "NewsViewCell", bundle: nil), forCellReuseIdentifier: kHomeCellID)
        
        return tableView
    }()
    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.设置导航栏
        setupNavigationBar()
        
        // 2.添加TableView
        self.view.addSubview(tableView)
        
        // 3.请求数据
        loadData()
    }

}

// MARK: - 设置UI界面
extension HomeViewController {
    fileprivate func setupNavigationBar() {
        // 1.设置背景图
        navigationController?.navigationBar.setBackgroundImage(UIImage(named:"extra_tag"), for: .default)
        
        // 2.设置title
        navigationItem.titleView = UIImageView(image: UIImage(named: "Classics_Icon-60"))
        
        // 3.设置右侧的搜索按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchClick))
    }
    
}
// MARK: - 事件监听的函数
extension HomeViewController {
    
    @objc fileprivate func searchClick() {
        print("点击了搜索")
    }
    //    override var preferredStatusBarStyle: UIStatusBarStyle {
    //        return .lightContent
    //    }
}
// MARK: - 网络数据请求
extension HomeViewController {
    fileprivate func loadData() {
        NetworkTools.requestData(URLString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get) { (result) in

            //1.将Any类型转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            //2.根据T1348649079062的key取出内容
            guard let dataArray = resultDict["T1348649079062"] as? [[String : NSObject]] else { return }
            //3.遍历字典，将字典转成模型对象
            for dict in dataArray {
                self.newsModels.append(NewsModel(dict: dict))
                print(dict)
            }
            
            //4.刷新表格
            self.tableView.reloadData()
        }
    }
}

// MARK: - 遵守数据源协议
extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.获取cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellID, for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellID, for: indexPath) as! NewsViewCell
        
        //2.给cell设置数据
//        cell.textLabel?.text = newsModels[indexPath.row].title
        cell.newsModel = newsModels[indexPath.row]
        return cell
    }
}
