class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def discussion
    @title = "Discussion Page Sucka!"
  end
  
  def help
    @title = "Help Page"
  end
  
end
