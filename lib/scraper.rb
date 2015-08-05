# msu-icon
# Author: Noah Hines
# File: scraper.rb

require 'nokogiri'
require 'open-uri'
require 'json'

# lib/person.rb
require 'person'

# define class Scraper
class Scraper

	attr_accessor :uid
	def initialize(uid = '704343')
		@uid = uid
		if !@uid.present?
			@uid = '704343'
		end

	end
	def scrape
	  	url = "https://search.msu.edu/people/index.php?uid=".concat(@uid)

	  	data = Nokogiri::HTML(open(url))

	  	@msu_id = data.at_css(".mail")
	    if @msu_id.present?
	      @msu_id = @msu_id.text.strip
	      @email = @msu_id.gsub(/\s+/m, ' ').strip.split("@")[0]
	    end

	  	@name = data.at_css(".card-body #maincontent")
	    if @name.present?
	      @first_name = @name.text.strip.gsub(/\s+/m, ' ').strip.split(" ")[1]
	      # @short_name = @full_name.split(" ")[0]
	      @last_name = @name.text.strip.gsub(/\s+/m, ' ').strip.split(" ")[0].split(",")[0]
	    end

	  	@title = data.at_css(".title")
	    if @title.present?
	      @title = @title.text.strip.gsub(/\s+/m, ' ').strip.split(" ")[1]
	    end

	    @class_desc = data.at_css(".classdesc")
	    if @class_desc.present?
	  	 @class_desc = @class_desc.text.strip.gsub(/\s+/m, ' ').strip.split(" ")[1]
	    end

	    @major_desc = data.at_css(".majordesc")
	    if @major_desc.present?
	     @major_desc = @major_desc.text.strip.gsub(/\s+/m, ' ').strip.split(" ")[1]
	    end

	    # check for staff
	    if !@class_desc.present? && !@major_desc.present?
	    	@class_desc = "Faculty"
	    	@major_desc = "Faculty"
	    end

	    # Person requires...
	    # short_name='', full_name='', id='', email='', title='', student_class='', major='')

	    @person = Person.new(@uid, @first_name, @last_name, @email, @msu_id, @title, @class_desc, @major_desc)

	    return @person.to_json

	end

end

