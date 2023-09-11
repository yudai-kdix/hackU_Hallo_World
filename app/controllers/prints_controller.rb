class PrintsController < ApplicationController
    def index
        @prints=Print.all
    end
end
