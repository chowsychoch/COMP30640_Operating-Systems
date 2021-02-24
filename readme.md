# A short introduction
This report is about the implementation of a basic social media system. With the design of client-server architecture, users can posts their message to friends on walls, which simulate website of social media. 

# What is the system supposed to do?
To go in depth the idea of system and what does it achieved. First and foremost, it is important to discuss types and commands of the server, since this system is to allow users to post message to friends on walls. Users here is represented by a folder, $user, within each $user, it has two files $wall and $friends, which store information. The two files are generated automatically when $user folder is created by client.
Wall: When $user post message onto their friend’s wall. It should follow the structure as
friend_id : message
Friends: It stores the information of $user friends. And this is also used for checking that only friends within this file can post on their wall. This file contains the id of user friends, one id per line. Here the design for friend is not symmetric, A can be a friend of B (A can write to B’s wall) while B is not a friend of A (B can not write to A’s wall).

# Basic commands of servers:
The four main functions that a social media system can perform are create new user, add new friend, post a message and display a wall. Each one of these is written in a separate shell script. Inside each of the shell script, exit code is used to differentiate to the result of different condition. exit 1 shows that error cases happened in the code, exit 0 shows that everything executed successfully without errors.
The main functions that the system have to include:
Create new user: Create a new folder and files to store a user’s information. Add new friend: Add a user to another user’s friend list.
Post a message: Add a message from one user to another user’s wall
Show wall: Display the contents of a wall