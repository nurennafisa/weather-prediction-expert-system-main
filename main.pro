Domains
  cName = string
  longi, lat = real	
  

Database
  city (cName, lat, longi)
   
 

Predicates
  add_city
  list_cities
  consult_file
  menu
  process_choice ( char )
  read_file
  repeat
  save_file
  get_weather
  get_city (cName, lat, longi)
  isLatitudeValid( real )
  isLongitudeValid( real )
  weather(real, real, integer)

Clauses

  	menu:- 
  		repeat ,
    		makewindow(2,2,3,"*Weather Forecasting SYSTEM by Maisha & Nafisa*",5,5,12,50), nl ,
    		write("\nPress A to add City") ,
    		write("\nPress L to display List of Cities") ,
    		write("\nPress D to display weather predictions") ,
    		write("\nPress E to Exit\n\n") ,
    		write("Enter a Choice : ") ,
    		readchar(Choice) ,
    		upper_lower(Ch, Choice) ,
    		removewindow , 
    		process_choice(Ch) ,
    		Ch = 'E'.
		
  		process_choice('A') :- !, add_city.
  		process_choice('L') :- !, list_cities.
  		process_choice('D') :- !, get_weather.
  		process_choice('E').
	

  	add_city :-
    		makewindow(3,3,4,"New City",0,0,25,80) ,
    		repeat ,
          	clearwindow ,
		
      		field_str(0,2,14,"Name: ") ,
      		field_str(1,2,14,"Latitude: ") ,
      		field_str(2,2,14,"Longitude: ") ,
      		cursor(0, 17), readln(Name) ,
      		cursor(1, 17), readreal(Latitude) ,
		isLatitudeValid(Latitude),
	      	cursor(2, 17), readreal(Longitude) ,
		isLongitudeValid(Longitude),
          	cursor(11,4) ,
      		assertz( city( Name, Latitude, Longitude)),

    		write("\nDo you wish to add another City? (y/n): ") ,
    		readchar(Ans), write(Ans) ,
  		upper_lower(Ans, 'n'), ! ,
		save_file,
  		removewindow.


	list_cities :- 
        	write("City Name      Latitude  Longitude\n" ,
              	"=========      ========  =========\n") ,
        	city(Name,Latitude,Longitude) ,
		
  		writef("\n%-18 %-10 %-10", 
            	Name, Latitude, Longitude) ,
        	fail.
  	list_cities :-   
    		write("\n\n\nPress a key...") ,
    		readchar(_) ,
    		clearwindow.

	get_weather :-
		write("\t Enter City Name to get weather  ") ,
		field_str(1, 2, 12, "Name :") ,
		Cursor(1, 9) ,
  		readln(FNM) ,
		field_str(2, 2, 40, "Enter month(example: 1 for January): ");
		Cursor(2, 39) ,
  		readint(Humidity),
		
  		
		get_city(Name, _, _) ,
		city(Name, Latitude, Longitude),
	
		
		
		
		weather(Latitude, Longitude, Humidity),
		fail.
  	get_weather   :-  	
  		write("\n\n\nPress any key...") ,
  		readchar(_) , 
  		clearwindow.


	get_city (Name, Latitude, Longitude) :-
  		city (Name, Latitude, Longitude),
  		! ; write("City Name not found!\n" ,
            	"Press a key to continue...") ,
  		readchar(_), clearwindow, fail.
    



  	repeat :- true;repeat.

	save_file :-
		write("\nSaving Database...\n") ,
		save("city.dba") , 
    		write("\n\nSuccess! Press any Key : ") ,
		readchar(_), 
		clearwindow.


  	consult_file :-
		city (_,_,_), !.
  		consult_file :-
    		existfile("city.dba"), !,
    		read_file.
	consult_file.
    
  	read_file :-             
    		consult("City.dba"), ! ,
    		clearwindow ; beep ,
        	write("ERROR in database!\n" ,
              	"Press any key to continue...") ,
        	readchar(_), clearwindow.

	isLatitudeValid(Latitude):-
		-90>Latitude,Latitude>90,
		write("Invalid Latitude (Latitude ranges between -90 and 90)"),
		write("\n\n\nPress any key to continue...") ,
  		readchar(_), 
		removewindow, 		
		add_city.
	isLatitudeValid(Latitude):-
		-90<=Latitude,Latitude<=90.
	

	isLongitudeValid(Longitude):-
		-180>Longitude,Longitude>180,
		write("Invalid Latitude (Latitude ranges between -180 and 180)"),		 
		write("\n\n\nPress any key to continue...") ,
		readchar(_),
		removewindow,
		add_city.
	isLongitudeValid(Longitude):-
		-180<=Longitude,Longitude<=180.

	weather(Lat, Longi, M):- 
		15<=Lat,Lat<=75,
		0<=Longi,Longi<=180,
		1<=M,M<=2,
		write("\nRegion: Asia"),
		
		write("\nColdest Month of the year!!!!!") ,
		write("\nWear Warm clothes"),
		write("\nFreezing and Cold","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		15<=Lat,Lat<=75,
		0<=Longi,Longi<=180,
		M=3,
		write("\nRegion: Asia"),
		
		write("\nModerate temperature, Ending of dry winter") ,
		write("\nWear Comfortable clothes"),
		write("\nSpring","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		15<=Lat,Lat<=75,
		0<=Longi,Longi<=180,
		4<=M,M<=5,
		write("\nRegion: Asia"),
		
		write("\nStarting Of Hot SUMMER Days") ,
		write("\nWear light clothes"),
		write("\nHot, Summer is here","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		15<=Lat,Lat<=75,
		0<=Longi,Longi<=180,
		6<=M,M<=8,
		write("\nRegion: Asia"),
		
		write("\nRainy Monsoon Season ") ,
		write("\nDont go outside without umbrella or raincoat"),
		write("\nRainy, Monsoon time","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		15<=Lat,Lat<=75,
		0<=Longi,Longi<=180,
		9<=M,M<=10,
		write("\nRegion: Asia"),
		
		write("\nChange of Season") ,
		write("\nBegining of Dry WINTER") ,
		write("\nWear Comfortable clothing"),
		write("\nAutumn","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		15<=Lat,Lat<=75,
		0<=Longi,Longi<=180,
		11<=M,M<=12,
		write("\nRegion: Asia"),
		
		write("\nDry Freezing WINTER!!! ") ,
		write("\nWear Warm Clothes"),
		write("\nFreezing, Winter is Coming!!","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
		
		
		/*Europe*/
		weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=40,
		-15<=Longi,Longi<=50,
		1<=M,M<=2,
		write("\nRegion: Europe"),
		
		write("\nColdest Month of the year!!!!!") ,
		write("\nWear Warm clothes"),
		write("\nFreezing and Cold","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=40,
		-15<=Longi,Longi<=50,
		M=3,
		write("\nRegion: Europe"),
		
		write("\nModerate temperature, Ending of dry winter") ,
		write("\nWear Comfortable clothes"),
		write("\nSpring","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=40,
		-15<=Longi,Longi<=50,
		4<=M,M<=5,
		write("\nRegion: Europe"),
		
		write("\nStarting Of Hot SUMMER Days") ,
		write("\nWear light clothes"),
		write("\nHot, Summer is here","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=40,
		-15<=Longi,Longi<=50,
		6<=M,M<=8,
		write("\nRegion: Europe"),
		
		write("\nRainy Monsoon Season ") ,
		write("\nDont go outside without umbrella or raincoat"),
		write("\nRainy, Monsoon time","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=40,
		-15<=Longi,Longi<=50,
		9<=M,M<=10,
		write("\nRegion: Europe"),
		
		write("\nChange of Season") ,
		write("\nBegining of Dry WINTER") ,
		write("\nWear Comfortable clothing"),
		write("\nAutumn","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=40,
		-15<=Longi,Longi<=50,
		11<=M,M<=12,
		write("\nRegion: Europe"),
		
		write("\nDry Freezing WINTER!!! ") ,
		write("\nWear Warm Clothes"),
		write("\nFreezing, Winter is Coming!!","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
		/*Europe*/
		
		
		/*Australia*/
		weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=-10,
		120<=Longi,Longi<=180,
		1<=M,M<=2,
		write("\nRegion: Australia"),
		
		write("\nColdest Month of the year!!!!!") ,
		write("\nTips:TAKE A TOUR","\n\nWarm clothes"),
		write("\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=-10,
		120<=Longi,Longi<=180,
		M=3,
		write("\nRegion: Australia"),
		
		write("\nModerate temperature, Ending of dry winter") ,
		write("\nWear Comfortable clothes"),
		write("\nSpring","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=-10,
		120<=Longi,Longi<=180,
		4<=M,M<=5,
		write("\nRegion: Australia"),
		
		write("\nStarting Of Hot SUMMER Days") ,
		write("\nWear light clothes"),
		write("\nHot, Summer is here","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=-10,
		120<=Longi,Longi<=180,
		6<=M,M<=8,
		write("\nRegion: Australia"),
		
		write("\nRainy Monsoon Season ") ,
		write("\nDont go outside without umbrella or raincoat"),
		write("\nRainy, Monsoon time","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=-10,
		120<=Longi,Longi<=180,
		9<=M,M<=10,
		write("\nRegion: Australia"),
		
		write("\nChange of Season") ,
		write("\nBegining of Dry WINTER") ,
		write("\nWear Comfortable clothing"),
		write("\nAutumn","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-40<=Lat,Lat<=-10,
		120<=Longi,Longi<=180,
		11<=M,M<=12,
		write("\nRegion: Australia"),
		
		write("\nDry Freezing WINTER!!! ") ,
		write("\nWear Warm Clothes"),
		write("\nFreezing, Winter is Coming!!","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
		/*Australia*/
		
		/*America*/
		weather(Lat, Longi, M):- 
		-55<=Lat,Lat<=90,
		-180<=Longi,Longi<=15,
		1<=M,M<=2,
		write("\nRegion: America"),
		
		write("\nColdest Month of the year!!!!!") ,
		write("\nWear Warm clothes"),
		write("\nFreezing and Cold","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-55<=Lat,Lat<=90,
		-180<=Longi,Longi<=15,
		M=3,
		write("\nRegion: America"),
		
		write("\nModerate temperature, Ending of dry winter") ,
		write("\nWear Comfortable clothes"),
		write("\nSpring","\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-55<=Lat,Lat<=90,
		-180<=Longi,Longi<=15,
		4<=M,M<=5,
		write("\nRegion: America"),
		
		write("\nHot SUMMER Days!!!!") ,
		write("\nWear light clothes"),
		write("\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-55<=Lat,Lat<=90,
		-180<=Longi,Longi<=15,
		6<=M,M<=8,
		write("\nRegion: America"),
		
		write("\nRainy Weather ") ,
		write("\nTips: Carry umbrella "),
		write("\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-55<=Lat,Lat<=90,
		-180<=Longi,Longi<=15,
		9<=M,M<=10,
		write("\nRegion: America"),
		
		write("\nChange of Season") ,
		write("\nBegining of Freezy WINTER") ,
		write("\nBe prepared for WARM clothing"),
		write("\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
	weather(Lat, Longi, M):- 
		-55<=Lat,Lat<=90,
		-180<=Longi,Longi<=15,
		11<=M,M<=12,
		write("\nRegion: America"),
		
		write("\nDry Freezing WINTER!!! ") ,
		write("\nWear Warm Clothes"),
		write("\n\n\nPress a key to continue...") ,
  		readchar(_), clearwindow, fail.
		/*America*/
		
	
GOAL
  makewindow(1,2,3," Weather Predictions ",0,0,25,80) ,
  consult_file,
   menu.  

