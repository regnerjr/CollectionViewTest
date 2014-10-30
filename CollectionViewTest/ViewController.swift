//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by John Regner on 10/29/14.
//  Copyright (c) 2014 In Your Dreams Software. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    var imageNames: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageNames = ["angry_birds_cake.jpg", "creme_brelee.jpg", "egg_benedict.jpg", "full_breakfast.jpg", "green_tea.jpg", "ham_and_cheese_panini.jpg", "ham_and_egg_sandwich.jpg", "hamburger.jpg", "instant_noodle_with_egg.jpg", "japanese_noodle_with_pork.jpg", "mushroom_risotto.jpg", "noodle_with_bbq_pork.jpg", "starbucks_coffee.jpg", "thai_shrimp_cake.jpg", "vegetable_curry.jpg", "white_chocolate_donut.jpg"]
        //let imageTest = UIImage(named: "angry_birds_cake.jpg")


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let identifier = "Cell"

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as UICollectionViewCell
        let recipeImageView = cell.viewWithTag(100) as UIImageView
        recipeImageView.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        collectionView.collectionViewLayout.invalidateLayout()
        let cell = collectionView.cellForItemAtIndexPath(indexPath)!
        let animateChangeWidth: ()-> Void  = {[weak cell] in
            if let validCell = cell {
                var frame = validCell.frame
                frame.size = validCell.viewWithTag(100)!.intrinsicContentSize()
                validCell.frame = frame
            }

        }
        UIView.transitionWithView(cell, duration: 0.7, options: UIViewAnimationOptions.CurveLinear, animations: animateChangeWidth, completion: nil)
    }
}

