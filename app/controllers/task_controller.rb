class TaskController < ApplicationController
  def top
    @tasks = Task.where("deadline >= ?",Date.current).where(clear: 0).order(deadline: :asc)

  end

  def clear
    @task = Task.find_by(id: params[:id])
    @task.clear = 1
    @task.save
    if Task.where("deadline >= ?",Date.current).where(clear: 0) == []
      flash[:notice] = "Congratulations! 全てのタスクを完了しました"
    else
      flash[:notice] = "Congratulations! タスクを完了しました"
    end
    redirect_to("/")
  end

  def set
    require "date"
  end

  def create
    @task = Task.new(
      content: params[:content],
      deadline: params[:deadline],
      clear: 0
    )
    @task.save
    flash[:notice] = "タスクを追加しました"
    redirect_to("/")
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to("/index")
  end

  def set_again
    @task = Task.find_by(id: params[:id])
    @task.clear = 0
    @task.save
    flash[:notice] = "タスクを再設定しました"
    redirect_to("/")
  end
  
  def index
    @tasks = Task.all.order(deadline: :desc)
  end
end