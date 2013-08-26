class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable,
         :trackable, :validatable, :token_authenticatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  validates :email,              presence: true
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

  attr_accessible :name, :email, :password, :password_confirmation, :approved, :role, :created_at, :updated_at
end