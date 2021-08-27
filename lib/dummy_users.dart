import './models/user.dart';

const DUMMY_USERS = const [
 User(
   id: 'u1',
   username: 'Luysky',
   email: 'luysky@gmail.com',
   isServiceProvider: true,
   isSubscribed: true,
   password: '123',
 ),
 User(
   id: 'u2',
   username: 'Marshasha',
   email: 'marsha@gmail.com',
   isServiceProvider: false,
   isSubscribed: true,
   password: '456',
 ),
 User(
   id: 'u3',
   username: 'DoggoBestie',
   email: 'bestie@gmail.com',
   isServiceProvider: false,
   isSubscribed: true,
   password: '789',
 ),
 User(
   id: 'u4',
   username: 'Silverhand',
   email: 'samurai@gmail.com',
   isServiceProvider: false,
   isSubscribed: false,
   password: '000',
 ),
]; 

const ORGA = User(id: 'u0', username: 'Odin', email: 'odin@gmail.com', isServiceProvider: true, isSubscribed: true, password: 'pass');


User findOrga(List<User>userlist, String id){

for (var i = 0; i < userlist.length; i++){
  
  if(userlist[i].id == id){

    User foundUser = new User(
      id: userlist[i].id, 
      username: userlist[i].username, 
      email: userlist[i].email, 
      isServiceProvider: userlist[i].isServiceProvider, 
      isSubscribed: userlist[i].isSubscribed, 
      password: userlist[i].password);
    return foundUser;
  }
};
return ORGA;
}