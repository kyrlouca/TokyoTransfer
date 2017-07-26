unit M_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, DBAccess, IBC,
  Vcl.Grids, vcl.wwdbigrd, vcl.wwdbgrid, MemDS, Vcl.Buttons, Datasnap.Provider,
  Datasnap.DBClient, vcl.wwclient, VirtualTable, Vcl.DBCtrls, vcl.wwspeedbutton,
  vcl.wwdbnavigator, Vcl.ExtCtrls, vcl.wwclearpanel;

type
  TTableRec =record
    source:String;
    Dest:String;
  end;

  tArr=Tarray<TTableRec>;
  tNamePair = TArray<String>;
  tPairList = TArray<tNamePair>;

  TM_MainFRM = class(TForm)
    Button1: TButton;
    OldDb: TIBCConnection;
    NewDB: TIBCConnection;
    OldRead: TIBCTransaction;
    OldWrite: TIBCTransaction;
    NewRead: TIBCTransaction;
    NewWrite: TIBCTransaction;
    t1SRC: TIBCDataSource;
    wwDBGrid1: TwwDBGrid;
    BitBtn1: TBitBtn;
    sourceSQL: TIBCQuery;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1PriorPage: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1NextPage: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Edit: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Refresh: TwwNavButton;
    wwDBNavigator1SaveBookmark: TwwNavButton;
    wwDBNavigator1RestoreBookmark: TwwNavButton;
    Memo1: TMemo;
    destSQL: TIBCQuery;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cn:TIBCConnection;
  Function CopyDataset(Const sourceTable :string ; DestTable:String):integer;
  Function InsertDatasetRecord(SourceDataset,DestDataset:TIBCQuery):Boolean;
  Function MakeSQLInsertString(Table:TIBCquery):String;

  procedure ConnectToDatabase(dbConnection :TIBCConnection;FileName:String);
  public
    { Public declarations }
  end;

var
  M_MainFRM: TM_MainFRM;

implementation

{$R *.dfm}

uses G_KyrSQL;

procedure TM_MainFRM.BitBtn1Click(Sender: TObject);
begin
//DestSQL.Close;
//DestSQL.Close;
//DestSQL.Open;
destSQl.Close;
destSQl.Open;

end;

procedure TM_MainFRM.Button1Click(Sender: TObject);
var

  SourceArray: Array of String;
  DestArray : Array of String;
  i:Integer;
begin
  SourceArray:=['clearance_waiting_code','district'];


  ConnectToDatabase(OldDB,'DatabaseParamsOld.txt');
  ConnectToDatabase(NewDB,'DatabaseParamsNew.txt');
//  t1SQL.Close;
//  t1SQL.Open;
  for i:=0 to Length(SourceArray)-1 do begin
//   CopyDataset('clearance_waiting_code','clearance_waiting_code');
   CopyDataset(SourceArray[i],DestArray[i]);
  end;
end;



procedure TM_MainFRM.ConnectToDatabase(dbConnection :TIBCConnection;FileName:string);
Var
        FBClientPath:String;
        InFile:TextFile;
        LIne:String;
        ServerIP,DatabasePath:String;
        TextArray : Array [1..3] of String;
        I:Integer;

        LStrings: TStringList;
begin

//    FileName:= 'DatabaseParamsOld.txt';
    LStrings := TStringList.Create;
    try
      LStrings.Loadfromfile(FileName);
      if LStrings.Count<2 then begin
        raise exception.create('File Must contain at least 2 lines');
      end;
      ServerIP:=LStrings[0];
      DatabasePath:=LStrings[1];
    finally
      FreeAndNil(LStrings);
    end;

        dbConnection.Server:=ServerIP;
        dbConnection.database:=DatabasePath;

        FbClientPath:=ExtractFileDir( ExtractFilePath(Application.EXEName)  );
        FbClientPath:=FBClientPath+'\gds32.dll';

        dbConnection.ClientLibrary := FBClientPath;
        If dbConnection.connected then
                dbConnection.Disconnect;

        dbConnection.Connect;
        if not dbConnection.Connected then
                ShowMessage('Cannot connect');


End;



Function TM_MainFRM.InsertDatasetRecord(SourceDataset,DestDataset:TIBCQuery):Boolean;
Var
   SourceField,DestField:TField;
   DestFieldName:String;
   I:Integer;
   Fname:String;
   KeyValue:String;
begin

// Just copy one record from A clientdataset to the table
// Write in file the Serial Number of the key of the record fails . Key is parameter
// Write in file only if required. For example, mawbs are duplicate - same for many invoices
// Tables must be open


   DestDataset.Insert;
   For I := 0 to DestDataset.Fields.count-1 do begin
      DestField:=DestDataset.Fields[i];
      DestFieldName:=DestDataset.Fields[i].FieldName;
      SourceField:=SourceDataset.FindField(DestFieldName);
      If SourceField <> nil then begin
         DestField.value:=SourceField.value;
      end;

   end; // for
   try
     DestDataset.Post;
   Except
    DestDataset.Cancel;
    //do nothing
   end;


End;




Function TM_MainFRM.CopyDataset(Const sourceTable :string ; DestTable:String):integer;
Var
   Count:Integer;
   str:String;
begin

sourceSQL.Close;
//sourceSQL.ClearFields;
sourceSQL.SQL.Clear;
sourceSQL.SQL.Add('select * from ' + sourceTable);
sourceSQL.Open;

DestSQL.Close;
DestSQL.SQL.Clear;
DestSQL.SQL.Add('select * from '+DestTable);
DestSQL.UpdatingTable:=DestTable;
DestSQL.Open;

DestSQL.SQLInsert.Clear;
str:=MakeSQLInsertString(DestSQL);
memo1.Lines.Add(str);
DestSQL.SQLInsert.Add(str);

{
destSQL.SQLInsert.Clear;
destSQL.SQLInsert.Add('INSERT INTO CLEARANCE_WAITING_CODE '
+'  (CODE, DESCRIPTION, CODE_4, DEFAULT_FOR_MEDIUM_VALUE)'
+'   VALUES'
+'  (:CODE, :DESCRIPTION, :CODE_4, :DEFAULT_FOR_MEDIUM_VALUE)');
ShowMessage(destSQL.SQLInsert.Text);
}
Count:=0;

While (not  sourceSQL.Eof) do begin
//   showMessage(sourceSQL.Fields[0].AsString);
   InsertDatasetRecord(SourceSQL,DestSQL);
   Inc(Count);
   SourceSQL.Next;
end;
Result:=Count;

End;



procedure TM_MainFRM.FormCreate(Sender: TObject);
begin
cn:=NewDB;
end;

Function TM_MainFRM.MakeSQLInsertString(Table:TIBCquery):String;
var
  list:TStringList;
  listF:TstringList;
  i:integer;
  aField:TField;

begin
  try
    list:=TStringList.Create;
    listF:=TStringList.Create;
    For I := 0 to table.Fields.count-1 do begin
      aField:=Table.Fields[i];
      list.Add('  '+afIeld.FieldName);
      listf.Add('  :'+aField.FieldName);
    end;

    List.Delimiter := ',';
    list.QuoteChar := #0; // or
    Listf.Delimiter := ',';
    listf.QuoteChar := #0; // or
    result := 'insert into  '+ table.UpdatingTable +' ('+list.DelimitedText +' )'
      + ' values(' + listF.DelimitedText+ ' )';


  finally
    list.Free;
    listF.Free;
  end;




end;


end.
