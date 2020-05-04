class TodosController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.create(todo_params)
    render json: @todo
  end

  def update
    @todo.update(todo_params)
    render json: @todo
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.delete
    render json: @todo
  end

  private

  def todo_params
    params.permit(:text)
  end
end
