class HealthsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :search_health, only: [:search, :result]
  before_action :ensure_checker, only: [:search, :result]
  
  def index
  end

  def new
    @health = Health.new
  end

  def create
    @health = Health.new(health_params)
    if @health.save
      # 体温が37度以上 or アルコール数値が0.15mg/L以上 or 体調が不調 どれか一つでも当てはまれば確認画面へ遷移
      if (@health.body_temperature >= 37.0) || (@health.alcohol_level >= 0.15) || (@health.condition_id == 4)
        redirect_to check_healths_path
      else
        redirect_to top_healths_path
      end
    else
      render :new
    end
  end

  def check
    @healths = Health.all.order(created_at: :desc)
    @user = User.new
  end

  def approval
    @user = User.find_by(health_checker_params)
    if !@user.nil?
      # 確認者とログインユーザーが一緒だとエラーメッセージの表示
      if @user.id == current_user.id
        flash[:error] = '他の資格保有者が承認を行なってください'
        redirect_to check_healths_path
        # 資格保有者か判定
      elsif @user.checker_id == 2
        redirect_to top_healths_path
      else
        flash[:error] = '資格保有者のメールアドレスを入力してください'
        redirect_to check_healths_path
      end
    else
      flash[:error] = '確認者のメールアドレスを入力してください'
      redirect_to check_healths_path
    end
  end

  def top
  end

  def search
    set_user_column
    set_health_column
  end

  def result
    @results = @h.result.includes(:user)
  end

  private

  def health_params
    params.require(:health).permit(:body_temperature, :condition_id, :alcohol_level).merge(user_id: current_user.id)
  end

  def health_checker_params
    params.require(:user).permit(:email)
  end

  def search_health
    @h = Health.ransack(params[:q])
  end

  def set_user_column
    @user_name = User.select('name')
  end

  def set_health_column
    @health_created_at = Health.select('created_at')
  end

  def ensure_checker
    redirect_to top_healths_path if current_user.checker_id != 2
  end
end
