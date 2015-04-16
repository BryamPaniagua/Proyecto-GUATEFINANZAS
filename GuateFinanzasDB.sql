CREATE DATABASE GuatefinanzasDB
CREATE TABLE Cliente(
	DPI	INT IDENTITY(1,1),
	Nombre	VARCHAR(50),
	Apellido	VARCHAR(50),
	Direccion	VARCHAR(100),
	Telefono	INT,
	Correo		VARCHAR(100),
	Referencia1	VARCHAR(100),
	Telefono1	INT,
	Referencia2	VARCHAR(100),
	Telefono2	INT,
	PRIMARY KEY (DPI)
);
CREATE TABLE Rol(
	IdRol	INT IDENTITY(1,1),
	Nombre	VARCHAR(50),
	PRIMARY KEY(IdRol)
);
CREATE TABLE Usuario(
	IdUsuario	INT IDENTITY(1,1),
	DPI	INT NOT NULL,
	usuario	VARCHAR(20),
	contrasenia	VARCHAR(25),
	IdRol	INT NOT NULL,
	PRIMARY KEY(IdUsuario),
	FOREIGN KEY (DPI) REFERENCES Cliente(DPI),
	FOREIGN KEY (IdRol) REFERENCES Rol(IdRol)
);
CREATE TABLE Cuenta(
	IdCuenta	INT,
	Nombre	VARCHAR(100),
	Tipo	VARCHAR(25),
	Estado	VARCHAR(30),
	Saldo	INT,
	DPI		INT NOT NULL,
	ReferenciaLaboral1	VARCHAR(100),
	Telefono1	INT,
	ReferenciaLaboral2	VARCHAR(100),
	Telefono2	INT,
	PRIMARY KEY(IdCuenta),
	FOREIGN KEY (DPI) REFERENCES Cliente(DPI)
);
CREATE TABLE Tarjeta_Debito(
	IdTarjetaDebito	INT,
	IdCuenta	INT NOT NULL,
	Pin	INT,
	Estado	VARCHAR(100),
	FechaActivacion	DATE,
	FechaVencimiento	DATE,
	PRIMARY KEY(IdTarjetaDebito),
	FOREIGN KEY (IdCuenta) REFERENCES Cuenta(IdCuenta)
);
CREATE TABLE Historial_TarjetaDebito(
	IdHTD	INT IDENTITY(1,1),
	IdTarjetaDebito	INT NOT NULL,
	Fecha	Date,
	CantidadConsumida	INT,
	Lugar	VARCHAR(100),
	Estado	VARCHAR(50),
	PRIMARY KEY(IdHTD),
	FOREIGN KEY (IdTarjetaDebito) REFERENCES Tarjeta_Debito(IdTarjetaDebito)
);
CREATE TABLE BloqDesBloq_TarjetasDebito(
	IdBloqDesBloq_Deb	INT IDENTITY(1,1),
	IdTarjetaDebito INT NOT NULL,
	Motivo	VARCHAR(100),
	Fecha	DATE,
	Estado	VARCHAR(50),
	PRIMARY KEY(IdBloqDesBloq_Deb),
	FOREIGN KEY (IdTarjetaDebito) REFERENCES Tarjeta_Debito(IdTarjetaDebito)
);
CREATE TABLE Tarjeta_Credito(
	IdTarjetaCredito	INT,
	DPI	INT NOT NULL,
	Pin	INT,
	Estado	VARCHAR(30),
	FechaActivacion	DATE,
	FechaVencimiento	DATE,
	Limite	INT,
	Tasa	INT,
	PRIMARY KEY(IdTarjetaCredito),
	FOREIGN KEY (DPI) REFERENCES Cliente(DPI)
);
CREATE TABLE Historial_TarjetaCredito(
	IdHTC	INT IDENTITY(1,1),
	IdTarjetaCredito	INT NOT NULL,
	SaldoActual	INT,
	SaldoAnterior INT,
	Fecha	DATE,
	Lugar	VARCHAR(100),
	PRIMARY KEY(IdHTC),
	FOREIGN KEY (IdTarjetaCredito) REFERENCES Tarjeta_Credito(IdTarjetaCredito)
);
CREATE TABLE BloqDesBloq_TarjetasCredito(
	IdBloqDesBloq_Cred	INT IDENTITY(1,1),
	IdTarjetaCredito INT NOT NULL,
	Motivo	VARCHAR(100),
	Fecha	DATE,
	PRIMARY KEY(IdBloqDesBloq_Cred),
	FOREIGN KEY (IdTarjetaCredito) REFERENCES Tarjeta_Credito(IdTarjetaCredito)
);
CREATE TABLE TipoAccion(
	IdTipoAccion	INT IDENTITY(1,1),
	Descripcion	VARCHAR(255),
	PRIMARY KEY(IdTipoAccion)
);
CREATE TABLE Historial_Cuenta(
	IdHC	INT IDENTITY(1,1),
	IdCuenta	INT NOT NULL,
	SaldoAnterior	INT,
	SaldoActual	INT,
	Fecha	INT,
	IdTipo	INT NOT NULL,
	Lugar	VARCHAR(100),
	PRIMARY KEY(IdHC),
	FOREIGN KEY (IdCuenta) REFERENCES Cuenta(IdCuenta),
	FOREIGN KEY (IdTipo) REFERENCES TipoAccion(IdTipoAccion)
);
CREATE TABLE Transaccion_Cuenta(
	IdTransaccion	INT IDENTITY(1,1),
	IdCuenta	INT NOT NULL,
	CuentaAcreedora	INT NOT NULL,
	Cantidad	INT,
	Fecha	DATE,
	Lugar	VARCHAR(150),
	PRIMARY KEY(IdTransaccion),
	FOREIGN KEY (IdCuenta) REFERENCES	Cuenta(IdCuenta)
);
CREATE TABLE Prestamo(
	IdPrestamo	INT IDENTITY(1,1),
	IdCuenta	INT NOT NULL,
	Tasa	INT,
	Plazo	INT,
	Monto	INT,
	CantidadCuota	INT,
	Fecha	DATE,
	Estado	VARCHAR(50),
	FechaPagoMensual	VARCHAR(50),
	PRIMARY KEY(IdPrestamo),
	FOREIGN KEY (IdCuenta) REFERENCES Cuenta(IdCuenta)
);
CREATE TABLE Historial_Prestamo(
	IdHP	INT IDENTITY(1,1),
	IdPrestamo	INT NOT NULL,
	SaldoAnterior	INt,
	SaldoActual	INT,
	Fecha	DATE,
	Mora	INT,
	CantidadTotal INT,
	PRIMARY KEY(IdHP),
	FOREIGN KEY (IdPrestamo) REFERENCES Prestamo(IdPrestamo)
);