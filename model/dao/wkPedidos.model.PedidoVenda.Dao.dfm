object PedidoVendaDao: TPedidoVendaDao
  OldCreateOrder = False
  Height = 537
  Width = 466
  object FDQuery1: TFDQuery
    Left = 295
    Top = 138
  end
  object MemPedido: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 104
    Top = 137
    object MemPedidoNumeroPedido: TIntegerField
      DisplayLabel = 'N'#176' Pedido'
      FieldName = 'NumeroPedido'
    end
    object MemPedidoDataEmissao: TDateTimeField
      DisplayLabel = 'Dta. Emiss'#227'o'
      FieldName = 'DataEmissao'
    end
    object MemPedidoCodigoCliente: TIntegerField
      DisplayLabel = 'C'#243'digo do Cliente'
      FieldName = 'CodigoCliente'
    end
    object MemPedidoValorTotal: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotal'
      currency = True
    end
  end
  object MemPedidoProdutos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 198
    Top = 137
    object MemPedidoProdutosAutoincrem: TIntegerField
      DisplayLabel = 'Seq.'
      FieldName = 'Autoincrem'
    end
    object MemPedidoProdutosNPedido: TIntegerField
      DisplayLabel = 'N'#176' Pedido'
      FieldName = 'NumeroPedido'
      Visible = False
    end
    object MemPedidoProdutosCodigoProduto: TIntegerField
      DisplayLabel = 'C'#243'd.Produto'
      FieldName = 'CodigoProduto'
    end
    object MemPedidoProdutosDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'Descricao'
      Size = 150
    end
    object MemPedidoProdutosQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object MemPedidoProdutosVlrUnitario2: TFloatField
      DisplayLabel = 'Vlr.Unit'#225'rio'
      FieldName = 'VlrUnitario'
    end
    object MemPedidoProdutosVlrTotal: TFloatField
      DisplayLabel = 'Vlr.Total'
      FieldName = 'VlrTotal'
      currency = True
    end
  end
  object FDStoredProc1: TFDStoredProc
    Connection = FDConnection1
    Left = 32
    Top = 137
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 53
    Top = 10
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=wkdb'
      'User_Name=root'
      'Password=Mysql@123'
      'DriverID=MySQL')
    LoginPrompt = False
    BeforeConnect = FDConnection1BeforeConnect
    Left = 56
    Top = 64
  end
  object dsMemPedidoProdutos: TDataSource
    DataSet = MemPedidoProdutos
    Left = 204
    Top = 200
  end
end
