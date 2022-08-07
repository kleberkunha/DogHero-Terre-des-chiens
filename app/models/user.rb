class User < ApplicationRecord

  before_save { email.downcase! }


  validates :email, :presence => true, :uniqueness => true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  #i need to create the validation for password when SignUp


  
  has_many :events
  has_many :dogs



  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def user_name
    return self.email.split('@')[0].capitalize
  end


end
