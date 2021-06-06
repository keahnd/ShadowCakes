class PagesController < ApplicationController
  def home
  	@page = 'home'
  end

  def info
  	@page = 'info'
  end
end
