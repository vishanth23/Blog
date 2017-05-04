class Post < ApplicationRecord
#attr_accessible :firstname,:lastname,:feedback
belongs_to :user 
validates :firstname,:lastname,:feedback ,:presence => true
validates :firstname,:lastname ,:length => { :minimum => 3}
validates :firstname,:uniqueness => true
end
