class UsersController < ApplicationController
  def index
    @users = User.all
    @import = User::Import.new
  end

  def import
    @import = User::Import.new user_import_params
    if @import.save
      redirect_to users_path, notice: "Imported #{@import.imported_count} users"
    else
      @users = User.all
      flash[:alert] = "There were #{@import.errors.count} errors with your CSV file"
      render action: :index
    end
  end

  private

    def user_import_params
      params.require(:user_import).permit(:file)
    end
end
