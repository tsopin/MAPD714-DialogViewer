//
//  ViewController.swift
//  MAPD714-DialogViewer
//
//  Created by Timofei Sopin on 2017-12-13.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    private var sections = [
        ["header": "First Witch",
         "content": "Hey, when will the three of os meet up later?"],
        ["header": "Second Witch",
         "content": "When everything's strainghtend out"],
        ["header": "Third Witch",
         "content": "That will be just before sunset"],
        ["header": "First Witch",
         "content": "Where?"],
        ["header": "Second Witch",
         "content": "In Dirt Patch."],
        ["header": "Third Witch",
         "content": "I guess we will see Mac there."
        ]]
    
    
    func wordsInSection(section: Int) -> [String] {
        let content = sections[section]["content"]
        let spaces = NSCharacterSet.whitespacesAndNewlines
        let words = content?.components(separatedBy: spaces)
        return words!
        
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        let words = wordsInSection(section: section)
        return words.count
        }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let words = wordsInSection(section: indexPath.section)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CONTENT", for: indexPath) as! ContentCell
        cell.maxWidth = collectionView.bounds.size.width
        cell.text = words[indexPath.row]
        return cell
    }
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        self.collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "CONTENT")
        super.viewDidLoad()
        
        var contentInset = collectionView!.contentInset
        contentInset.top = 20
        collectionView!.contentInset = contentInset
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

