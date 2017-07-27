unit M_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, DBAccess, IBC,
  Vcl.Grids, vcl.wwdbigrd, vcl.wwdbgrid, MemDS, Vcl.Buttons, Datasnap.Provider,
  Datasnap.DBClient, vcl.wwclient, VirtualTable, Vcl.DBCtrls, vcl.wwspeedbutton,
  vcl.wwdbnavigator, Vcl.ExtCtrls, vcl.wwclearpanel, vcl.wwDialog, vcl.Wwrcdvw,
  Vcl.Mask, vcl.Wwdbedit, vcl.Wwdotdot, vcl.Wwdbcomb, vcl.wwlocate;

type

  TM_MainFRM = class(TForm)
    Button1: TButton;
    OldDb: TIBCConnection;
    NewDB: TIBCConnection;
    OldRead: TIBCTransaction;
    OldWrite: TIBCTransaction;
    NewRead: TIBCTransaction;
    NewWrite: TIBCTransaction;
    TableSRC: TIBCDataSource;
    wwDBGrid1: TwwDBGrid;
    sourceSQL: TIBCQuery;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Edit: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Refresh: TwwNavButton;
    destSQL: TIBCQuery;
    RecView: TwwRecordViewDialog;
    MetaSQL: TIBCMetaData;
    TableFLD: TwwDBComboBox;
    TableSQL: TIBCTable;
    loc1: TwwLocateDialog;
    wwDBNavigator1FilterDialog: TwwNavButton;
    wwDBNavigator1LocateDialog: TwwNavButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TableFLDCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    cn:TIBCConnection;
  Function CopyDataset(Const sourceTable :string ; DestTable:String):integer;
  Function InsertDatasetRecord(SourceDataset,DestDataset:TIBCQuery):Boolean;
  Function MakeSQLInsertString(Table:TIBCquery):String;
  procedure GetTableNames;

  procedure ConnectToDatabase(dbConnection :TIBCConnection;FileName:String);
  public
    { Public declarations }
  end;

var
  M_MainFRM: TM_MainFRM;

implementation

{$R *.dfm}

uses G_KyrSQL;

procedure TM_MainFRM.GetTableNames;
begin
MetaSQL.Close;
TableFLD.Clear;
TableFLD.Items.Clear;

//memo1.Clear;
//    MetaSQL.MetaDataKind := 'IndexColumns';
//    MetaSQL.Restrictions.Values['INDEX_NAME'] := ts;
    MetaSQL.MetaDataKind := 'Tables';
    MetaSQL.Open;
    while not MetaSQL.Eof do begin
      tableFLD.Items.Add(MetaSQL.FieldByName('TABLE_NAME').AsString);
//      Memo1.Lines.Add(MetaSQL.FieldByName('TABLE_NAME').AsString);
      MetaSQL.Next;
    end;

end;

procedure TM_MainFRM.Button1Click(Sender: TObject);
var

  SourceArray: Array of String;
  DestArray : Array of String;
  i:Integer;
begin
 SourceArray   :=[
'COUNTRY',
'VAT_CATEGORY',
'EXCISE_CATEGORY',
//'DUTY_TYPE',
'EXCHANGE_RATE',
'CURRENCY',
'DELIVERY_TERM',
'FLIGHT_NUMBERS',
'PORT',
'CLEARANCE_WAITING_CODE',
'IMPORT_TYPE',
'GENERAL_PARAMETER',
'DISTRICT',
'SYSTEM_PARAMETERS',
'EMAIL_MESSAGE',
'SECURITY_SCREEN',
'SECURITY_USER',
'SECURITY_USER_SCREEN',
//'CUSTOMER',
'USER_STATION'

];


  ConnectToDatabase(OldDB,'DatabaseParamsOld.txt');
  ConnectToDatabase(NewDB,'DatabaseParamsNew.txt');
//  t1SQL.Close;
//  t1SQL.Open;
  for i:=0 to Length(SourceArray)-1 do begin
//   CopyDataset('clearance_waiting_code','clearance_waiting_code');
   CopyDataset(SourceArray[i],SourceArray[i]);
  end;
  ksExecSQL(cn,'update CLEARANCE_WAITING_CODE set code= Code_4',[]);
  ksExecSQL(cn,'update CUSTOMER set  ADDRESS_POST_CODE=aDDRESS2, ADDRESS_CITY=ADDRESS3, ADDRESS_COUNTRY=''CYPRUS'' ',[]);
  //customers
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

DestSQL.Close;
DestSQL.SQL.Clear;
DestSQL.SQL.Add('select * from '+DestTable);
DestSQL.UpdatingTable:=DestTable;

try
  sourceSQL.Open;
  DestSQL.Open;

except
  ShowMessage('cannot open source or dest table: '+ sourceTable);
  sourceSQL.Close;
  destSQL.Close;
  exit;
end;


DestSQL.SQLInsert.Clear;
str:=MakeSQLInsertString(DestSQL);
//memo1.Lines.Add(str);
DestSQL.SQLInsert.Add(str);

Count:=0;
While (not  sourceSQL.Eof) do begin
//   showMessage(sourceSQL.Fields[0].AsString);
   InsertDatasetRecord(SourceSQL,DestSQL);
   Inc(Count);
   SourceSQL.Next;
end;
Result:=Count;

End;



procedure TM_MainFRM.FormActivate(Sender: TObject);
begin
GetTableNames;
end;

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


procedure TM_MainFRM.TableFLDCloseUp(Sender: TwwDBComboBox; Select: Boolean);
var
tablename:String;
begin

 tableName:=sender.Value;

if tableName>'' then begin
  TableSQL.Close;
  TableSQL.TableName:=tablename;
  TableSQL.Open;
  RecView.Caption:=  tableName;
  RecView.Execute;
end;
end;

end.