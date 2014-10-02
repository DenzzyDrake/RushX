class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins
  has_many :answers
  has_many :covers
  has_many :resumes
  has_attached_file :image, :styles => { :medium => "200x200", :thumb => "200x200" }, :default_url => "avatar/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
 def self.search(query)
  where("email like ?", "%#{query}%") 
  where("speciality like ?", "%#{query}%")
 end
end
