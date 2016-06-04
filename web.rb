require 'sinatra'
require 'miami_dade_geo/municipality'

get '/' do
  haml :index
end

get '/what.js' do
  coffee :what
end

get '/wat.css' do
  sass :wat
end

get '/find' do
  muni = MiamiDadeGeo::Municipality.new_with_latlong(
    lat: params[:latitude],
    long: params[:longitude]
  )

  { name: muni.name }.to_json
end
