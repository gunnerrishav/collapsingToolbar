//
//  ViewController.swift
//  collapsingToolbar
//
//  Created by Rishab Maharjan on 2/12/20.
//  Copyright © 2020 Rishab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collapsingViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var lastContentOffset: CGFloat = 0.0
    private var titleList = ["Fruits", "Animals", "Vegetables"]
    private var contentList = ["Apple", "Banana", "Grapes", "Papaya", "Rabbit", "Monkey", "Bear", "Deer", "Carrot", "Potato", "Cucumber", "Spinach", "Apple", "Banana", "Grapes", "Papaya", "Rabbit", "Monkey", "Bear", "Deer", "Carrot", "Potato", "Cucumber", "Spinach"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
        print("BaseUrl: \(Bundle.main.infoDictionary?["BaseUrl"] as! String)")
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as? ContentTableViewCell
        cell?.lblContent.text = contentList[indexPath.row]
        
        return cell ?? ContentTableViewCell()
    }
}

extension ViewController: UITableViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.tableView {
            if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
                //Scrolled to bottom
                UIView.animate(withDuration: 0.3) {
                    self.collapsingViewHeightConstraint.constant = 0.0
                    self.view.layoutIfNeeded()
                }
            }
            else if (scrollView.contentOffset.y < self.lastContentOffset || scrollView.contentOffset.y <= 0) && (self.collapsingViewHeightConstraint.constant != 150.0)  {
                //Scrolling up, scrolled to top
                UIView.animate(withDuration: 0.3) {
                    self.collapsingViewHeightConstraint.constant = 150.0
                    self.view.layoutIfNeeded()
                }
            }
            else if (scrollView.contentOffset.y > self.lastContentOffset) && self.collapsingViewHeightConstraint.constant != 0.0 {
                //Scrolling down
                UIView.animate(withDuration: 0.3) {
                    self.collapsingViewHeightConstraint.constant = 0.0
                    self.view.layoutIfNeeded()
                }
            }
            self.lastContentOffset = scrollView.contentOffset.y
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as? TitleCollectionViewCell
        cell?.lblTitle.text = titleList[indexPath.row]
        
        return cell ?? TitleCollectionViewCell()
    }
}
