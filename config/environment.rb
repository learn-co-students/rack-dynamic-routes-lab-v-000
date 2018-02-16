require 'bundler/setup'
require 'pry'
#=============== 
# quick exit
def x;exit!;end
#===============  
Bundler.require
require_relative "../app/item.rb"
require_relative '../app/application'
