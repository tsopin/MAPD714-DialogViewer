//
//  ViewController.swift
//  MAPD714-DialogViewer
//
//  Created by Timofei Sopin on 2017-12-13.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var sections = [
        ["header": "First Witch",
         "content": "Hey, when will the three of us meet up later?"],
        ["header": "Second Witch",
         "content": "When everything's straightened out"],
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let words = wordsInSection(section: indexPath.section)
        let size = ContentCell.sizeForContentString(s: words[indexPath.row], forMaxWidth: collectionView.bounds.size.width)
        return size
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let words = wordsInSection(section: indexPath.section)
//
//        let size = ContentCell.sizeForContentString(string: words[indexPath.row], forMaxWidth: collectionView.bounds.size.width)
//
//        return size
//    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if (kind == UICollectionElementKindSectionHeader) {
                let cell = collectionView.dequeueReusableSupplementaryView( ofKind: kind, withReuseIdentifier: "HEADER", for: indexPath as IndexPath) as! HeaderCell
                cell.maxWidth = collectionView.bounds.size.width
                cell.text = sections[indexPath.section]["header"]
                return cell
            }
        
            abort()
    }
    
    override func viewDidLoad() {
        
        var contentInset = collectionView!.contentInset
        contentInset.top = 20
        collectionView!.contentInset = contentInset
        
        let layout = collectionView!.collectionViewLayout
        let flow = layout as! UICollectionViewFlowLayout
        
        self.collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "CONTENT")
        super.viewDidLoad()
        
        self.collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HEADER")
        
        flow.headerReferenceSize = CGSize(width: 100, height: 25)
        flow.sectionInset = UIEdgeInsetsMake(10, 20, 30, 20)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

