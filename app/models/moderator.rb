class Moderator < ActiveRecord::Base
    has_many :post
    validates :fullname, presence: true
    validates :username, presence: true, format: {with: /@/, message: 'provide a valid email address'}
    validates :password_digest, presence: true
end