class ArticlesController < ApplicationController
    
    def show
        @article = Article.find(params[:id]) # afficher l'article selon son id
    end

    def index
        @articles = Article.all # afficher la liste des articles (titre, description)
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id]) # récupérer l'id de l'article sur lequel apporté les modifs.
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description)) #Créer un article qui nécessite le paramètre article et les permissions titre et description
        if @article.save #enregistrer l'article depuis l'envoi du formulaire en front
            flash[:notice] = "Article was created successfully." #envoi de l'alerte du succès de la création
            redirect_to @article #rediriger vers la page show de l'article créé après la création de l'article dans le formulaire
        else
            render 'new' #en cas d'échec de la sauvegarde du nouvel article, renvoyer de nouveau au formulaire 
        end
    end 

    def update
        @article = Article.find(params[:id]) #trouver l'id de l'article à modifier
        if @article.update(params.require(:article).permit(:title, :description)) # mettre à jour l'article sur les params titre et description
            flash[:notice] = "Article was updated successfully." #envoi de l'alerte du succès de la modification 
            redirect_to @article #rediriger vers le show path
        else  
            render 'edit' #en cas d'échec de l'update, renvoyer au formulaire d'update.
        end
    end

    def destroy
        @article = Article.find(params[:id]) #trouver l'id de l'article à modifier
        @article.destroy #action de supprimer l'article en question (id)
        redirect_to articles_path #retour sur la page liste d'articles
    end

end 
