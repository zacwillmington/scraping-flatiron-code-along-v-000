require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

     attr_reader :get_page, :get_courses, :make_courses, :print_courses

    def get_page
        html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
        doc = Nokogiri::HTML(html)
        doc
      end

    def get_courses
        get_page.css(".post h2") #or #".post".text
    end

    def make_courses
            #binding.pry
            self.get_courses.collect do |course|
            #binding.pry
             course = Course.new
             course.title= course.css("h2").text
             #binding.pry
        end
        #binding.pry
    end

    def print_courses
    self.make_courses
    binding.pry
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
end
