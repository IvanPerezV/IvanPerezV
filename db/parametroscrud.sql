USE [sisrecocoap]
GO

DECLARE	@return_value int,
		@o_numerror int

EXEC	@return_value = [dbo].[sp_socio_adm]
		@Cuenta = 1,
		@ApellidosNombres = N'Alberto Plaza',
		@CI = N'4020091',
		@Direccion = N'nose',
		@Celular = N'72330319',
		@FechaRegistro = '2/1/2021',
		@Activo = 1,
		@i_operacion = N'I',
		@o_numerror = @o_numerror OUTPUT

SELECT	@o_numerror as N'@o_numerror'

SELECT	'Return Value' = @return_value

GO
