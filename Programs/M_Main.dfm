object M_MainFRM: TM_MainFRM
  Left = 0
  Top = 0
  Caption = 'M_MainFRM'
  ClientHeight = 437
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
  object Button1: TButton
    Left = 555
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 0
    OnClick = Button1Click
  end
  object wwDBGrid1: TwwDBGrid
    Left = 32
    Top = 272
    Width = 609
    Height = 120
    IniAttributes.Delimiter = ';;'
    IniAttributes.UnicodeIniFile = False
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = TableSRC
    TabOrder = 1
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
    Left = 32
    Top = 169
    Width = 250
    Height = 25
    DataSource = TableSRC
    RepeatInterval.InitialDelay = 500
    RepeatInterval.Interval = 100
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
    Left = 32
    Top = 245
    Width = 121
    Height = 21
    ShowButton = True
    Style = csDropDown
    MapList = False
    AllowClearKey = False
    DropDownCount = 8
    ItemHeight = 0
    Sorted = False
    TabOrder = 3
    UnboundDataType = wwDefault
    OnCloseUp = TableFLDCloseUp
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
    Left = 216
    Top = 224
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
    Left = 56
    Top = 112
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
    Left = 288
    Top = 224
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
    Left = 544
    Top = 176
  end
end
