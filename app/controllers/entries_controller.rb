class EntriesController < ApplicationController

  def log_success
    entry = Entry.find(params[:id])
    entry.update(successful: true)

    redirect_to entry.habit
  end

  def log_failure
    entry = Entry.find(params[:id])
    entry.update(successful: false)

    redirect_to entry.habit
  end

end
