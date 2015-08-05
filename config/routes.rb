Rails.application.routes.draw do


  get '/scrape/:uid', to: 'application#scrape'


end
