class VictimsController < ApplicationController

  require 'httparty'

  def index
  end

  def choose

    # 'choose' controller gets data from API call to data source
    #
    # chain .each loop on API call to see if name (email in real world) exists in database
    #
    # if not, name and avatar added to newbie array
    #
    # if so, adds to veterans array
    #
    # checks the database against veterans for victims starting from rank 0 until length of returned > 0
    #
    # .concat veterans of lowest rank to @chosen array
    #
    # randomly picks one from array as first choice
    #
    # sends chosen array and first choice to view

    newbies = []
    veterans = []

    HTTParty.get("http://raccoon-metadata-project.herokuapp.com/raccoons.json").each do |victim|
      if !Victim.exists?(name: victim["name"])
        newbies.push(name: victim["name"], avatar: victim["avatar_url"], avatar_thumb: victim["avatar_thumb"])
      else
        veterans.push(victim["name"])
      end
    end

    
    if Victim.where(name: veterans).length > 0
      rank = 0
      until Victim.where(name: veterans).where(rank: rank).length > 0 do
        rank += 1
      end
    end

    veterans = Victim.where(name: veterans).where(rank: rank)

    newbies.each do |noob|
      newb = Victim.new
      newb.name = noob[:name]
      newb.avatar = noob[:avatar]
      newb.avatar_thumb = noob[:avatar_thumb]
      newb.rank = 0
      newb.save
    end

    @chosen = veterans.concat(newbies)

    @first_choice = @chosen.sample

  end

  def award
    if params[:commit] == "Aye!"
      awardee = Victim.find_by(name: params[:chosen])
      awardee.rank += 1
      awardee.save
      redirect_to '/leaderboard'
    elsif params[:commit] == "Nay!"
      redirect_to root_path
    end
  end


  def leaderboard
    @low_price_leaders = Victim.order(rank: :desc).limit(10)
  end
end
