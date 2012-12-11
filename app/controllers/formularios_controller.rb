class FormulariosController < ApplicationController
  require_role ["rh","administrador"], :for => [:new, :create, :destroy,:update,:index,:listagem_por_curso]
  def index
      if params[:search].blank?
          @search = Formulario.search(params[:search])
          @formularios = @search.paginate(:page=>params[:page],:per_page =>15, :conditions => ["ativo = 1"])
      else
          @search = Formulario.search(params[:search])
          @formularios = @search.paginate(:all,:page=>params[:page],:per_page =>15, :conditions => ["ativo = 1"])
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
      if logged_in?
        @formulario.gera_log(current_user.id, "Inscrição efetuada")
      end
      Notificador.deliver_email_geral(@formulario)
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
    if logged_in?
      @formulario.gera_log(current_user.id, "Atualização de inscrição efetuada")
    end
      flash[:notice] = "Successfully updated formulario."
      redirect_to @formulario
    else
      render :action => 'edit'
    end
  end

  def destroy
    @formulario = Formulario.find(params[:id])
    if logged_in?
      @formulario.gera_log(current_user.id, "Exclusão de inscrição efetuada")
    end
    @formulario.destroy
    flash[:notice] = "Successfully destroyed formulario."
    redirect_to formularios_url
  end

  def listagem_por_curso
      if params[:search].blank?
          @search = Formulario.search(params[:search])
          @formularios = @search.all(:conditions => ["ativo = 1"],:order => "nome")
      else
          @search = Formulario.search(params[:search])
          @formularios = @search.all(:conditions => ["ativo = 1"],:order => "nome")
      end
  end

  def impressao
      @formularios = Formulario.all(:conditions => ["ativo = 1 and disciplina = ?",params[:search]], :order => "nome")
      render :layout => "impressao"
  end

  def ativo
    @formularios = Formulario.all(:conditions => ["documentacao_entregue = 1"], :order => "nome ASC")
  end

  def cancelados
    if params[:nome].present?
      @formularios = Formulario.all(:conditions => ["(ativo = 0 or documentacao_entregue = 0) and nome like ?", "%"+params[:nome]+"%"], :order => "nome ASC")
    else
      @formularios = Formulario.all(:conditions => ["ativo = 0  or documentacao_entregue = 0"], :order => "nome ASC")
    end
  end

end