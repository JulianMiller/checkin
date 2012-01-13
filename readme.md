Checkin
=======
Checkin in an app inspired by Foursquare and Facebook's Location posts but with a slight twist. Instead of people being able to check in at a location whenever, an artist that is playing a show at a venue will create an event at a specific time and users can only check in at that time.

There's more to it than just checking in at specific times. The creators of the event can add a message to display to the user and upload a song to give to the user when they check in. The message and file are emailed to the person who checked in as an incentive for doing so.

Installation
------------
First clone the repository

    git clone git@github.com:tomelm/checkin.git

Then enter the directory, install all the gems, and run the migration

    cd qrplayer
    bundle install
    rake db:migrate

And finally start the server

    rails s

Software used
-------------
* Rails mailers/sending emails
* HTML5 Location API
* Google Maps API for geocoding addresses to latitude/longitude coordinates
* Timezone configuration/coordination
* Posting through AJAX

External APIs
-------------
Checkin depends on Google Maps API for geocoding. The API in this application is not valid so make sure you get and use your own API key in app/assets/javascripts/application.js.

You can get an API key for free from https://code.google.com/apis/console
