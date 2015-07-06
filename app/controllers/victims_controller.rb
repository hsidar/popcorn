class VictimsController < ApplicationController

  require 'httparty'

  def index
  end

  def choose
    @raccoons = []
    HTTParty.get("http://raccoon-metadata-project.herokuapp.com/raccoons.json").each { |y| @raccoons.push( name: y["name"], avatar: y["avatar_url"]) }
    @raccoon = @raccoons.sample
  end

  def ranking
  end
end
