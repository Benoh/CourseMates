USE [CourseMates]
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertAction]    Script Date: 05/13/2013 16:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_InsertAction]
	-- Add the parameters for the stored procedure here
	@UserID int  = null,
	@Action int = null
	as 
begin
	    insert INTO CourseMates.dbo.tblAction VALUES (@UserID,@Action,0)
END
