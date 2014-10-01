## README

### Description

Build your neighborhood community by knowing where to hang out with your neighbors. This app pulls neighborhood lines from http://data.denvergov.org/dataset/city-and-county-of-denver-statistical-neighborhoods and maps the best resturants, bars, parks, etc from 5280 with yelp ratings.Signing in with twitter also allows for tweets inviting your friends and seeing who is there.

### Technical Expectations
* You must use an external OAuth provider to authenticate users
* You must expose a JSON API that allows a user to both read and write data
* You must filter data appropriately in both the web and API based on authorization rules
* You must create a Ruby gem which allows a user to easily interact with your API
* You must make use of a Virtual Private Server to host your application
* You must automate the deployment of your application to a single command
* Your application must accept uploads of some user images
* Your application must manipulate those images to suit the layout/style of the app itself
* Make use of background workers for all appropriate tasks
* Send notifications to users over email
* Receive some form of content from users via email

### Iteration Plan
#### 10.2 **Theres Information Here**
**needs:**
* app has map of denver
* app has narrower maps of neighborhoods
* app has locations to go to

**likes:**
* app has categorized locations
* locations are mapped onto those maps dynamically

**emergency:**
* one map of denver with lines
* locations somewhere on site with reference to their neighborhoods

#### 10.6 **Users Are On This Site Too**
**needs:**
* users can do things (have profile, etc)
* app has categorized locations

**likes:**
* locations have profiles
* neighborhoods have profiles

**emergency**
* map of denver with locations on it (static)
* users exist

#### 10.9 **Users Do Stuff On Site**
**needs:**
* neighborhoods, locations, etc can be searched for
* everything has profiles
* locations get mapped onto maps dynamically

**likes:**
* locations are filtered
* reviews, ratings for places are a thing

**emergency:**
* map of neighborhoods with locations on them (static)
* everything links to something like a profile (website, twitter, etc)

#### 10.13 **Users Might Think This Is Actually Useful**
**needs:**
* users can interact with site(twitter, population count)
* locations are filtered
* reviews, ratings for places are a thing

**likes:**
* Mobile Friendly
* SMS
* locations are in a hierarchy

**emergency:**
* user can save a place/neighborhood they like
* yucky way to look at different types of locations

#### 10.16 **Complete**
**needs:**
* users can search for neighborhoods, and get that neighborhoods page
* users can filter locations for the type they are looking for
* users can see those locations based on how popular they are

**likes:**
* mobile friendly/sms notification
* users have preferences on neighborhood, type of location, and specific locations

**emergency:**
* user can search for neighborhood and get all locations for that neighborhood
* user can narrow the search
