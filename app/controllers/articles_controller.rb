class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy] #effectuer cette action avant pour ces 4 méthodes
    
    def show
    end

    def index
        @articles = Article.all # afficher la liste des articles (titre, description)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params) #Créer un article qui nécessite le paramètre article et les permissions titre et description
        if @article.save #enregistrer l'article depuis l'envoi du formulaire en front
            flash[:notice] = "Article was created successfully." #envoi de l'alerte du succès de la création
            redirect_to @article #rediriger vers la page show de l'article créé après la création de l'article dans le formulaire
        else
            render 'new' #en cas d'échec de la sauvegarde du nouvel article, renvoyer de nouveau au formulaire 
        end
    end 

    def update
        if @article.update(article_params) # mettre à jour l'article sur les params titre et description
            flash[:notice] = "Article was updated successfully." #envoi de l'alerte du succès de la modification 
            redirect_to @article #rediriger vers le show path
        else  
            render 'edit' #en cas d'échec de l'update, renvoyer au formulaire d'update.
        end
    end

    def destroy
        @article.destroy #action de supprimer l'article en question (id)
        redirect_to articles_path #retour sur la page liste d'articles
    end

    private #DRY

    def set_article
        @article = Article.find(params[:id]) #trouver l'id de l'article
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end 
