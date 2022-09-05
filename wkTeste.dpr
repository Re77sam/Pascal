program wkPedidos;

uses
  Vcl.Forms,
  wkPedidos.views.Pedidos in 'views\wkPedidos.views.Pedidos.pas' {frmPedidos},
  wkPedidos.model.PedidosDadosGerais in 'model\wkPedidos.model.PedidosDadosGerais.pas',
  wkPedidos.model.PedidoVenda.Dao in 'model\dao\wkPedidos.model.PedidoVenda.Dao.pas' {PedidoVendaDao: TDataModule},
  wkPedidos.model.factory.PedidoDadosGerais in 'model\factory\wkPedidos.model.factory.PedidoDadosGerais.pas',
  wkPedidos.model.interfaces.PedidosDadosGerais in 'model\interfaces\wkPedidos.model.interfaces.PedidosDadosGerais.pas',
  wkPedidos.controller.PedidoVenda.Controller in 'controller\wkPedidos.controller.PedidoVenda.Controller.pas',
  wkPedidos.model.PedidosProdutos in 'model\wkPedidos.model.PedidosProdutos.pas',
  wkPedidos.model.factory.PedidosProdutos in 'model\factory\wkPedidos.model.factory.PedidosProdutos.pas',
  wkPedidos.model.interfaces.PedidosProdutos in 'model\interfaces\wkPedidos.model.interfaces.PedidosProdutos.pas',
  uWkUtils in 'util\uWkUtils.pas',
  wkPedidos.model.exceptions.Pedidos in 'model\exceptions\wkPedidos.model.exceptions.Pedidos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.Run;
end.
