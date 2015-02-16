require 'rubygems'
require 'sinatra'
require 'mongo'
require 'json/ext'
require 'rest-client'
require './config/Database'

require_relative 'routes/Estudiantes'
require_relative 'routes/OtherRoute'