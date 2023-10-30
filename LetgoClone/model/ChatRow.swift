

import SwiftUI
import Firebase

struct ChatRow : View {
    
    var chatMessage : ChatModel
    var userToChatFromChatView : UserModel
    
    var body: some View {
        
        Group {
            
            if chatMessage.messageFrom == Auth.auth().currentUser!.uid && chatMessage.messageTo == userToChatFromChatView.uidFromFirebase {
                
                HStack{
                Text(chatMessage.message)
                    .bold()
                    .foregroundColor(Color.black)
                    .padding(10)
                
                    Spacer()
                }
                
                
                
            } else if chatMessage.messageFrom == userToChatFromChatView.uidFromFirebase && chatMessage.messageTo == Auth.auth().currentUser!.uid {
                
                HStack{
                    
                    
                    
                    Spacer()
                    Text(chatMessage.message)
                        .bold()
                        .foregroundColor(Color.black)
                        .padding(10)
                    
                    
                }
                
            } else {
                //NO
            }
            
            
            
        }.frame(width:UIScreen.main.bounds.width * 0.95)
        
        
    }
}

#if DEBUG
struct ChatRow_Previews : PreviewProvider {
    static var previews: some View {
        ChatRow(chatMessage: ChatModel(id: 0, messageTo: "Message", messageFrom: "wdfs", message: "aa", uidFromFirebase: "bb"), userToChatFromChatView: UserModel(id: 1, uidFromFirebase: "laksds",email: "ad",password: "awd"))
    }
}
#endif
