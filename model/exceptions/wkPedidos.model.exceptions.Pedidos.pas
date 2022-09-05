unit wkPedidos.model.exceptions.Pedidos;

interface

uses System.SysUtils, Vcl.Dialogs, Vcl.Forms, System.UITypes;


type
  TPedidosExceptions = class
  private
    { private declarations }
    procedure Exceptions(Sender : TObject; E: Exception);
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
  end;

  var
    Exceptions : TPedidosExceptions;


implementation

{ TExceptions }

constructor TPedidosExceptions.Create;
begin
  Application.OnException := Exceptions;
end;

destructor TPedidosExceptions.Destroy;
begin

  inherited;
end;

procedure TPedidosExceptions.Exceptions(Sender: TObject; E: Exception);
begin
    MessageDlg(E.Message, mtWarning, [mbOK],0);
end;

initialization
  Exceptions := TPedidosExceptions.Create;

finalization
  Exceptions.DisposeOf;

end.
