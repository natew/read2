class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :providers_attributes

  has_many :authentications, dependent: :destroy

  authenticates_with_sorcery!

  validates :password,
    allow_blank: true,
    confirmation: true,
    length: { within: 6..256 }


end
