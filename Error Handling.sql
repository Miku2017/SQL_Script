
  -- Error Handling

CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorNumber] [int] NULL,
	[ErrorLine] [varchar](10) NULL,
	[Errorstate] [varchar](10) NULL,
	[ErrorProcedure] [varchar](25) NULL,
	[ErrorSeverity] [varchar](25) NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[ErrorDatetime] [datetime2](7) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime2](7) NULL,
	Constraint PK_ErrorLog_ErrorLogID Primary Key ([ErrorLogID])
) ;

Create procedure dbo.P-- Proname 
AS 
SET NOCOUNT ON  

Begin Tran 
   Begin Try 
      --  SQL DML STATMENT
Commit Tran 
   End try 

Begin catch
      --- Insert into Error log statement 

	 IF (XACT_STATE())=-1
	     Rollback Tran

	 IF (XACT_STATE())=1
	     Commit Tran 
End Catch ;