class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @task2 = current_user.task2s.build  # form_for 用
      @task2s = current_user.task2s.order('created_at DESC').page(params[:page])
    end
  end
end