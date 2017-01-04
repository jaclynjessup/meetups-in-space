require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all

  erb :'meetups/index'
end

get '/meetups/:id' do
  id = params[:id]
  @meetup = Meetup.find(id)
  @description = @meetup.description
  @location = @meetup.location
  @participants = @meetup.participants


  erb :'meetups/show'
end

post '/meetups/:id' do
  @participant = Participant.create(user: params['user'], meetup: params['meetup'])
  @participants = Participant.all

  erb :'meetups/show'
end
