# Interview project

### We want to know how do you structure the code and design the API

==========================================
We would like you to implement a “good night” application to let users track when do they go to bed and when do they wake up.
We require some restful APIS to achieve the following:

1. Clock In operation, and return all clocked-in times, ordered by created time.
2. Users can follow and unfollow other users.
3. See the sleep records of a user’s All following users’ sleep records. from the previous week, which are sorted based on the duration of All friends sleep length.

This is a 3rd requirement response example

```
{
  record 1 from user A,
  record 2 from user B,
  record 3 from user A,
  ...
}
```
Please implement the model, db migrations, and JSON API.
You can assume that there are only two fields on the users “id” and “name”.
You do not need to implement any user registration API.
You can use any gems you like.

### Version
- ruby-2.7.3
- rails-5.2.8.1

## Setup with docker

1. Install docker
2. `$ cd path/good_night`
3. `$ docker build -t good_night .`
4. `$ docker run -p 3000:3000 good_night`

**Rails Console**

1. `$ docker exec -it [container_name] bash`
2. `$ rails c`

## Setup with local env

1. Make sure your have ruby-2.7.3, or you can try edit the `.ruby-version` file and Gemfile to fit your local environmant.
2. `$ cd path/good_night`
3. `$ bundle install`
4. `$ rails db:migrate`
5. `$ rails s`
