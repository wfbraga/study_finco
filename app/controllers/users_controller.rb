class UsersController < ApplicationController
  def index
    @users = User.all

    @email = params[:email]
    @name  = params[:name]

    if @email.present?
      @users = @users.by_email(@email)
    end

    if @name.present?
      @users = @users.where(name: @name)
    end

    # => SELECT "users".* FROM "users" WHERE "users"."email" = $1 AND "users"."name" = $2
  end
end
