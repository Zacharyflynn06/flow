class KlassesController < ApplicationController

    def new
        @klass = Klass.new
    end
    
    def index 
        @klasss = Klass.all
    end

    def show
        find_klass
    end

    def edit

    end

    def update
        find_klass
    end

    def destroy

    end

    private

    def find_klass
        @klass = Klass.find_by(id: params[:id])
    end

    def klass_params
        params.require((:klass).permit(:first_name, :last_name)
    end
end
