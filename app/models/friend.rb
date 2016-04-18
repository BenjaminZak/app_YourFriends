class Friend < ActiveRecord::Base
	# les models servent à faire le lien entre les users et les friends
	belongs_to :user
	belongs_to :friend, :class_name => "User"
end
