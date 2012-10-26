class FormulariosController < ApplicationController
  require_role "rh", :for => [:destroy,:update,:index,:listagem_por_curso]
  def index
      if params[:search].blank?
          @search = Formulario.search(params[:search])
          @formularios = @search.paginate(:page=>params[:page],:per_page =>15)
      else
          @search = Formulario.search(params[:search])
          @formularios = @search.paginate(:all,:page=>params[:page],:per_page =>15)
      end
  end

  def show
    @formulario = Formulario.find(params[:id])
  end

  def new
    @formulario = Formulario.new
  end

  def create
    @formulario = Formulario.new(params[:formulario])
    if @formulario.save
      flash[:notice] = "Successfully created formulario."
      redirect_to @formulario
    else
      render :action => 'new'
    end
  end

  def edit
    @formulario = Formulario.find(params[:id])
  end

  def update
    @formulario = Formulario.find(params[:id])
    if @formulario.update_attributes(params[:formulario])
      flash[:notice] = "Successfully updated formulario."
      redirect_to @formulario
    else
      render :action => 'edit'
    end
  end

  def destroy
    @formulario = Formulario.find(params[:id])
    @formulario.destroy
    flash[:notice] = "Successfully destroyed formulario."
    redirect_to formularios_url
  end

  def listagem_por_curso
      if params[:search].blank?
          @search = Formulario.search(params[:search])
          @formularios = @search.paginate(:page=>params[:page],:per_page =>15)
      else
          @search = Formulario.search(params[:search])
          @formularios = @search.paginate(:all,:page=>params[:page],:per_page =>15)
      end    
  end

  def impressao
      @formularios = Formulario.all(:conditions => ["disciplina = ?",params[:search]])
      render :layout => "impressao"
  end

end
