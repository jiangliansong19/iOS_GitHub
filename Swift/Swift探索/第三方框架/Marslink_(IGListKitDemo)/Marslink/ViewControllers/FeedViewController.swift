//
//  FeddViewController.swift
//  Marslink
//
//  Created by @JLS on 2017/8/20.
//  Copyright © 2017年 Ray Wenderlich. All rights reserved.
//

import UIKit
import IGListKit
import MJRefresh

class FeedViewController: UIViewController {
    let loader = JournalEntryLoader()
    let pathfinder = Pathfinder()
    let wxScanner = WxScanner()
    
    let collectionView: IGListCollectionView = {
        let view = IGListCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = UIColor.black
        view.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2, execute: {
                view.mj_header.endRefreshing()
            })
        })
        
        return view
    }()
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.loadLatest()
        
        view.addSubview(collectionView)
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension FeedViewController: IGListAdapterDataSource {
    // 1
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        // 1
        var items: [IGListDiffable] = [wxScanner.currentWeather]
        items += loader.entries as [IGListDiffable]
        items += pathfinder.messages as [IGListDiffable]
        // 2
        return items.sorted(by: { (left: Any, right: Any) -> Bool in
            if let left = left as? DateSortable, let right = right as? DateSortable {
                return left.date > right.date
            }
            return false
        })
    }
    
    // 2
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        if object is Message {
            return MessageSectionController()
        } else if object is Weather {
            return WeatherSectionController()
        } else {
            return JournalSectionController()
        }
    }
    
    // 3
    func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }
}
