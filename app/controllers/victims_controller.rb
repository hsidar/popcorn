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

    HTTParty.get("http://raccoon-metadata-project.herokuapp.com/raccoons.json").each do |raccoon|
      if !Victim.exists?(name: raccoon["name"])
      newbies.push(name: raccoon["name"], avatar: raccoon["avatar_url"])
      else
      veterans.push(raccoon["name"])
      end
    end

    rank = 0
    if Victim.all.length > 0
      until Victim.where(name: veterans).where(rank: rank).length > 0 do
        rank += 1
      end
    end

    veterans = Victim.where(name: veterans).where(rank: rank)

    newbies.each do |noob|
      newb = Victim.new
      newb.name = noob[:name]
      newb.avatar = noob[:avatar]
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
    redirect_to root_path
    elsif params[:commit] == "Nay!"
      redirect_to root_path
    end
  end


  def ranking
  end
end
