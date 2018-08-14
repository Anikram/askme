require 'openssl'
# :nodoc:
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /[0-9a-zA-Z_]+/i
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :question, dependent: :destroy

  validates :email, :username, presence: true, uniqueness: true

  attr_accessor :password, :password_hash, :password_salt

  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates_format_of :email, with: VALID_EMAIL_REGEX
  validates_format_of :username, with: VALID_USERNAME_REGEX
  validates_length_of :username, minimum: 6, maximum: 20
  validates_format_of :avatar_url, with: /\.png|\.jpg/, on: :update
  validates :bgcolor, format: { with: /\A#[\da-fA-F]{6}\z/ }

  before_validation :downcase_username

  before_save :encrypt_password

  def encrypt_password
    if password.present?
      # random string - password security
      @password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      @password_hash = User.hash_to_string(calculate_password_hash)
    end
  end

  def downcase_username
    username.downcase! if username.present?
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    user if !user.nil? && password_correct?(user, password)
  end

  def calculate_password_hash
    OpenSSL::PKCS5.pbkdf2_hmac(password, password_salt,
                               ITERATIONS, DIGEST.length, DIGEST)
  end

  def password_correct?(user, password)
    user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password,
                                                                         user.password_salt,
                                                                         ITERATIONS,
                                                                         DIGEST.length,
                                                                         DIGEST))
  end
end
