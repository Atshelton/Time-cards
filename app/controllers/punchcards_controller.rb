class PunchcardsController < ApplicationController
  def new
    @punch = Punchcard.new
  end

  def index
    @punch = Punchcard.all
  end

  def show
    @punch = Punchcard.find_by(id: params["id"])
  end

  def create
    @punch = Punchcard.new(punch_params)
    if @punch.save!
      redirect_to punchcards_path
    else
      render :new
    end
  end

  def edit
    @punch = Punchcard.find(params["id"])
  end

  def update
    @punch = Punchcard.find(params["id"])
    if @punch.update(punch_params)
      redirect_to punchcards_path
    else
      render :edit
    end
  end

  def destroy
    @punch = Punchcard.find(params["id"])
    @punch.destroy
    redirect_to punchcards_path
  end

  private def punch_params
    params.require("punchcard").permit(:logged_time, :task, :notes)
  end
end
