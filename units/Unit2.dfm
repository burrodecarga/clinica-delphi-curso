object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 309
  Width = 559
  object conexion: TFDConnection
    Params.Strings = (
      'DriverID=MSAcc')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FQuery: TFDQuery
    Connection = conexion
    Left = 112
    Top = 24
  end
  object Contador: TFDQuery
    Connection = conexion
    Left = 200
    Top = 16
  end
  object FDQueryEnfermedades: TFDQuery
    Connection = conexion
    Left = 32
    Top = 88
  end
  object FDQuerySintomas: TFDQuery
    Connection = conexion
    Left = 392
    Top = 24
  end
  object FDQueryRel: TFDQuery
    Connection = conexion
    Left = 288
    Top = 24
  end
  object FDQueryPivot: TFDQuery
    Connection = conexion
    Left = 152
    Top = 88
  end
  object FDQueryMedicinas: TFDQuery
    Connection = conexion
    Left = 272
    Top = 96
  end
  object FDQueryLaboratorios: TFDQuery
    Connection = conexion
    Left = 392
    Top = 96
  end
  object FDQueryEntrevistas: TFDQuery
    Connection = conexion
    Left = 40
    Top = 176
  end
  object FDQueryComentarios: TFDQuery
    Connection = conexion
    Left = 160
    Top = 176
  end
  object FDQueryDiagnosticos: TFDQuery
    Connection = conexion
    Left = 272
    Top = 176
  end
  object FDQueryTratamientos: TFDQuery
    Connection = conexion
    Left = 368
    Top = 168
  end
  object FDQueryDiccionario: TFDQuery
    Connection = conexion
    Left = 464
    Top = 168
  end
  object FDQueryArchivos: TFDQuery
    Connection = conexion
    Left = 376
    Top = 232
  end
  object FQueryInformes: TFDQuery
    Connection = conexion
    Left = 200
    Top = 240
  end
end
