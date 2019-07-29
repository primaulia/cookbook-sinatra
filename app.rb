require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative 'cookbook'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  # by having @ sign, we are making this
  # variable accessible in view
  @all_recipes = Cookbook.new('recipes.csv').all
  erb :index
end
