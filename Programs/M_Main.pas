unit M_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, DBAccess, IBC,
  Vcl.Grids, vcl.wwdbigrd, vcl.wwdbgrid, MemDS, Vcl.Buttons, Datasnap.Provider,
  Datasnap.DBClient, vcl.wwclient, VirtualTable, Vcl.DBCtrls, vcl.wwspeedbutton,
  vcl.wwdbnavigator, Vcl.ExtCtrls, vcl.wwclearpanel, vcl.wwDialog, vcl.Wwrcdvw,
  Vcl.Mask, vcl.Wwdbedit, vcl.Wwdotdot, vcl.Wwdbcomb, vcl.wwlocate, RzLabel,
  Vcl.ComCtrls, vcl.wwriched, vcl.wwbutton, RzEdit;

type

  TM_MainFRM = class(TForm)
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
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    RzLabel2: TRzLabel;
    Inititial: TwwDBRichEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    RzMemo1: TRzMemo;
    wwButton1: TwwButton;
    DaysFLD: TwwDBEdit;
    RzLabel1: TRzLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TableFLDCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure wwButton1Click(Sender: TObject);
  private
    { Private declarations }
    cnNew,cnOld:TIBCConnection;
  Function CopyDataset(Const sourceTable :string ; DestTable:String):integer;
  Function InsertDatasetRecord(SourceDataset,DestDataset:TIBCQuery):Boolean;
  Function MakeSQLInsertString(Table:TIBCquery):String;
  procedure GetTableNames;
  Procedure CopyTariffs;
  Procedure InsertTariffLine(tariffCode:String);
  Function GenLineSerial:Integer;

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

procedure TM_MainFRM.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TM_MainFRM.Button1Click(Sender: TObject);
var

  SourceArray, SS: Array of String;
  DestArray : Array of String;
  i:Integer;
