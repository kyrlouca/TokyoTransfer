object M_MainFRM: TM_MainFRM
  Left = 0
  Top = 0
  Caption = 'M_MainFRM'
  ClientHeight = 601
  ClientWidth = 1022
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel2: TRzLabel
    Left = 280
    Top = 16
    Width = 43
    Height = 13
    Caption = 'RzLabel2'
  end
  object wwDBGrid1: TwwDBGrid
    Left = 8
    Top = 432
    Width = 625
    Height = 120
    IniAttributes.Delimiter = ';;'
    IniAttributes.UnicodeIniFile = False
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = TableSRC
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object wwDBNavigator1: TwwDBNavigator
    Left = 8
    Top = 292
    Width = 250
    Height = 25
    DataSource = TableSRC
    RepeatInterval.InitialDelay = 500
    RepeatInterval.Interval = 100
    Visible = False
    object wwDBNavigator1Prior: TwwNavButton
      Left = 0
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Move to prior record'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1Prior'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 0
      Style = nbsPrior
    end
    object wwDBNavigator1Next: TwwNavButton
      Left = 25
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Move to next record'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1Next'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 1
      Style = nbsNext
    end
    object wwDBNavigator1Insert: TwwNavButton
      Left = 50
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Insert new record'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1Insert'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 2
      Style = nbsInsert
    end
    object wwDBNavigator1Delete: TwwNavButton
      Left = 75
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Delete current record'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1Delete'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 3
      Style = nbsDelete
    end
    object wwDBNavigator1Edit: TwwNavButton
      Left = 100
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Edit current record'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1Edit'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 4
      Style = nbsEdit
    end
    object wwDBNavigator1Post: TwwNavButton
      Left = 125
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Post changes of current record'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1Post'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 5
      Style = nbsPost
    end
    object wwDBNavigator1Cancel: TwwNavButton
      Left = 150
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Cancel changes made to current record'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1Cancel'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 6
      Style = nbsCancel
    end
    object wwDBNavigator1Refresh: TwwNavButton
      Left = 175
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Refresh the contents of the dataset'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1Refresh'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 7
      Style = nbsRefresh
    end
    object wwDBNavigator1FilterDialog: TwwNavButton
      Left = 200
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Filter the dataset'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1FilterDialog'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 8
      Style = nbsFilterDialog
    end
    object wwDBNavigator1LocateDialog: TwwNavButton
      Left = 225
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Locate a specific record'
      ImageIndex = -1
      NumGlyphs = 2
      Spacing = 4
      Transparent = False
      Caption = 'wwDBNavigator1LocateDialog'
      Enabled = False
      DisabledTextColors.ShadeColor = clGray
      DisabledTextColors.HighlightColor = clBtnHighlight
      Index = 9
      Style = nbsLocateDialog
    end
  end
  object TableFLD: TwwDBComboBox
    Left = 8
    Top = 405
    Width = 121
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = False
    AllowClearKey = False
    DropDownCount = 8
    ItemHeight = 0
    Sorted = False
    TabOrder = 2
    UnboundDataType = wwDefault
    OnCloseUp = TableFLDCloseUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1022
    Height = 53
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 1014
      Height = 45
      Align = alClient
      Alignment = taCenter
      Caption = 'Update New Database Param Tables'
      Layout = tlCenter
      ExplicitWidth = 473
      ExplicitHeight = 32
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 558
    Width = 1022
    Height = 43
    Align = alBottom
    TabOrder = 4
    object BitBtn1: TBitBtn
      Left = 7
      Top = 4
      Width = 89
      Height = 34
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFF0004450004450004450004450004450004450004450004450004450004
        45000445000445000445000445000445000445000445000445FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000A4D3461A53F70B44B7DC15789CE5F91D66396DB
        6396DB6396DB6598DD6295DA6295DA5D90D55688CD4C7EC24374B83765A9000A
        4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0011563B6DB14174B84B7EC256
        89CE5E91D66396DB6396DB6396DB6598DD6295DA6295DA5D90D55689CE4D80C4
        4477BB3E70B4001156FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0018613869
        AE3366A72B5EA22B5EA22B5EA22B5EA22B5EA2497CCE6396DB3164A52B5EA22B
        5EA22B5EA22B5EA22D60A43869AE001861FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF001F6A3A6CB02C5FA32B5EA22B5EA22B5EA22B5EA22B5EA24779CA6093
        D8295CA02B5EA22B5EA22B5EA22B5EA22E61A53A6CB0001F6AFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF00226D3B6DB128579B2B5EA22B5EA22B5EA22B5EA2
        2B5EA24274C45B8ED42554982B5EA22B5EA22B5EA22B5EA22E61A53B6DB10022
        6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0024703D6FB42451952B5EA22B
        5EA22B5EA22B5EA22B5EA23F70BE578ACF214E922B5EA22B5EA22B5EA22B5EA2
        2E61A53D6FB4002470FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0026723E70
        B51E498E2A5CA02B5EA22B5EA22B5EA22B5EA23B6BB95285CB1D478C2A5CA02B
        5EA22B5EA22B5EA22D60A43E70B5002672FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0028754072B7183F842451962B5EA22B5EA22B5EA22B5EA23766B44E81
        C7173D812451962B5EA22B5EA22B5EA22D60A44072B7002875FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF002A784274B9133479193F84224F9328599D2B5EA2
        2B5EA23463AF4A7DC2113176193F84224F9328599D2B5EA22E61A54274B9002A
        78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF002C7A4376BB0C296F0F307415
        3A7E1A43871D488C214F933261AD487BC00B276B0F3074153A7E1A43871D488C
        2451964376BB002C7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF002E7D4578
        BD477ABF477ABF477ABF477ABF477ABF477ABF477ABF477ABF477ABF477ABF47
        7ABF477ABF477ABF142669142669002E7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF002F7F477ABF3260AC3260AC3160AC325FAB325FAC3160AB3463AE477A
        BF3260AC3260AC3160AB325FAC3160AB3166B45287D1002F7FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF003182497CC13265A6285B9F285B9F285B9F285B9F
        285B9F3462AF4A7DC22E61A2285B9F285B9F285B9F285B9F70A3EB84B7FC0031
        82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0033844B7EC3295CA0275A9E27
        5A9E275A9E275A9E275A9E3A6AB85184CA26589C275A9E275A9E275A9E275A9E
        2B5EA24B7EC3003384FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0035864D80
        C525549826599D26599D26599D26599D26599D4172C2598CD2214F9326599D26
        599D26599D26599D2B5EA24D80C5003586FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0036894E81C7204D9125589C25589C25589C25589C25589C497BCE6295
        DB1D488C25589C25589C25589C25589C2A5DA14E81C7003689FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF00388B5083C91C458A23559924579B24579B24579B
        24579B5286DC6C9FE518418423559924579B24579B24579B295CA05083C90038
        8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00398C5084CA163C7F1D4A8D23
        569A23569A23569A23569A5B90E675A8ED1337791D4A8D23569A23569A23569A
        295CA05084CA00398CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003B8E5286
        CC0F2F7213397A1A478A1F5094225599225599629AF17DB0F50C2A6B13397A1A
        478A1F5094225599285B9F5286CC003B8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF003C905387CD0A266A0C2869123576153D7F1942851C488B67A0F882B5
        FA0722620C2A6B123576153D7F174083214E925387CD003C90FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF003D91598DD25F92D7699CE174A7EC7DB0F584B7FC
        84B7FC84B7FC82B5FA82B5FA82B5FA7CAFF473A6EB6A9DE26194D95B8FD4003D
        91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003E935085CC5D91D7689CE173
        A6EC7EB1F684B7FC84B7FC84B7FC82B5FA82B5FA82B5FA7BAEF373A6EC699DE2
        6093D95388CF003E93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003F94003F
        94003F94003F94003F94003F94003F94003F94003F94003F94003F94003F9400
        3F94003F94003F94003F94003F94003F94FFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object Button1: TButton
      Left = 233
      Top = 4
      Width = 150
      Height = 34
      Caption = 'Copy Tables'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 436
      Top = 4
      Width = 133
      Height = 34
      Caption = 'Copy Tariffs'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object wwDBRichEdit1: TwwDBRichEdit
    Left = 8
    Top = 100
    Width = 641
    Height = 253
    AutoURLDetect = False
    Font.Charset = GREEK_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GutterWidth = 3
    HideSelection = False
    ParentFont = False
    PrintJobName = 'TokyoTransfer - RAD Studio 10.2 - M_Main'
    ReadOnly = True
    TabOrder = 5
    EditorOptions = [reoShowSaveExit, reoShowPrint, reoShowPrintPreview, reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoShowRuler, reoShowInsertObject, reoCloseOnEscape, reoFlatButtons, reoShowSpellCheck, reoShowMainMenuIcons, reoShowZoomCombo]
    EditorCaption = 'Edit Rich Text'
    EditorPosition.Left = 0
    EditorPosition.Top = 0
    EditorPosition.Width = 0
    EditorPosition.Height = 0
    MeasurementUnits = muInches
    PrintMargins.Top = 1.000000000000000000
    PrintMargins.Bottom = 1.000000000000000000
    PrintMargins.Left = 1.000000000000000000
    PrintMargins.Right = 1.000000000000000000
    PrintHeader.VertMargin = 0.500000000000000000
    PrintHeader.Font.Charset = DEFAULT_CHARSET
    PrintHeader.Font.Color = clWindowText
    PrintHeader.Font.Height = -11
    PrintHeader.Font.Name = 'Tahoma'
    PrintHeader.Font.Style = []
    PrintFooter.VertMargin = 0.500000000000000000
    PrintFooter.Font.Charset = DEFAULT_CHARSET
    PrintFooter.Font.Color = clWindowText
    PrintFooter.Font.Height = -11
    PrintFooter.Font.Name = 'Tahoma'
    PrintFooter.Font.Style = []
    DoubleBuffered = False
    ParentDoubleBuffered = False
    RichEditVersion = 2
    Data = {
      B70200007B5C727466315C616E73695C616E7369637067313235335C64656666
      305C6465666C616E67313033327B5C666F6E7474626C7B5C66305C666E696C5C
      666368617273657430205461686F6D613B7D7B5C66315C666E696C5C66636861
      72736574313631205461686F6D613B7D7D0D0A5C766965776B696E64345C7563
      315C706172645C6C616E67313033335C66305C66733234204261636B7570204F
      6C642044617461626173655C7061720D0A437265617465204E657720456D7074
      792044617461626173655C7061720D0A5C7061720D0A5C6C616E67313033325C
      663120656469742066696C65203A204461746162617365506172616D732E7478
      745C7061720D0A5C6C616E67313033335C66302052756E20546F6B796F204361
      6220746F20696E73657274206261736963207461626C652076616C7565735C70
      61720D0A5C6C616E67313033325C66315C7061720D0A656469742066696C6520
      3A204461746162617365506172616D734F6C642E7478745C7061720D0A5C6C61
      6E67313033335C663020656469742066696C65203A2044617461626173655061
      72616D734E65772E7478745C7061720D0A52756E205472616E73666572205C70
      61720D0A5C7061720D0A52657669657720205641545F43415445474F52592C20
      456D61696C5F7265636F7264735C7061720D0A7365742044656661756C742057
      616974696E6720526561736F6E20666F72204D656469756D2056616C75655C70
      61720D0A5C7061720D0A436865636B5C7061720D0A47454E2076616C75657320
      666F7220696E766F6963652C206D6177622C20637573746F6D657220616E6420
      6576656E20686177625C7061720D0A47656E2076616C7565206F662063757374
      6F6D657220616674657220696E736572742121215C7061720D0A5C7061720D0A
      5C6C616E67313033325C66315C667331365C7061720D0A7D0D0A00}
  end
  object Button2: TButton
    Left = 368
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 6
    OnClick = Button2Click
  end
  object OldDb: TIBCConnection
    Database = 'C:\Data\DelphiProjects\Databases\TokyoTransfer\CABDB.FDB'
    Options.KeepDesignConnected = False
    DefaultTransaction = OldRead
    SQLDialect = 1
    ClientLibrary = 'C:\Data\DelphiProjects\TokyoTransfer\Programs\GDS32.DLL'
    Port = '3050'
    Username = 'SYSDBA'
    Server = 'localHost'
    Connected = True
    LoginPrompt = False
    Debug = True
    Left = 64
    Top = 16
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object NewDB: TIBCConnection
    Database = 'C:\Data\DelphiProjects\Databases\TokyoTransfer\TOKYOTARIFFDB.FDB'
    Options.KeepDesignConnected = False
    DefaultTransaction = NewRead
    ClientLibrary = 'C:\Data\DelphiProjects\TokyoTransfer\Programs\GDS32.DLL'
    Port = '3050'
    Username = 'SYSDBA'
    Server = 'localHost'
    Connected = True
    LoginPrompt = False
    Debug = True
    Left = 120
    Top = 32
    EncryptedPassword = '92FF9EFF8CFF8BFF9AFF8DFF94FF9AFF86FF'
  end
  object OldRead: TIBCTransaction
    DefaultConnection = OldDb
    IsolationLevel = iblReadOnlyReadCommitted
    Left = 24
    Top = 304
  end
  object OldWrite: TIBCTransaction
    DefaultConnection = OldDb
    Left = 64
    Top = 304
  end
  object NewRead: TIBCTransaction
    DefaultConnection = NewDB
    IsolationLevel = iblReadOnlyReadCommitted
    Left = 152
    Top = 336
  end
  object NewWrite: TIBCTransaction
    DefaultConnection = NewDB
    Left = 200
    Top = 328
  end
  object TableSRC: TIBCDataSource
    DataSet = TableSQL
    Left = 424
    Top = 240
  end
  object sourceSQL: TIBCQuery
    LocalUpdate = True
    Connection = OldDb
    Transaction = OldRead
    UpdateTransaction = OldWrite
    Left = 200
    Top = 32
  end
  object destSQL: TIBCQuery
    SQLDelete.Strings = (
      '')
    SQLUpdate.Strings = (
      '')
    SQLRecCount.Strings = (
      '')
    Connection = NewDB
    Transaction = NewRead
    UpdateTransaction = NewWrite
    Left = 264
    Top = 32
  end
  object RecView: TwwRecordViewDialog
    DataSource = TableSRC
    FormPosition.Left = 0
    FormPosition.Top = 0
    FormPosition.Width = 0
    FormPosition.Height = 0
    NavigatorButtons = [nbsFirst, nbsPrior, nbsNext, nbsLast, nbsInsert, nbsDelete, nbsEdit, nbsPost, nbsCancel, nbsRefresh, nbsLocateDialog]
    ControlOptions = []
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Caption = 'Record View'
    NavigatorFlat = True
    Navigator = wwDBNavigator1
    Left = 608
    Top = 152
  end
  object MetaSQL: TIBCMetaData
    Active = True
    MetaDataKind = 'Tables'
    Connection = NewDB
    Left = 392
    Top = 88
  end
  object TableSQL: TIBCTable
    Connection = NewDB
    Transaction = NewRead
    UpdateTransaction = NewWrite
    Left = 320
    Top = 232
  end
  object loc1: TwwLocateDialog
    Caption = 'Locate Field Value'
    DataSource = TableSRC
    MatchType = mtPartialMatchStart
    CaseSensitive = False
    SortFields = fsSortByFieldName
    DefaultButton = dbFindNext
    FieldSelection = fsAllFields
    ShowMessages = True
    Left = 472
    Top = 88
  end
end
