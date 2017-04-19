class Task2sController < ApplicationController
  before_action :require_user_logged_in

  def index
    if logged_in?
      @user = current_user
      @task2 = current_user.task2s.build  # form_for 用
      @task2s = current_user.task2s.order('created_at DESC').page(params[:page])
    end
  end

  def show
    set_task2
  end

  def new
    @task2 = Task2.new
  end

  def create
  
   @task2 = current_user.task2s.build(task2_params)

    if @task2.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task2
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end

  end
  
  def edit
    set_task2
  end

  def update
    set_task2
    if @task2.update(task2_params)
      flash[:success] = 'Task2s は正常に更新されました'
      redirect_to @task2
    else
      flash.now[:danger] = 'Task2s は更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_task2
    @task2.destroy

    flash[:success] = 'Task2s は正常に削除されました'
    redirect_to task2s_url
  end

  private

  def task2_params
    params.require(:task2).permit(:status, :content)
  end

  def correct_user
    @task2 = current_user.task2s.find_by(id: params[:id])
    unless @task2
      redirect_to root_path
    end
  end
  
  def set_task2
    @task2 = Task2.find(params[:id])
  end
  

end