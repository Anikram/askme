require 'openssl'

class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /[0-9a-zA-Z_]+/i
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :question

  validates :email, :username, presence: true, uniqueness: true

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates_format_of :email, :with => VALID_EMAIL_REGEX #49-1 - email format validation
  validates_format_of :username, :with => VALID_USERNAME_REGEX #49-1 - username format validation
  validates_length_of :username, :minimum => 6, :maximum => 20 #49-1 - username length validation
  validates_format_of :avatar_url, :with => /\.png|\.jpg/, on: :update

  before_validation :downcase_username# 49-2 - adjust username format

  before_save :encrypt_password

  def encrypt_password
    if self.password.present?
      #уникальная случайная строка - "соль" для хакеров.
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      # создание пароля
      self.password_hash = User.hash_to_string(
                                 OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def downcase_username  # 49-2 - adjust username format
    if self.username.present?
      self.username.downcase!
    end
  end

  #служебный код для преобразования строки в 16й формат, для удобства хранения
  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email) #находим юзера по мылу

    if user != nil && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end
end