begin
SOURCEaRRAY:=['customer'];
 SS   :=[
'COUNTRY',
//'VAT_CATEGORY',
'EXCISE_CATEGORY',
//'TARIFF_CERTIFICATE',
//'DUTY_TYPE',
'EXCHANGE_RATE',
'CURRENCY',
'DELIVERY_TERM',
'FLIGHT_NUMBERS',
'PORT',
'CLEARANCE_WAITING_CODE',
'IMPORT_TYPE',
//'CUSTOMS_HAWB_TYPE',
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

 ksExecSQL(cnNew,'delete from CLEARANCE_WAITING_CODE',[]);

  for i:=0 to Length(SourceArray)-1 do begin
//   CopyDataset('clearance_waiting_code','clearance_waiting_code');
   CopyDataset(SourceArray[i],SourceArray[i]);
  end;

  ksExecSQL(cnNew,'update CLEARANCE_WAITING_CODE set code= Code_4',[]);
  ksExecSQL(cnNew,'update CUSTOMER set  ADDRESS_POST_CODE=aDDRESS2, ADDRESS_CITY=ADDRESS3, ADDRESS_COUNTRY=''CYPRUS'' ',[]);

  ShowMessage('finished');
  //customers
end;



procedure TM_MainFRM.Button2Click(Sender: TObject);
begin
 CopyTariffs;
 ShowMessage('tariffs updated');
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

        If dbConnection.connected then
                dbConnection.Disconnect;

        dbConnection.Server:=ServerIP;
        dbConnection.database:=DatabasePath;

        FbClientPath:=ExtractFileDir( ExtractFilePath(Application.EXEName)  );
        FbClientPath:=FBClientPath+'\gds32.dll';

        dbConnection.ClientLibrary := FBClientPath;

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
  ConnectToDatabase(OldDB,'DatabaseParamsOld.txt');
  ConnectToDatabase(NewDB,'DatabaseParamsNew.txt');
cnNew:=NewDB;
CnOld:=OldDb;
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

procedure TM_MainFRM.wwButton1Click(Sender: TObject);
var
  qr:TksQuery;
  serial:Integer;
  Name:String;
  str:string;
  strCount:String;
  Days:Integer;

begin
  Days := StrToIntDef(daysFLD.Text,48);
  if Days <50 then begin
    ShowMessage('cannot be less than 50');
    exit;
  end;

  StrCount:=
' select Count(*) as cnt from'
+' (select'
+'     code, cu.name'
+'     ,ha.hab_id , ha.date_invoiced, ha.date_cleared'
+'     ,(''now''-date_cleared ) as daysPassed'
+' from customer cu'
+' left outer join hawb ha on ha.fk_customer_code = cu.code'
+' ) as lol'
+' where  (daysPassed > :days ) or (hab_id is null)';


  str:=
' select code, hab_id, daysPassed from'
+' (select'
+'     code, cu.name'
+'     ,ha.hab_id , ha.date_invoiced, ha.date_cleared'
+'     ,(''now''-date_cleared ) as daysPassed'
+' from customer cu'
+' left outer join hawb ha on ha.fk_customer_code = cu.code'
+' ) as lol'
+' where daysPassed > 50 and (daysPassed > :days ) or (hab_id is null)';

//  showMessage(cnOld.Database);
  qr:=TksQuery.Create(cnOld,strCount);
  try
    qr.ParamByName('Days').Value:=Days;
    qr.Open;
    serial:=qr.FieldByName('cnt').asInteger;
  finally
    qr.Free;
  end;

  if MessageDlg(IntToStr(serial)+'  Customers will be Deleted.'+#13+#10+'Proceed?', mtWarning, [ mbNo,mbYes], 0)=mrNo then begin
    exit;
  end;

//  SHowMessage('Deleting now');

  qr:=TksQuery.Create(cnOld,str);
  try
    qr.ParamByName('Days').Value:=Days;
    qr.Open;
    while not qr.Eof do begin
      serial:=qr.FieldByName('code').AsInteger;
      name:=qr.FieldByName('Hab_id').AsString;
//      showMessage(inttoStr(serial)+'--'+name);
      ksExecSQL(cnNew,'delete from customer where code = :serial',[IntToStr(Serial)]);
      qr.Next;
    end;
  finally
    qr.Free;
  end;

end;

Procedure TM_MainFRM.CopyTariffs;
Var
   SourceField,DestField:TField;
   DestFieldName:String;
   I:Integer;
   Fname:String;
   TariffCode:String;
   TarSQL:TksQuery;
   DestSQL:TksQuery;
begin
//  TarSQL:= TksQuery.Create(oldDB,'select * from Tariff WHERE CODE STARTING WITH :TAR'); //for testing
//  TarSQL.ParamByName('tar').Value:= '1515  90 39';
  TarSQL:= TksQuery.Create(oldDB,'select * from Tariff');
  DestSQL:= TksQuery.Create(NewDB,'select * from S_Tariff');
  try
    DestSQL.Open;
    TarSQL.Open;
    while not TarSQL.Eof do begin
      try


        DESTsql.Insert;
        TariffCode:=TarSQL.FieldByName('code').AsString;

        DestSQL.FieldByName('Tariff_code').Value:=TariffCode;
        DestSQL.FieldByName('fk_Tariff_Usage').Value:='TRF';
        DestSQL.FieldByName('FK_VAT_code').Value:='V01';
        DestSQL.FieldByName('DESCRIPTION').Value:=TarSQL.FieldByName('User_keyword').AsString;
        DestSQL.FieldByName('DESCRIPTION_greek').Value:='';
        DestSQL.FieldByName('ACTIVE').Value:='Y';
        DestSQL.FieldByName('user_kEYWORD').Value:=TarSQL.FieldByName('user_kEYWORD').AsString;
        DestSQL.FieldByName('VAT_APPLIES').Value:='Y';
        dESTsql.Post;
      except
        destSQL.Cancel;
        tarSQL.Next;
        continue;
      end;
      InsertTariffLine(TariffCode);

      TarSQL.Next;
    end;
  finally
    TarSQL.Free;
  end;
end;



Procedure TM_MainFRM.InsertTariffLine(tariffCode:String);
var
  tarSQL:TksQuery;
  ImpLineSQL:TksQuery;
  ExcLineSQL:TksQuery;
  Linestr:string;
begin

  lineStr:= 'SELECT a.FK_S_TARIFF_CODE, a.SERIAL_NUMBER, a.DUTY_TYPE, a.FK_BASE, a.DESCRIPTION, a.TARIFF_UNIT, a.TARIFF_UNIT_INCREMENT, a.TARIFF_UNIT_RATE, a.CAN_BE_RELIEVED, a.CHARGING_METHOD, a.UNITS_NOT_CHARGED, a.MIN_CHARGE, a.MAX_CHARGE, a.XML_CODE'
  +' FROM S_TARIFF_LINE a where a.FK_S_Tariff_code = ''-1'' ';


 TarSQL:= TksQuery.Create(oldDB,'select * from Tariff WHERE Code= :tariffCode');
 ImplineSQL:= TksQuery.Create(NewDB,LineStr);
 ExclineSQL:= TksQuery.Create(NewDB,LineStr);

 try
    TarSQL.paramByName('tariffCode').Value:= TariffCode;
    TarSQL.Open;
    ImplineSQL.Open;
    ExclineSQL.Open;
    if TarSQL.IsEmpty then
      exit;
    try
      ImplineSQL.Insert;
      ImplineSQL.FieldByName('SERIAL_NUMBER').Value:= GenLineSerial;
      ImplineSQL.FieldByName('fk_s_tariff_code').Value:= TariffCode;
      ImplineSQL.FieldByName('DUTY_TYPE').Value:='IMP';
      ImplineSQL.FieldByName('description').Value:='Default Import Duty';
      ImplineSQL.FieldByName('TARIFF_UNIT_RATE').Value:=tarSQL.FieldByName('GENERAL_DUTY_RATE').AsFloat;
      ImplineSQL.FieldByName('CAN_BE_RELIEVED').Value:='Y';
      ImplineSQL.FieldByName('CHARGING_METHOD').Value:='VA';
      ImplineSQL.Post;
    except
      ImplineSQL.Cancel;
    end;

    try
      ExclineSQL.Insert;
      ExclineSQL.FieldByName('SERIAL_NUMBER').Value:= GenLineSerial;
      ExclineSQL.FieldByName('fk_s_tariff_code').Value:= TariffCode;
      ExclineSQL.FieldByName('DUTY_TYPE').Value:='EXC';
      ExclineSQL.FieldByName('description').Value:='Zero Excise';
      ExclineSQL.FieldByName('TARIFF_UNIT_RATE').Value:=0;
      ExclineSQL.FieldByName('CAN_BE_RELIEVED').Value:='Y';
      ExclineSQL.FieldByName('CHARGING_METHOD').Value:='VA';
      ExclineSQL.Post;
    except
      ExclineSQL.Cancel;
    end;

 finally
    TarSQL.Free;
    ImplineSQL.Free;
    ExclineSQL.Free;
 end;

End;



Function TM_MainFRM.GenLineSerial:Integer;
var
 genSQL:TksQuery;
begin
 result:=0;
 genSQL:=TksQuery.Create(newDb,'SELECT NEXT VALUE FOR GEN_S_TARIFF_LINE FROM RDB$DATABASE');
 try
  GenSQL.Open;
  result:=genSQL.FieldByName('GEN_ID').AsInteger;
 finally
  GenSQL.Free;
 end;

end;


end.
