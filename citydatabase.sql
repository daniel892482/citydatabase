CREATE TABLE Morador (
MoradorID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Transacao (
TransacaoID INT AUTO_INCREMENT PRIMARY KEY,
MoradorID INT NOT NULL,
Valor DECIMAL(10,2),
DataTransacao DATE,
FOREIGN KEY (MoradorID) REFERENCES Morador(MoradorID)
);

ALTER TABLE Morador
ADD COLUMN TransacaoID INT UNIQUE,
ADD FOREIGN KEY (TransacaoID) REFERENCES Transacao(TransacaoID);

CREATE TABLE Investimento (
InvestimentoID INT AUTO_INCREMENT PRIMARY KEY,
MoradorID INT NULL,
Descricao VARCHAR(200),
FOREIGN KEY (MoradorID) REFERENCES Morador(MoradorID)
);

ALTER TABLE Morador
ADD COLUMN InvestimentoID INT,
ADD FOREIGN KEY (InvestimentoID) REFERENCES Investimento(InvestimentoID);

ALTER TABLE Transacao
ADD COLUMN InvestimentoID INT,
ADD FOREIGN KEY (InvestimentoID) REFERENCES Investimento(InvestimentoID);

ALTER TABLE Investimento
ADD COLUMN TransacaoID INT UNIQUE,
ADD FOREIGN KEY (TransacaoID) REFERENCES Transacao(TransacaoID);

CREATE TABLE IndicadorCidade (
IndicadorID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL
);

CREATE TABLE MoradorIndicador (
MoradorID INT NOT NULL,
IndicadorID INT NOT NULL,
PRIMARY KEY (MoradorID, IndicadorID),
FOREIGN KEY (MoradorID) REFERENCES Morador(MoradorID),
FOREIGN KEY (IndicadorID) REFERENCES IndicadorCidade(IndicadorID)
);