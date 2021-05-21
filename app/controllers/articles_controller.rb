class ArticlesController < ApplicationController
    
    def show
        @article = Article.find(params[:id]) # afficher l'article selon son id
    end

    def index
        @articles = Article.all # afficher la liste des articles (titre, description)
    end

    def new

    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description)) #Créer un article qui nécessite le paramètre article et les permissions titre et description
        @article.save #enregistrer l'article depuis l'envoi du formulaire en front
        redirect_to @article #rediriger vers la page show de l'article créé après la création de l'article dans le formulaire
    end 
end 
