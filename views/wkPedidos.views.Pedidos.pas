unit wkPedidos.views.Pedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.StdCtrls, uWkUtils, wkPedidos.controller.PedidoVenda.Controller;

type
  EnumFormState = (sfsInicial,sfsInserir,sfsAlterar);
  EnumItens = (Sim,Nao);

type
  TfrmPedidos = class(TForm)
    Panel1: TPanel;
    sbAbrirPedido: TSpeedButton;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    DBNavigator1: TDBNavigator;
    dbgProdutos: TDBGrid;
    edtValorTotalPedido: TEdit;
    Label1: TLabel;
    edtNumeroPedido: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtDtaEmissao: TEdit;
    Label5: TLabel;
    edtCodCliente: TEdit;
    edtNomeCliente: TEdit;
    Label6: TLabel;
    edtCodProduto: TEdit;
    edtDescricaoProduto: TEdit;
    sbGravarPedido: TSpeedButton;
    Label8: TLabel;
    edtQtdProduto: TEdit;
    edtVlrUnitarioProduto: TEdit;
    Label9: TLabel;
    sbIniciar: TSpeedButton;
    Panel7: TPanel;
    sbDeletarProduto: TSpeedButton;
    sbInserirProduto: TSpeedButton;
    sbCancelar: TSpeedButton;
    dsAux: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure sbIniciarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbAbrirPedidoClick(Sender: TObject);
    procedure sbInserirProdutoClick(Sender: TObject);
    procedure edtCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodClienteExit(Sender: TObject);
    procedure edtNomeClienteExit(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure edtDescricaoProdutoExit(Sender: TObject);
    procedure sbGravarPedidoClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FPedidoVenda : iPedidoVendaController;
    FEstadoForm: EnumFormState;
    FPossuiItens: EnumItens;
    function PedidoValidadoParaInserir : Boolean;
    function ProdutoValidadoParaInserir : Boolean;
    function PedidoValidadoParaGravar : Boolean;
    procedure FormControl(Value : EnumFormState);
    procedure CarregarPedidos;
    procedure CancelaInsercaoPedidos;
    procedure Iniciar;
    procedure BuscarCodigoCliente;
    procedure BuscarNomeCliente;
    procedure BuscarCodigoProduto;
    procedure BuscarDescricaoProduto;
    procedure InserirPedido;
    procedure InserirPedidoProduto;
    procedure AlterarPedidoProduto;
    procedure SetEstadoForm(const Value: EnumFormState);
    procedure SetPossuiItens(const Value: EnumItens);
    procedure ClearCamposPedido;
    procedure ClearCamposItens;
    procedure CalcularValorTotalPedido;
    procedure AlterarProdutos;
  public
    { Public declarations }
    property EstadoForm : EnumFormState read FEstadoForm write SetEstadoForm;
    property PossuiItens : EnumItens read FPossuiItens write SetPossuiItens;
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

{ TfrmPedidos }

procedure TfrmPedidos.AlterarProdutos;
begin
  if PossuiItens = sim then
  begin
    with dbgProdutos.Columns do
    begin
      edtCodProduto.Text := Items[2].field.Text;
      edtDescricaoProduto.Text := Items[3].field.Text;
      edtVlrUnitarioProduto.Text := Items[5].field.Text;
      edtQtdProduto.Text := Items[4].field.Text;
    end;
    SetEstadoForm(sfsAlterar);
  end;
end;

procedure TfrmPedidos.BuscarCodigoCliente;
begin
  if EstadoForm <> sfsInserir then
    Exit;
  if edtNomeCliente.Text = '' then
  begin
    edtCodCliente.Clear;
    Exit;
  end;
  with FPedidoVenda.PedidosDadosGeraisFactory.PedidosDadosGerais do
  begin
    CodigoCliente(0).
    NomeCliente(edtNomeCliente.Text);
    FPedidoVenda.BuscarCliente;
    edtCodCliente.Text := IntToStr(CodigoCliente);
  end;
  edtCodProduto.SetFocus;
end;

procedure TfrmPedidos.BuscarCodigoProduto;
begin
  if EstadoForm <> sfsInserir then
    Exit;
  if edtDescricaoProduto.Text = '' then
  begin
    edtCodProduto.Clear;
    Exit;
  end;
  with FPedidoVenda.PedidosProdutosFactory.PedidosProdutos do
  begin
    CodigoProduto(0).
    DescricaoProduto(edtDescricaoProduto.Text);
    FPedidoVenda.BuscarProduto;
    edtCodProduto.Text := IntToStr(CodigoProduto);
    edtVlrUnitarioProduto.Text := FloatToStr(VlrUnitario);
  end;
end;

procedure TfrmPedidos.BuscarDescricaoProduto;
begin
  if EstadoForm <> sfsInserir then
    Exit;
  if edtCodProduto.Text = '' then
  begin
    edtDescricaoProduto.Text;
    Exit;
  end;
  with FPedidoVenda.PedidosProdutosFactory.PedidosProdutos do
  begin
    CodigoProduto(StrToIntDef(edtCodProduto.Text,0))
    .DescricaoProduto('');
    FPedidoVenda.BuscarProduto;
    edtDescricaoProduto.Text := DescricaoProduto;
    edtVlrUnitarioProduto.Text := FloatToStr(VlrUnitario);
  end;
  edtQtdProduto.SetFocus;
end;

procedure TfrmPedidos.BuscarNomeCliente;
begin
  if EstadoForm <> sfsInserir then
    Exit;
  if edtCodCliente.Text = '' then
  begin
    edtNomeCliente.Clear;
    Exit;
  end;

  with FPedidoVenda.PedidosDadosGeraisFactory.PedidosDadosGerais do
  begin
    CodigoCliente(StrToIntDef(edtCodCliente.Text,0))
    .NomeCliente('');
    FPedidoVenda.BuscarCliente;
    edtNomeCliente.Text := NomeCliente;
  end;
  edtCodProduto.SetFocus;
end;

procedure TfrmPedidos.CalcularValorTotalPedido;
begin
  if PossuiItens = Sim then
    //edtValorTotalPedido.Text := FloatToStr(FPedidoVenda.)

end;

procedure TfrmPedidos.CancelaInsercaoPedidos;
begin
  FormControl(sfsInicial);
end;

procedure TfrmPedidos.CarregarPedidos;
begin
  if edtCodCliente.Text <> '' then
  begin
    ShowMessage(MESSAGECARREGAPEDIDOSVALCLIENTE);
    Exit;
  end;
end;

procedure TfrmPedidos.ClearCamposItens;
begin
  edtCodProduto.Clear;
  edtDescricaoProduto.Clear;
  edtVlrUnitarioProduto.Clear;
  edtQtdProduto.Clear;
end;

procedure TfrmPedidos.ClearCamposPedido;
begin
  edtCodCliente.Clear;
  edtNomeCliente.Clear;
end;

procedure TfrmPedidos.dbgProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    AlterarProdutos;
end;

procedure TfrmPedidos.edtCodClienteExit(Sender: TObject);
begin
  BuscarNomeCliente;
end;

procedure TfrmPedidos.edtCodClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ClearCamposPedido;
end;

procedure TfrmPedidos.edtCodProdutoExit(Sender: TObject);
begin
  BuscarDescricaoProduto;
end;

procedure TfrmPedidos.edtCodProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ClearCamposItens;
end;

procedure TfrmPedidos.edtDescricaoProdutoExit(Sender: TObject);
begin
  BuscarDescricaoProduto
end;

procedure TfrmPedidos.edtDescricaoProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ClearCamposItens;
end;

procedure TfrmPedidos.edtNomeClienteExit(Sender: TObject);
begin
  BuscarNomeCliente;
end;

procedure TfrmPedidos.edtNomeClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    ClearCamposPedido;
end;

procedure TfrmPedidos.FormControl(Value: EnumFormState);
var
  i : Integer;
begin
  SetEstadoForm(Value);
  try
    for I := 0 to Self.ComponentCount -1 do
    begin
       if (Self.Components[i] is TEdit) then
       begin
         TEdit(Self.Components[i]).Clear;
         TEdit(Self.Components[i]).Enabled := (EstadoForm = sfsInserir);
       end;
     end;
     sbAbrirPedido.Enabled := (EstadoForm = sfsInicial);
     sbIniciar.Enabled := (EstadoForm = sfsInicial);
     sbCancelar.Enabled := (EstadoForm = sfsInserir);
     sbInserirProduto.Enabled := (EstadoForm = sfsInserir);
     sbDeletarProduto.Enabled := (EstadoForm = sfsInserir);
     sbGravarPedido.Enabled := (EstadoForm = sfsInserir);
     edtNumeroPedido.Enabled := (EstadoForm = sfsInicial);
     edtDtaEmissao.Enabled := False;
     edtVlrUnitarioProduto.Enabled := False;
     edtValorTotalPedido.Enabled := False;
     if EstadoForm = sfsInicial then
     begin
      dbgProdutos.DataSource := dsAux;
      DBNavigator1.DataSource := dsAux;
     end;
  except on E : Exception do
    ShowMessage(MESSAGEEXCEPCOMPCONTROL + E.Message);
  end;
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  FormControl(sfsInicial);
  FPedidoVenda := TPedidoVendaControler.New;
end;

procedure TfrmPedidos.Iniciar;
begin
  FPedidoVenda.ProximoCodigoPedido;
  with FPedidoVenda.PedidosDadosGeraisFactory.PedidosDadosGerais do
    edtNumeroPedido.Text := IntToStr(NumeroPedido);
  SetPossuiItens(Nao);
  edtCodCliente.SetFocus;
  edtValorTotalPedido.Text := '0.00';
end;

procedure TfrmPedidos.InserirPedido;
begin
  if (EstadoForm <> sfsInserir) then
    Exit;
  if FPedidoVenda.ExistePedido then
    Exit;
  if NOT PedidoValidadoParaInserir then
  begin
    ShowMessage(MESSAGEVALIDARCAMPOSPEDIDOS);
    Exit;
  end;
  with FPedidoVenda.PedidosDadosGeraisFactory.PedidosDadosGerais do
  begin
    NumeroPedido(StrToIntDef(edtNumeroPedido.Text,0)).
    CodigoCliente(StrToIntDef(edtCodCliente.Text,0));
    FPedidoVenda.InserirPedido;
  end;
end;

procedure TfrmPedidos.InserirPedidoProduto;
begin
  if (EstadoForm <> sfsInserir) then
    Exit;
  if NOT ProdutoValidadoParaInserir then
  begin
    ShowMessage(MESSAGEVALIDARCAMPOSPEDIDOSPRODUTOS);
    Exit;
  end;
  SetPossuiItens(Nao);
  with FPedidoVenda.PedidosProdutosFactory.PedidosProdutos do
  begin
    Autoincrem(Autoincrem).
    NumeroPedido(StrToIntDef(edtNumeroPedido.Text,0)).
    CodigoProduto(StrToIntDef(edtCodProduto.Text,0)).
    DescricaoProduto(edtDescricaoProduto.Text).
    Quantidade(StrToIntDef(edtQtdProduto.Text,0)).
    VlrUnitario(StrToFloatDef(edtVlrUnitarioProduto.Text,0.00)).
    VlrTotal(CalculaValorTotalProduto(edtQtdProduto,edtVlrUnitarioProduto));
    FPedidoVenda.InserirProduto;
    dbgProdutos.DataSource := DsPedidosProdutos;
    DBNavigator1.DataSource := DsPedidosProdutos;
    if NOT dbgProdutos.DataSource.DataSet.IsEmpty then
      SetPossuiItens(Sim);
    edtCodProduto.SetFocus;
    ClearCamposItens;
  end;
  with FPedidoVenda.PedidosDadosGeraisFactory.PedidosDadosGerais do
    edtValorTotalPedido.Text := FloatToStr(ValorTotal);
end;

function TfrmPedidos.PedidoValidadoParaGravar: Boolean;
begin
  if PossuiItens = sim then
  begin
      FPedidoVenda.GravarPedido;
      FormControl(sfsInicial);
  end;
end;

function TfrmPedidos.PedidoValidadoParaInserir: Boolean;
var
  vVal,vVal2 : Boolean;
begin
  vVal := (edtNumeroPedido.Text <> '') or (edtNumeroPedido.Text <> '0');
  vVal2 := (edtCodCliente.Text <> '') or (edtCodCliente.Text <> '0');
  Result := (vVal and vVal2);
end;

function TfrmPedidos.ProdutoValidadoParaInserir: Boolean;
var
  vVal,vVal2 : Boolean;
begin
  vVal := (edtCodProduto.Text <> '') and (edtCodProduto.Text <> '0');
  vVal2 := (edtVlrUnitarioProduto.Text <> '') and (edtQtdProduto.Text <> '');
  Result := (vVal and vVal2);
end;

procedure TfrmPedidos.sbAbrirPedidoClick(Sender: TObject);
begin
  CarregarPedidos;
end;

procedure TfrmPedidos.sbCancelarClick(Sender: TObject);
begin
  FormControl(sfsInicial);
  FPedidoVenda.Cancelar;
end;

procedure TfrmPedidos.sbGravarPedidoClick(Sender: TObject);
begin
  PedidoValidadoParaGravar;
end;

procedure TfrmPedidos.sbIniciarClick(Sender: TObject);
begin
  FormControl(sfsInserir);
  Iniciar;
end;

procedure TfrmPedidos.sbInserirProdutoClick(Sender: TObject);
begin
  //Gravar informações iniciais do pedido
  InserirPedido;
  //Somente inserir itens do pedido
  InserirPedidoProduto;
end;

procedure TfrmPedidos.SetEstadoForm(const Value: EnumFormState);
begin
  FEstadoForm := Value;
end;

procedure TfrmPedidos.SetPossuiItens(const Value: EnumItens);
begin
  FPossuiItens := Value;
end;

end.
