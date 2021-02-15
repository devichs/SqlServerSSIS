CREATE PROCEDURE [dbo].[InsertProc]
	@Name nvarchar(100),
	@Email varchar(150),
	@DateSaved date
AS
	Begin
		begin transaction
		 begin try
			insert into PersonTable(Name,Email,DateAdded)values(@Name,@Email,@DateSaved)
		 end try
		 begin catch
			select ERROR_MESSAGE()
			rollback transaction
		 end catch
		if @@TRANCOUNT > 0
			commit transaction
	end


