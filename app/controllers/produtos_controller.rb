class ProdutosController < ApplicationController
before_action :set_produto, only: [:edit, :update, :destroy]# a função set_produto vai ser a primeira 
# a ser chamada dentro das funçõs edit, update e destroy

  def index
    @produtos_por_nome = Produto.order :nome
    @produtos_por_preco = Produto.order(:preco).limit 3
  end

  def  busca
    @nome_a_buscar = params[:nome]
    @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"#Usamos o % % para buscar um termo
    #e não um número exato
  end

  def new
    @produto = Produto.new
    renderiza_new
  end

  def create
    valores = produto_params
    @produto = Produto.new valores
    
    if @produto.save
      flash[:notice] = "Produto Salvo com Sucesso!"
      redirect_to root_url
    else
      renderiza_new
    end
  end

  def destroy
      #set_produto
      @produto.destroy
      redirect_to root_url
  end

  def edit
    #set_produto
    renderiza :edit
  end

  def update
    #set_produto   
    valores = produto_params
    if @produto.update valores #observa cada valor permitido em valores e atualiza
      flash[:notice] = "Produto atualizado com sucesso!" #se atualizar exibe uma 
      redirect_to root_url #mensagem e redireciona para url raiz
    else
      renderiza :edit
    end    
  end
  
  private
  def renderiza_new
    @departamentos = Departamento.all
    render :new 
  end

  def renderiza(view)
    @departamentos = Departamento.all
    render view
  end

  def set_produto #busca produto por id
    id = params[:id]
    @produto = Produto.find(id)
  end

  def produto_params
    params.require(:produto).permit(:nome, :descricao, :preco, :quantidade, :departamento_id)
  end  
end
