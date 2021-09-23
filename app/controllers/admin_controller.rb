class AdminController < ApplicationController

	def index
		@page = 'admin';
	end

	def users_list
		@users = User.all
	end
end
