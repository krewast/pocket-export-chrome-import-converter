# Pocket export, Chrome Import converter

I wanted to export all my saved Pocket links and import them as normal bookmarks in Chrome. That's easier said than done because the exported file from Pocket can't be just imported into Chrome.

Therefore, I had to write this little converter script. It reads the exported file from Pocket and creates another file which can be imported into Chrome.

I don't think that I will use this very often and the script may break in the future. If that's the case I would be happy to be notified.


## Installation

There is one dependency, Nokogiri. To install it you can either use bundler:

    $ bundle

Or install it yourself as:

    $ gem install nokogiri


## Usage

Pretty simple! To download the export file from Pocket visit [this site](https://getpocket.com/export) and click "Export HTML file"

Put the exported file from Pocket (its name has to be 'ril_export.html'!) in the same directory as the converter script. Then call:

	$ ruby pocket-export-chrome-import-converter.rb

The script creates another file called 'pocket_to_chrome_bookmarks.html'. To finally import that, go to:

    Chrome -> Bookmarks -> Bookmarks Manager -> Organize (Drop down menu) -> Import Bookmarks from HTML file...


## License

This project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
