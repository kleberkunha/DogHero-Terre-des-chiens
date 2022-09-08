class User < ApplicationRecord
  devise :registerable, :confirmable


  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  #after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.send_signup_email(user: self).deliver_now
  end


  before_save { email.downcase! }


  validates :email, :presence => true, :uniqueness => true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  #i need to create the validation for password when SignUp


  has_one_attached :avatar
  
  has_many :events, dependent: :delete_all
  has_many :dogs
  has_many :subscribers


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


  def self.search(search)
    where("(first_name || last_name) LIKE :q", :q => "%#{search}%")
  end


  private

  def confirmation
    if self.confirm.blank?
      self.confirm = SecureRandom.urlsafe_base64.to_s
    end
  end



end
