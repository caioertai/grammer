Grammer
========

**Connect objects to Instagram account info.**

Key features:

* Can be included in objects.
* On one request:
  * Gets the public info of a provided username (except for followers).
  * Text, link and caption of latest 12 medias.

Compatibility:

* Work in progress


Incluing Grammer in Objects
-----------------

To include Grammer you model must implement a method that returns an Instagram username:

**1.** Your model must provide a method that returns an Instagram username.

**2.** In your model, tell grammer where to find the Instagram username and on which method to provide the data:

    grammed_by :username, on: :ig

**3.** This allows you to call `#ig` on your object to retrieve its Instagram info.

TODO
------------
* Finish documentation.
* Command line interface
* Media objects
* RDOCs

Copyright (c) 2019 Caio Andrade, released under the MIT license.
