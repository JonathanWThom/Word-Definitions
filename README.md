https://desolate-refuge-23877.herokuapp.com/

# _Word Definitions_

#### _Web application that allow users to add words, and definitions for those words. 12.2.16_

#### By _**Jonathan Thom**_

## Description

_Users can input words, and see them show up on a list on the homepage. They can click on words to add and view definitions for that word. They can also sort their word list alphabetically, view a page with all words and their definitions, and search for words among their list._

## Setup/Installation Requirements

* _View here: https://desolate-refuge-23877.herokuapp.com/_
* _Or,in the command line run:_
```
$ git clone https://github.com/JonathanWThom/Word-Definitions
$ cd word_definitions
$ bundle
$ ruby app.rb
```

## Specifications
1. User can input a word and its part of speech and will see the word appear on the homepage.
  * Input example: "Dog", "Noun"
  * Output: "Dog"

2. User can click on their word to be taken to its definitions page
  * Input example: Click("Dog")
  * Output: "Dog (Noun)"

3. User can add a definition to a word on its word page. This can be repeated.
  * Input example: On "Dog" Page - "A furry friend"
  * Output: "A furry friend"

4. From the homepage, user can sort all words alphabetically.
  * Input example: "Dog", "Cat", "Goat"
  * Output: "Cat", "Goat", "Dog"

5. User can navigate to a page showing all words and their definitions.
  * Input example: Click("View All Words and Definitions")
  * Output: "Dog - A furry friend", "Cat", "Goat"

6. User can search for words and be taken to their page if they exist.
  * Input example: Search("Dog")
  * Output: "Dog (Noun) - A furry friend"

7. If search fails, user can add searched word to word list.
  * Input example: "Bear"
  * Output: "I'm sorry, Bear is not one of the words on the list."
  * Second input: Click("Add it!")
  * Second Output: "Bear"

## Support and contact details

_Contact Jonathan at: jonathan.thom1990@gmail.com_

## Technologies Used

_Written in Ruby, with the help from HTML, CSS, and Sinatra_

### License

*MIT*

Copyright (c) 2016 **_Jonathan Thom_**
