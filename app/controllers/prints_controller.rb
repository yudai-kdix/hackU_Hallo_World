class PrintsController < ApplicationController
    def index
        @prints=Print.all
    end
    def new
    end

    def create
        @print = Print.new(print_params)
        @print.user_id = current_user.id
        @print.save
        redirect_to ""
    end

    private

    def print_params
        params.require(:print).permit(:)
    end
end
