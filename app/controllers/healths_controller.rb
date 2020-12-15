class HealthsController < ApplicationController

  def new
    @health = Health.new
  end

  def create
    @health = Health.new(health_params)
    @health.save
    redirect_to root_path
  end

  def check
    @user = User.new
  end

  def approval
    @user = User.find_by(email: params[:email])
    if @user.checker_id == ２
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def health_params
    params.require(:health).permit(:body_temperature, :condition_id, :alcohol_level).merge(user_id: current_user.id)
  end
end
