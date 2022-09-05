unit wkPedidos.controller.PedidoVenda.Controller;

interface

uses
  wkPedidos.model.interfaces.PedidosDadosGerais,
  wkPedidos.model.interfaces.PedidosProdutos,
  wkPedidos.model.factory.PedidoDadosGerais,
  wkPedidos.model.factory.PedidosProdutos,
  wkPedidos.model.PedidoVenda.Dao;

type
  iPedidoVendaController = interface
    ['{02021754-EAD2-44E2-85E5-3E27BA3A2BEB}']
      function PedidosDadosGeraisFactory : iPedidosDadosGeraisFactory;
      function PedidosProdutosFactory : iPedidosProdutosFactory;
      function AbrirPedido(pNumeroPedido : Integer) : iPedidoVendaController;
      function InserirPedido : iPedidoVendaController;
      function InserirProduto : iPedidoVendaController;
      function DeletarProduto : iPedidoVendaController;
      function GravarPedido : iPedidoVendaController;
      function BuscarCliente : iPedidoVendaController;
      function BuscarProduto : iPedidoVendaController;
      function ExistePedido : Boolean;
      function ExistemPedidoItens : Boolean;
      procedure ProximoCodigoPedido;
      procedure ProximoCodigoPedidoProduto;
  end;

type
  TPedidoVendaControler = class(TInterfacedObject, iPedidoVendaController)
    private
      FPedidosDadosGeraisFactory : iPedidosDadosGeraisFactory;
      FPedidosProdutosFactory : iPedidosProdutosFactory;
      FPedidoVendaDAO : TPedidoVendaDao;
      function PedidosDadosGeraisFactory : iPedidosDadosGeraisFactory;
      function PedidosProdutosFactory : iPedidosProdutosFactory;
      function AbrirPedido(pNumeroPedido : Integer) : iPedidoVendaController;
      function InserirPedido : iPedidoVendaController;
      function InserirProduto : iPedidoVendaController;
      function DeletarProduto : iPedidoVendaController;
      function GravarPedido : iPedidoVendaController;
      function BuscarCliente : iPedidoVendaController;
      function BuscarProduto : iPedidoVendaController;
      function ExistePedido : Boolean;
      function ExistemPedidoItens : Boolean;
      procedure ProximoCodigoPedido;
      procedure ProximoCodigoPedidoProduto;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPedidoVendaController;
end;

implementation

{ TPedidoVendaControler }

function TPedidoVendaControler.AbrirPedido(pNumeroPedido : Integer):
iPedidoVendaController;
begin

end;

function TPedidoVendaControler.BuscarCliente: iPedidoVendaController;
begin
  FPedidoVendaDAO.BuscarCliente(FPedidosDadosGeraisFactory.PedidosDadosGerais);
end;

function TPedidoVendaControler.BuscarProduto: iPedidoVendaController;
begin
  FPedidoVendaDAO.BuscarProduto(FPedidosProdutosFactory.PedidosProdutos);
end;

constructor TPedidoVendaControler.Create;
begin
  FPedidosDadosGeraisFactory := TPedidosDadosGeraisFactory.New;
  FPedidosProdutosFactory := TPedidosProdutosFactory.New;
  FPedidoVendaDAO := TPedidoVendaDao.Create(NIL);
end;

function TPedidoVendaControler.DeletarProduto: iPedidoVendaController;
begin

end;

destructor TPedidoVendaControler.Destroy;
begin

  inherited;
end;

function TPedidoVendaControler.ExistemPedidoItens: Boolean;
begin
  Result := FPedidoVendaDAO.ExistemPedidoItens;
end;

function TPedidoVendaControler.ExistePedido: Boolean;
begin
  Result := FPedidoVendaDAO.ExistePedido;
end;

function TPedidoVendaControler.GravarPedido: iPedidoVendaController;
begin
  FPedidoVendaDAO.GravarPedido(FPedidosDadosGeraisFactory.
    PedidosDadosGerais);
end;

function TPedidoVendaControler.InserirPedido: iPedidoVendaController;
begin
  FPedidoVendaDAO.GravaPedidoTemp(FPedidosDadosGeraisFactory.
    PedidosDadosGerais);
end;

function TPedidoVendaControler.InserirProduto: iPedidoVendaController;
begin
  FPedidoVendaDAO.GravaPedidoProdutosTemp(FPedidosProdutosFactory.
    PedidosProdutos);
end;

class function TPedidoVendaControler.New: iPedidoVendaController;
begin
  Result := Self.Create;
end;

function TPedidoVendaControler.PedidosDadosGeraisFactory:
iPedidosDadosGeraisFactory;
begin
  Result := FPedidosDadosGeraisFactory;
end;

function TPedidoVendaControler.PedidosProdutosFactory: iPedidosProdutosFactory;
begin
  Result := FPedidosProdutosFactory;
end;

procedure TPedidoVendaControler.ProximoCodigoPedido;
begin
  FPedidoVendaDAO.ProximoCodigoPedido(FPedidosDadosGeraisFactory.
  PedidosDadosGerais);
end;

procedure TPedidoVendaControler.ProximoCodigoPedidoProduto;
begin
  FPedidoVendaDAO.ProximoCodigoItem(FPedidosProdutosFactory.PedidosProdutos);
end;

end.
