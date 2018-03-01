require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper


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

  def get_page
      html = open("https://flatironschool.com/")
      doc = Nokogiri::HTML(html)
      doc
    end

  def get_courses
      self.get_page.css(".post") #or #".post".text
  end

  def make_courses
      self.get_courses.each do |course|
          binding.pry

          course = Course.new
          #binding.pry
      end
  end


end
