Wiki Blossom
============

A cute little rack-based wiki

Features
--------
* **Simple**: Pages are stored in flat-files on the local file system. 
* **Loves TextMate**: Each page has a link at the bottom that says
  "Edit in TextMate". When you click it, it opens the file in TextMate, so you
  can modify it and reload the page after you're done.

Installation
------------

1. open config.yml and modify the `wiki_dir` line to point somewhere that
   contains some textile (.textile) or markdown (.md) files.
2. `$ bundle install`
3. `$ thin start -R wiki.ru`

License
-------

Wiki Blossom is released under the MIT License.

