class HabitsController < ApplicationController
  def new
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)
    if @habit.save
      HabitMailer.confirmation_email(@habit).deliver_later
      redirect_to @habit
    else
      render "new"
    end
  end

  def show
    @habit = Habit.find(params[:id])
  end

  def confirm
    habit = Habit.find(params[:id])
    given_token = params[:token]

    if given_token == habit.confirmation_token
      habit.confirmed = true
      habit.active = true
      habit.save
    end

    redirect_to habit
  end

  private

  def habit_params
    params.require(:habit).permit(:habit_name, :user_name, :email)
  end
end
