class EntriesController < ApplicationController
  
  before_action :auth_required
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
  	if current_user.is_admin?
      @entries = Entry.order(created_at: :DESC)
    else
      @entries = current_user.entries
    end
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user_id  = current_user.id

    if @entry.save
      BuzonMailer.send_buzon(@entry).deliver_now          
      redirect_to '/'
    else 
       puts @entry.errors.full_messages
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:message)
    end
end
