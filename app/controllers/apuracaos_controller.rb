class ApuracaosController < ApplicationController
  # GET /apuracaos
  # GET /apuracaos.xml
  before_filter :load_resources
  def index
      if params[:search].blank?
          @search = Apuracao.search(params[:search])
          @apuracaos = @search.paginate(:page=>params[:page],:per_page =>15)
      else
          @search = Apuracao.search(params[:search])
          @apuracaos = @search.paginate(:all,:page=>params[:page],:per_page =>15)
      end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @apuracaos }
    end

  end

  

  # GET /apuracaos/1
  # GET /apuracaos/1.xml
  def show
    @apuracao = Apuracao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @apuracao }
    end
  end

  # GET /apuracaos/new
  # GET /apuracaos/new.xml
  def new
    @apuracao = Apuracao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @apuracao }
    end
  end

  # GET /apuracaos/1/edit
  def edit
    @apuracao = Apuracao.find(params[:id])
  end

  # POST /apuracaos
  # POST /apuracaos.xml
  def create
    @apuracao = Apuracao.new(params[:apuracao])

    respond_to do |format|
      if @apuracao.save
        flash[:notice] = 'Apuracao was successfully created.'
        format.html { redirect_to(@apuracao) }
        format.xml  { render :xml => @apuracao, :status => :created, :location => @apuracao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @apuracao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /apuracaos/1
  # PUT /apuracaos/1.xml
  def update
    @apuracao = Apuracao.find(params[:id])

    respond_to do |format|
      if @apuracao.update_attributes(params[:apuracao])
        flash[:notice] = 'Apuracao was successfully updated.'
        format.html { redirect_to(@apuracao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @apuracao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /apuracaos/1
  # DELETE /apuracaos/1.xml
  def destroy
    @apuracao = Apuracao.find(params[:id])
    @apuracao.destroy

    respond_to do |format|
      format.html { redirect_to(apuracaos_url) }
      format.xml  { head :ok }
    end
  end

  def seleciona_curso
    if params[:sel_curso].to_s == "TODOS"
      @inscritos = Formulario.all(:conditions => ["ativo = 1 and documentacao_entregue = 1"])
    else
      @inscritos = Formulario.all(:conditions => ["disciplina = ? and ativo = 1 and documentacao_entregue = 1", params[:sel_curso]])
    end
    render :update do |page|
      page.replace_html 'filtrado', :partial => "inscritos"
    end

  end

  protected

  def load_resources
    @inscritos = Formulario.all(:conditions => ["ativo = 1 and documentacao_entregue = 1"])
  end

end
