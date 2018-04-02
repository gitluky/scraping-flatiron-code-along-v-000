require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page(url)
    Nokogiri::HTML(open(url)).tap {|doc| doc}
  end

  def get_courses(doc)
    doc.css(".post")
  end

  def make_courses(courses)

  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end

scrape = Scraper.new
doc = scrape.get_page('http://learn-co-curriculum.github.io/site-for-scraping/courses')
puts scrape.get_courses(doc)
