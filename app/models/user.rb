require 'openssl'

class User < ApplicationRecord

  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :question

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

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
