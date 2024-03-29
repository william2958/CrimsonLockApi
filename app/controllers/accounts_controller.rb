class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?

  def index
    render json: {
      data: {
        accounts: current_user.accounts.all,
        user: current_user
      }
    }, status: 200
  end

  def create
    @account = current_user.accounts.create!(account_params)
    puts "The account is: " , current_user.accounts
    @account.save
    render json: @account
  end

  def update
    @account = current_user.accounts.find(params[:_id]).update_attributes(car_params)
    render json: @account
  end

  def destroy
    current_user.accounts.find(params[:_id]).delete
    render json: {deleted: true}
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.permit(:_id, :website, :email, :user_name, :password)
    end
end
