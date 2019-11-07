codeunit 50002 TestRunnerSaturday
{
    // version Dynamics Saturday2018, Test

    Subtype = TestRunner;
    TestIsolation = Codeunit;

    trigger OnRun();
    var        
        
    begin
        CODEUNIT.RUN(50001);
    end;
}

