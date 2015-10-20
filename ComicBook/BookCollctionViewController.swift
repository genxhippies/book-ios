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
    let SEGUE_IDENTIFIER_VIEW_DETAIL = "ViewBookDetail"
    
    var comicBooks = [ComicBook]()
    var urlString = "http://book.iizs.net/books/"

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { [unowned self] in
            if let url = NSURL(string: self.urlString) {
                if let data = try? NSData(contentsOfURL: url, options: []) {
                    let jsonData = JSON(data: data)
                    self.parseJSON(jsonData)
                    
                    dispatch_async(dispatch_get_main_queue()) { [unowned self] in
                        self.collectionView.reloadData()
                    }
                } else {
                    self.showError("Failed to get remote data.")
                }
            } else {
                self.showError("Invalid URL \(self.urlString)")
            }
        }
    }
    
    func showError(message: String) {
        dispatch_async(dispatch_get_main_queue()) { [unowned self] in
            let alertController = UIAlertController(title: "Data Load Error", message: message, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func parseJSON(jsonData: JSON) {
        for result in jsonData["results"].arrayValue {
            let isbn = result["isbn"].stringValue
            let bookTitle = result["title"].stringValue
            let illustrator = result["author"].stringValue
            
            let comicBook = ComicBook(isbn: isbn, bookTitle: bookTitle, illustrator: illustrator, coverImage: nil, pubDate: nil)
            
            comicBooks.append(comicBook)
        }
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        if segue.identifier == SEGUE_IDENTIFIER_VIEW_DETAIL {
            let comicBookDetailViewController = segue.destinationViewController as! BookViewController
            
            if let targetCell = sender as? BookCollectionViewCell {
                let indexPath = collectionView.indexPathForCell(targetCell)!
                let selectedBook = comicBooks[indexPath.row]
                // 보통 아래와 같이 caller에서 callee에 값을 설정하는 방식으로 진행된다.
                comicBookDetailViewController.comicBook = selectedBook
            }
        }
    }
}
