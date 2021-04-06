class KlassesController < ApplicationController

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
        find_klass
    end

    def edit
        find_klass
    end

    def update
        byebug
        find_klass
        if @klass.update(klass_params)
            redirect_to class_path(@klass)
        else
            render
        end
    end

    def destroy

    end

    private

    def find_klass
        @klass = Klass.find_by(id: params[:id])
    end

    def klass_params
        params.require(:klass).permit(:name, :description, :level, :price, :length, :date, :time)
    end
end
