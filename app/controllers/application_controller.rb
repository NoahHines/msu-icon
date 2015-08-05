class ApplicationController < ActionController::Base

require 'nokogiri'
require 'open-uri'
require 'json'

# lib/scraper.rb
require "scraper"

  def scrape
    scraper = Scraper.new(params[:uid].to_s)
    render :json => scraper.scrape
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end