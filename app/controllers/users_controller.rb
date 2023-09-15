class UsersController < ApplicationController
    def show
        @print = Print.all
    end
end