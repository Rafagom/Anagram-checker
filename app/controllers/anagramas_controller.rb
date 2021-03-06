class AnagramasController < ApplicationController

    def show
        @anagrama = Anagrama.find(params[:id])
    end
    
    def new
        @anagrama=Anagrama.new
    end
    
    def create
        @anagrama = Anagrama.new(anagrama_params)
        @anagrama.resultado = @anagrama.verificar
        
        if @anagrama.save 
            redirect_to @anagrama
            
        else
            render 'new'
        end
    end
    
    def destroy
        @anagrama = Anagrama.find(params[:id])
        @anagrama.destroy
        redirect_to @anagrama
end
        def index
        @anagramas = Anagrama.all
    end
    
    
    private
        def anagrama_params
            params.require(:anagrama).permit(:palavra1, :palavra2)
        end  
    
    
end