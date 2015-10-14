//
//  BookCollctionViewController.swift
//  ComicBook
//
//  Created by inome on 2015. 10. 13..
//  Copyright © 2015년 Nundefined. All rights reserved.
//

import UIKit

class BookCollctionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let REUSE_IDENTIFIER_COMIC_BOOK = "ComicBook"
    var comicBooks = [ComicBook]()

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // collection view에 표시될 셀의 개수를 반환한다.
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comicBooks.count
    }
    
    // view의 특정한 indexPath의 값을 얻어가려고 할 때 (DataSource protocol을 구현 중이므로) 호출된다.
    // 따라서 여기서는 각 셀의 데이터를 채울 수 있는 역할을 하면 된다.
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(REUSE_IDENTIFIER_COMIC_BOOK, forIndexPath: indexPath) as! BookCollectionViewCell
        
        let comicBook = comicBooks[indexPath.item]
        cell.coverImage.image = comicBook.coverImage
        cell.bookTitle.text = comicBook.bookTitle
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
