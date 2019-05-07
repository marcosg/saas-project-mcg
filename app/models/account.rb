class Account < ApplicationRecord
  has_many :users
  has_many :projects, dependent: :destroy
  validates_uniqueness_of :name
  validates_presence_of :name


end
