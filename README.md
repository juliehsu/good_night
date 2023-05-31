# README

Interview project

We want to know how do you structure the code and design the API
==========================================
We would like you to implement a “good night” application to let users track when do they go to bed and when do they wake up.
We require some restful APIS to achieve the following:
1. Clock In operation, and return all clocked-in times, ordered by created time.
2. Users can follow and unfollow other users.
3. See the sleep records of a user’s All following users’ sleep records. from the previous week, which are sorted based on the duration of All friends sleep length.
This is a 3rd requirement response example
{
  record 1 from user A,
  record 2 from user B,
  record 3 from user A,
  ...
}
Please implement the model, db migrations, and JSON API.
You can assume that there are only two fields on the users “id” and “name”.
You do not need to implement any user registration API.
You can use any gems you like.
