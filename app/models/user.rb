class User
  include Mongoid::Document

  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable, :omniauthable, :confirmable, :lockable
         
  #include Mongoid::Locker
  include DeviseTokenAuth::Concerns::User 

  field :email, type: String
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at, type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String

  ## Confirmable
  field :confirmation_token, type: String
  field :confirmed_at, type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email, type: String

  # Lockable
  field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  field :locked_at,       type: Time

  ## User Info
  field :name, type: String

  ## unique oauth id
  field :provider, type: String
  field :uid, default: ""

  ## Tokens
  field :tokens, type: Hash, default: { }

  ## Index
  index({email: 1, uid: 1, reset_password_token: 1}, {unique: true})

  ## Validation
  validates_uniqueness_of :email, :uid

  embeds_many :accounts, class_name: "Account"

  # Example of a validation
  # validate :ensure_allowed_favorite_color
  # field :favorite_color, type: String

  # def ensure_allowed_favorite_color
  #   if favorite_color and favorite_color != ""
  #     unless ApplicationHelper::COLOR_NAMES.any?{ |s| s.casecmp(favorite_color)==0 }
  #       matches = ApplicationHelper::COLOR_SEARCH.search(favorite_color)
  #       msg = "We've never heard of the color \"#{favorite_color}\""

  #       if matches.length > 1
  #         closest_match = matches.last[:string]
  #         second_closest_match = matches[-2][:string]
  #         msg += ". Did you mean \"#{closest_match}\"? Or perhaps \"#{second_closest_match}\"?"
  #       end

  #       errors.add(:favorite_color, msg)
  #     end
  #   end
  # end
end
