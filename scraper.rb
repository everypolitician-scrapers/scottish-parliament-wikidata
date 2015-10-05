#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

@pages = [
  'Category:Members of the Scottish Parliament 1999–2003',
  'Category:Members of the Scottish Parliament 2003–07',
  'Category:Members of the Scottish Parliament 2007–11',
  'Category:Members of the Scottish Parliament 2011–',
]

@pages.map { |c| WikiData::Category.new(c).wikidata_ids }.flatten.uniq.each do |id|
  data = WikiData::Fetcher.new(id: id).data or next
  ScraperWiki.save_sqlite([:id], data)
end
