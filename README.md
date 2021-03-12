# README

Welcome to KTW3 a very simple version of Twitter Clone

KTW3 is a simple Twitter clone app developed on RoR 6, as a part of the Koombea's Rails Bootcamp.

** Pre-requisites:

Ruby (3.0.0) or latest
Rails (6.0.0) or lasted
Node and npm
Yarn installation

** Installation

You can test the app via heroku:   https://ktw3.herokuapp.com

or

You can install locally the app via zip.file:

  - Unzip the file
  - In a terminal open the app folder
  - run "bundle i" (for install the gems for the app)
  - rails db:migrate
  - Start the server with  rails s
  - In your explorer go to "localhost:3000"

If you want to work with a set of data upload previously is recommended install the fake gem:
gem install fake
and run "db:migrate:reset"  and  "db:seed"

In case of any issue with the data run "db:reset" for a clean load of the app


Inside the app you can view the sign_up page, you can register with your Name, pick an username,
put your email and set your password, in order to acces the app.

Completing the register you will be redirected to the homepage and you will can see the options for navigate 
in the app, you can go to the Tweet tab for post a new tweet, or go to the Feed tab for see the latest tweets and
acces the list of users in the app and you should follow and unfollow them and see the information of each one.

(We continue improving the app and any feedback is welcome and really appreciate it, this is the soon first version but we will have a better app soon, thank you so much.)
