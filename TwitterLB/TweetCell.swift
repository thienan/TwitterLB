//
//  TweetCell.swift
//  TwitterLB
//
//  Created by Dominik Sadowski on 2/1/17.
//  Copyright © 2017 Dominik Sadowski. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet{
            guard let tweet = datasourceItem as? Tweet else {
                return
            }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = "  \(tweet.user.username)\n"
            attributedText.append(NSMutableAttributedString(string: usernameString, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributedText
        }
    }
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "SOME SAMPLE TEXT"
        return tv
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "dog2")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImage)
        addSubview(messageTextView)
        
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
