CGI::Application Demo
===============

This CGI::Application demo has the following specifications:

* FavouriteColour.pm has 2 runmodes: form and results
* The form runmode displays a select box and submit button
* The select box values are an array read in from data.cfg in the setup sub of FavouriteColour.pm
* The result runmode displays a hyperlink back to the form
* The hyperlink contains the value of the submitted form as a query param
* The query param value is selected be default upon return to the form
* Redirect to Google if the query param is not one of the select box values
* A Javascript alert window displays the select box value when changed
