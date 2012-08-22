# Magic Johnson Url Shortener

A simple bitly clone with users and shortlinks.
Heavily inspired by Hartl.

The most interesting part of this project for me is the urls controller, and how we learned to handle Base64 encoding and vanity urls.

The trick is to set the url shortlink to the database id of that URL. Change that with a Base64 encoding, and then add a vanity url column that points to the encoding.

## Spec
1. Be able to create, edit, and delete users.
2. Be able to create shortlink URLs and delete them (when logged in).

TODO:
Add statistics to the shortlinks.
