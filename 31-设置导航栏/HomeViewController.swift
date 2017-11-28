//
//  HomeViewController.swift
//  31-设置导航栏
//
//  Created by qujiahong on 2017/11/28.
//  Copyright © 2017年 瞿嘉洪. All rights reserved.
//

import UIKit
import Alamofire

// MARK: - 类的声明
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.设置导航栏
        setupNavigationBar()
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




