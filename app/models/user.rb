class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable,
         :trackable, :validatable, :token_authenticatable, authentication_keys: [:login]

  ## Database authenticatable
  field :username,           type: String, default: ""
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  validates :username, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :encrypted_password, presence: true

  ## Token authenticatable
  field :authentication_token, type: String

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Approvable
  field :approved, type: Boolean, default: false

  ## Roles
  field :role, type: String
  ROLES = %w[member editor admin superadmin]

  ## User data
  field :name, type: String
  validates_presence_of :name

  attr_accessor :login
  attr_accessible :login, :username, :email, :password, :password_confirmation, 
                  :name, :role, :approved, :created_at, :updated_at

  has_many :articles

  def role?(option)
    role == option.to_s
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login).downcase
      where(conditions).where('$or' => [ {:username => /^#{Regexp.escape(login)}$/i}, {:email => /^#{Regexp.escape(login)}$/i} ]).first
    else
      where(conditions).first
    end
  end  

end