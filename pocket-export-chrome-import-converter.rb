#!/usr/bin/env ruby
# encoding: UTF-8

require 'fileutils'
require 'nokogiri'

# Try to read exported file from Pocket
begin
  pocket_export = File.read('ril_export.html')
rescue Exception => e
  puts e
  exit 1
end

# Header of the Chrome bookmarks file
pocket_to_chrome_bookmarks = <<-EOS
<!DOCTYPE NETSCAPE-Bookmark-file-1>
<!-- This is an automatically generated file.
     It will be read and overwritten.
     DO NOT EDIT! -->
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<TITLE>Bookmarks</TITLE>
<H1>Bookmarks</H1>
<DL><p>
EOS

# Read every link inside the exported file and convert it to something that Chrome can handle
Nokogiri::HTML(pocket_export).css('a').each do |link|
  pocket_to_chrome_bookmarks += %Q(  <DT><A HREF="#{link['href'].to_s}" ADD_DATE="#{link['time_added'].to_s}" ICON="">#{link.content}</A>\n)
end

# Footer of the Chrome bookmarks file
pocket_to_chrome_bookmarks += "</DL><p>"

# Try to write the
begin
  File.write('pocket_to_chrome_bookmarks.html', pocket_to_chrome_bookmarks)
rescue Exception => e
  puts e
  exit 1
end
