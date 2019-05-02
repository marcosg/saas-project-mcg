class Account < ApplicationRecord
  has_many :users
  validates_uniqueness_of :name
  validates_presence_of :name

end
