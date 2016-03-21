#Request and Response
___

This program will take input from the user in the form of an HTTP request.

User input:
    ```Supply a valid HTTP Request URL (h for help, q to quit) > 'GET http://localhost:3000/users/5 HTTP/1.1'``` .rb

After the user input the program will parse the URL. The parsing will break the URL into it's elements (e.g. domain, sub-domain, tld.)

####Parser
```
  pieces = raw_request.split(' ')
  method = pieces[0]
  uri    = pieces[1]
  http_v = pieces[2]
  route, query_param_string = uri.split('?')
  uri_fragments = route.split('/')
  protocol = uri_fragments[0][0..-2]`
  full_url = uri_fragments[2]
  subdomain, domain_name, tld = full_url.split('.')
  params = parse_params(uri_fragments, query_param_string)
``` .rb
  
####Output
```
 {:method=>"GET", :uri=>"http://localhost:3000/users", :http_version=>"HTTP/1.1", :protocol=>"http", :subdomain=>"localhost:3000", :domain_name=>nil, 
   :tld=>nil, :full_url=>"localhost 3000", :params=>{:resource=>"users", :id=>nil, :action=>nil}}
``` .rb
   
The program will then take the information from the paramaters hash outputted from the parser to decide what information to give the user. If not ID modifier is added to the request the user will be returned the full database. A modifier will return a specefic piece of the database to the users.

####If the user selects one piece of the database

###### Paramaters returned from parse
`{:resource=>"users", :id=>"1", :action=>nil}` .rb

###### Result from database
```
HTTP/1.1 200 OK
first_name: Dane
last_name: Carmichael
age: 99
``` .rb
