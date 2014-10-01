class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins
  has_many :answers
  has_attached_file :image, :styles => { :medium => "400x400", :thumb => "200x200" }, :default_url => "avatar/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
