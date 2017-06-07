//
//  Chat.swift
//  PH
//
//  Created by Mawe Tecnologias on 09/03/17.
//  Copyright © 2017 Mawe Tecnologias. All rights reserved.
//

import UIKit
import JSQMessages

struct User {
    let id: String
    let name: String
}

class Chat: JSQMessagesViewController {
    
    @IBAction func Back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let user1 = User(id: "1", name: "Emiliano")
    let user2 = User(id: "2", name: "Jonathan")
    
    
    var currentUser: User {
        return user1
    }
    
    // all messages of users1, users2
    var messages = [JSQMessage]()
}

extension Chat {
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        let message = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text)
        
        messages.append(message!)
        
        finishSendingMessage()
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        let message = messages[indexPath.row]
        let messageUsername = message.senderDisplayName
        
        return NSAttributedString(string: messageUsername!)
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return 15
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        
        let message = messages[indexPath.row]
        
        if currentUser.id == message.senderId {
            return bubbleFactory?.outgoingMessagesBubbleImage(with: UIColor(red:0.22, green:0.29, blue:0.21, alpha:1.0))
        } else {
            return bubbleFactory?.incomingMessagesBubbleImage(with: UIColor(red:0.68, green:0.62, blue:0.47, alpha:1.0))
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.row]
    }
}

extension Chat {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tell JSQMessagesViewController
        // who is the current user
        self.senderId = currentUser.id
        self.senderDisplayName = currentUser.name
        
        
        self.messages = getMessages()
    }
}

extension Chat {
    func getMessages() -> [JSQMessage] {
        var messages = [JSQMessage]()
        
        let message1 = JSQMessage(senderId: "1", displayName: "Emiliano", text: "Prueba 1")
        let message2 = JSQMessage(senderId: "2", displayName: "Jonathan", text: "Prueba 2")
        
        messages.append(message1!)
        messages.append(message2!)
        
        return messages
    }
}
