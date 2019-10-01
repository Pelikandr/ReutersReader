# ReutersReader
The first tab presents the following information:  
My name
The current Date and Time (updated dynamically every second).  
Label

The first segment contains a table that will show the information received from this RSS feed http://feeds.reuters.com/reuters/businessNews. 

The second segment contains a table which is a unification of the data received from http://feeds.reuters.com/reuters/entertainment and http://feeds.reuters.com/reuters/environment.  

Parsing the RSS feed. 
 
Selecting a feed will push a new view with the description of the feed.  

The application presents in the empty label of the first tab, the title from the feed that was selected in the second tab. 

The application checks each RSS source (there are 3 RSS sources) every 5 seconds for an update and the UI is updated immediately as soon as one of the RSS sources provided updated information. 

Whenever the application checks for update, it shows an activity indicator that does not block the screen or the user from interacting with the application. 
