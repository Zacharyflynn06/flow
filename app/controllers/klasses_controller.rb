class KlassesController < ApplicationController

    before_action :find_klass, only: [:show, :edit, :update]

    def new
        @klass = Klass.new
    end

    def create
        @klass = Klass.new(klass_params)

        if @klass.valid?
            @klass.save
            redirect_to class_path(@klass)
        else
            render :new
        end
    end
    
    def index 
        @klass = Klass.all
    end

    def show
    end

    def edit
    end

    def update
        if @klass.update(klass_params)
            redirect_to class_path(@klass)
        else
            render :edit
        end
    end

    def destroy
        find_klass
        @klass.destroy
    end

    private

    def find_klass
        @klass = Klass.find_by(id: params[:id])
    end

    def klass_params
        params.require(:klass).permit(:name, :description, :level, :price, :duration, :day, :time)
    end

    def standard_time(object)
        object.time.strftime()
    end
end
