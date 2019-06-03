
# EstanteVirtual
Hi, you'll find below a bit of information and my instructions on how to get this little API up and running.

* Ruby version
    * ruby version 2.6.3p62
    * rails version 5.1.7

* Configuration
    * run `bundle install`

* Database creation & initialization
   * `rails db:migrate`
   * `rails db:reset`
   * I added a seed file too, with enough Competitions and Results to test the API's functionalities

* How to run the test suite
   * run `rspec`
    
* About the API
	* To create a new Competition
		* `POST {"name":"<insert name here>"} http://localhost:8080/competitions`
	* To create a new Result
		* `POST {"competition_id":"<competition id>", "athlete":"<athlete name>", "value":"<numeric value>", "unit":"<single digit string [s or m]>"} http://localhost:8080/results`
	* Finish a Competition
		* `POST {"competition_id":"<competition id>"} http://localhost:8080/competition/end`
	* Get the ranking 
		*  `POST {"competition_id":"<competition id>"} http://localhost:8080/competition/ranking`
* Room for improvement
There's plenty of room for improvement here, given more time I could have added:
	* API versioning;
	* Added each functionality one commit at a time, instead of a single, huuuge commit;
	* More tests! *(there's never enough testing, really)*;
	* Separated *100m* and *javelin* into a *Sport* class, then use inheritance for each;
	* or instead make them into an *enum sport_type*;
	* Even more validations for the Results attributes;
	* Followed every single rubocop recommendation (*the Rails Way™*);
	* etc...