class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  # exclude @ character from usernames
  validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, multiline: true
  validate :validate_username

  attr_writer :login

  def login
    @login || username || email
  end

  # validation for disallowing usernames that are emails
  # of other users, however alone you could choose a
  # username looking like the email of an unregistered
  # user.
  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end

  # update the devise method for being able to use a username and email
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end
end
