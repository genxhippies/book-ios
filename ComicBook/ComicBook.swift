//
//  ComicBook.swift
//  ComicBook
//
//  Created by inome on 2015. 9. 16..
//  Copyright © 2015년 Nundefined. All rights reserved.
//

import UIKit

class ComicBook {
    var isbn: String = ""
    var bookTitle: String = ""
    var illustrator: String = ""
    var desc: String = ""
    var coverImage: UIImage?
    var pubDate: NSDate?
    var checked: Bool = false
    
    init (isbn: String, bookTitle: String, illustrator: String, desc: String = "", coverImage: UIImage?, pubDate: NSDate?, checked: Bool = false) {
        self.isbn = isbn
        self.bookTitle = bookTitle
        self.illustrator = illustrator
        self.desc = desc
        self.coverImage = coverImage
        self.pubDate = pubDate
        self.checked = checked
    }
}
