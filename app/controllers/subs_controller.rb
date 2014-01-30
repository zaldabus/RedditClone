class SubsController < ApplicationController
  before_filter :authenticate, except: :index

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(params[:sub])
    @sub.mod_id = current_user.id

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
