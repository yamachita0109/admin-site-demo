class Admin::WritersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_writer, only: [:edit, :update]

  def index
    @writers = Writer.all
  end

  def edit
  end

  def update
    if @writer.update(writer_params)
      redirect_to admin_writers_path, notice: 'ライター情報を更新しました。'
    else
      render :edit
    end
  end

  private

  def set_writer
    @writer = Writer.find(params[:id])
  end

  def writer_params
    params.require(:writer).permit(:name, :email, :password, :password_confirmation)
  end
end