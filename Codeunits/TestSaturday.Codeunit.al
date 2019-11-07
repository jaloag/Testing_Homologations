codeunit 50000 TestSaturday1
{
    // version Dynamics Saturday2018, Test

    Subtype = Test;
    
        
    trigger OnRun();
    begin
    end;

    [Test]    
    procedure Test01();  
    var txt:Text[250];
    begin
        
    end;

    [Test]
    procedure Test02();
    begin
        ERROR('Esto es un error');
    end;

    [Test]
    procedure Test03();
    begin
        ASSERTERROR ERROR('Esto es un error');
    end;

    [MessageHandler]
    procedure Messagehandler(Message:Text[1024])
    begin
        
    end;
}

