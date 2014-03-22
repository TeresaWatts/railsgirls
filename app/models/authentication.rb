class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :provider
  belongs_to :user
  def twitter
raise omni = request.env["omniauth.auth"].to_yaml
end
