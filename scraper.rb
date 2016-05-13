#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

pages = [
  'Category:Members of the Scottish Parliament 1999–2003',
  'Category:Members of the Scottish Parliament 2003–07',
  'Category:Members of the Scottish Parliament 2007–11',
  'Category:Members of the Scottish Parliament 2011–16',
  'Category:Members of the Scottish Parliament 2016–',
]
names = pages.map { |url| WikiData::Category.new(url, 'en').member_titles }.flatten.uniq

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names })
