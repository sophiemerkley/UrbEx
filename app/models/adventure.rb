class Adventure < ActiveRecord::Base
  belongs_to :user

  resourcify
end
