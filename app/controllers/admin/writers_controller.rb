class Admin::WritersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @writers = Writer.includes(:writer_profile).order(created_at: :desc)
  end

  def new
    @writer = Writer.new
    @writer.build_writer_profile
  end

  def create
    @writer = Writer.new(writer_params)

    if @writer.save
      redirect_to admin_writers_path, notice: "ライターを作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @writer = Writer.find(params[:id])
  end

  def update
    @writer = Writer.find(params[:id])

    if @writer.update(writer_params)
      redirect_to admin_writers_path, notice: "ライター情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def writer_params
    params.require(:writer).permit(
      :email, :password, :password_confirmation,
      writer_profile_attributes: [
        :profile_text, :icon_image, :header_image, :x_id, :facebook_id, 
        :instagram_id, :tiktok_id, :youtube_id, :discord_id, :site_url, 
        :wordpress_id
      ]
    )
  end
end