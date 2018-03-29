Project Flow
HTMLPAGE => AJAX_REQUEST => RequestHandler.php?action=(function to be performed) => LOGIC => ResponseHandler.php => AJAX_RESPONSE => HTML_OUTPUT


1. All ajax request must be done to only one file i.e RequestHandler.php the purpose of request must be mentioned as a queryString with the url for example(RequestHandler.php?action=login)

2. In RequestHandler.php create a seperate case for new action and make the function call to perform the action if there are any POST or GET parameter from user then pass those in the funtcion call.

3. The function definition must be in another file and make sure that the file containing the function is included in the RequestHandler.php

4. The function must not use any kind of print statements like echo, print, print_r, etc and must only contain the business logic and database related code.

5. To respond for the ajax request the function must use response methods as per the response required by the ajax request. These methods are defined in ResponseHandler.php.

6. If any type of response is required then prior declare its method in ResponseHandler.php and then use it in your function.

***Server setup ***
Open server.config.js and change the serverName according to your server.

*** Database Operation ***
Go through exampleDB.php