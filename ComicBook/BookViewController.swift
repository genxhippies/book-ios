//
//  BookViewController.swift
//  ComicBook
//
//  Created by inome on 2015. 9. 15..
//  Copyright © 2015년 Nundefined. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var pubDate: UILabel!
    @IBOutlet weak var illustrator: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    
    var comicBook = ComicBook()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadData()
        
        setBookData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBookData() {
        bookTitle.text = comicBook.bookTitle
        // TODO: pubDate가 이상하게 나오는데 이걸 해결하는 방법이 동영상에 있음
        pubDate.text = comicBook.pubDate!.getFormattedString("yyyy-MM-dd")
        desc.text = comicBook.desc
        coverImage.image = comicBook.coverImage
        illustrator.text = comicBook.illustrator
        setCheckedButton(comicBook.checked)
    }
    
    func setCheckedButton(isChecked: Bool) {
        checkBtn.setTitle(isChecked ? "Checked!" : "Check!", forState: UIControlState.Normal)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: IBActions
    @IBAction func toggleCheck(sender: AnyObject) {
        comicBook.checked = !comicBook.checked
        setCheckedButton(comicBook.checked)
    }
    
    // MARK: Temporary functions
    private func loadData() {
        comicBook.bookTitle = "원피스 78"
        comicBook.illustrator = "오다 에이이치로"
        comicBook.desc = "오다 에이이치로 원피스 짱짱맨"
        comicBook.pubDate = NSDate()
        comicBook.coverImage = UIImage(named: "SampleBook")
        comicBook.checked = false
    }
}

extension NSDate {
    func getFormattedString(format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
}


