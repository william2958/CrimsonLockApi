class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  field :website, type: String
  field :email, type: String
  field :user_name, type: String
  field :password, type: String
  field :last_modifier, type: String

  embedded_in :user
end
