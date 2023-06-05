-- Excliui o banco de dados
DROP DATABASE IF EXISTS curintia;

-- CRIA O BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS curintia;

-- USA O BANCO DE DADOS curiintia
USE curintia;

CREATE TABLE IF NOT EXISTS `enderecos` (
  `cep` BIGINT NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cep`)
);

CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id_fornecedor` BIGINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `cnpj` BIGINT NOT NULL,
  `telefone` BIGINT NOT NULL,
  `empresa` VARCHAR(45) NOT NULL,
  `endereco_cep` BIGINT NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  CONSTRAINT `fk_fornecedor_endereco1` FOREIGN KEY (`endereco_cep`) REFERENCES `enderecos` (`cep`)
);

CREATE TABLE IF NOT EXISTS `veiculos` (
  `id_veiculo` BIGINT NOT NULL auto_increment,
  `modelo` VARCHAR(45) NOT NULL,
  `novos` TINYINT NOT NULL,
  `eletrico` TINYINT NOT NULL,
  `esportivo` TINYINT NOT NULL,
  `picape` TINYINT NOT NULL,
  `ano` INT NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `quilometragem` FLOAT NOT NULL,
  `potencia` INT NOT NULL,
  `abs` TINYINT NOT NULL,
  `fornecedor_id_fornecedor` BIGINT NOT NULL,
  PRIMARY KEY (`id_veiculo`),
  CONSTRAINT `fk_veiculos_fornecedor1` FOREIGN KEY (`fornecedor_id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`)
);

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` BIGINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` BIGINT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `telefone` BIGINT NOT NULL,
  `gmail` VARCHAR(45) NOT NULL,
  `table1_cep` BIGINt NOT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `fk_clientes_table11` FOREIGN KEY (`table1_cep`) REFERENCES `enderecos` (`cep`)
);

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `matricula` BIGINT NOT NULL auto_increment,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` BIGINT NOT NULL,
  `contato` BIGINT NOT NULL,
  `salario` DOUBLE NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  `enderecos_cep` BIGINT NOT NULL,
  PRIMARY KEY (`matricula`),
  CONSTRAINT `fk_funcionarios_enderecos1` FOREIGN KEY (`enderecos_cep`) REFERENCES `enderecos` (`cep`)
);

CREATE TABLE IF NOT EXISTS `vendidos` (
  `veiculos_id_veiculo` BIGINT NOT NULL,
  `clientes_id_cliente` BIGINT NOT NULL,
  `funcionarios_matricula` BIGINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` BIGINT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `ipva_pago` TINYINT NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `tipo_veiculo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (
    `veiculos_id_veiculo`,
    `clientes_id_cliente`,
    `funcionarios_matricula`
  ),
  CONSTRAINT `fk_carros_has_clientes_carros1` FOREIGN KEY (`veiculos_id_veiculo`) REFERENCES `veiculos` (`id_veiculo`),
  CONSTRAINT `fk_carros_has_clientes_clientes1` FOREIGN KEY (`clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_vendidos_funcionarios1` FOREIGN KEY (`funcionarios_matricula`) REFERENCES `funcionarios` (`matricula`)
);

insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (98860771, 'Park Meadow', '', 'Newport News', 'Virginia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (26360149, 'Beilfuss', '', 'Tyler', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (24971323, 'Stoughton', '', 'Norfolk', 'Virginia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (32813459, 'Pennsylvania', '', 'Lawrenceville', 'Georgia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (33395580, 'Meadow Ridge', '', 'Dallas', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (66575921, 'Loomis', '', 'Dallas', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (18853418, 'Forster', '', 'Amarillo', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (77727522, 'Merchant', '', 'Louisville', 'Kentucky', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (53015239, 'Bluejay', '', 'Carlsbad', 'California', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (90807252, 'Little Fleur', '', 'Lubbock', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (83300006, 'Sloan', '', 'Washington', 'District of Columbia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (6131187, 'Oriole', '', 'Plano', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (72792903, 'Colorado', '', 'Houston', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (90000298, 'Debra', '', 'Maple Plain', 'Minnesota', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (41222385, 'Manley', '', 'Miami', 'Florida', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (71727947, 'Northwestern', '', 'Fort Wayne', 'Indiana', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (8599487, 'Blackbird', '', 'Rochester', 'New York', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (98012944, 'Lakewood', '', 'Denver', 'Colorado', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (37621074, 'Golf', '', 'Meridian', 'Mississippi', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (96883597, 'Village', '', 'Buffalo', 'New York', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (57268243, 'Redwing', '', 'Baltimore', 'Maryland', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (95428790, 'Derek', '', 'Las Vegas', 'Nevada', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (11255228, 'Sheridan', '', 'New York City', 'New York', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (21911141, 'Karstens', '', 'Roanoke', 'Virginia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (5445448, 'Columbus', '', 'Lake Charles', 'Louisiana', '');

insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Robyn', 18956452766, 'rtitherington0', '465-729-9931', 'rfandrey0@wisc.edu', '37000-118');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Celestyna', 91331353668, 'ccrosfeld1', '997-174-0985', 'chagland1@illinois.edu', '55154-3446');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Rafa', 67744441278, 'rgrenshiels2', '431-918-2549', 'rrobberecht2@unesco.org', '53208-504');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Charin', 96494156688, 'csheen3', '816-925-8044', 'cyegorovnin3@marketwatch.com', '21695-862');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Lynda', 34788559069, 'lduff4', '994-522-6425', 'lneno4@harvard.edu', '68084-479');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('James', 22709649232, 'jarchibold5', '947-680-7421', 'jfarran5@aboutads.info', '63940-472');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Jacques', 87889630908, 'jboeter6', '433-131-9037', 'jpixton6@vkontakte.ru', '50114-7050');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Hazlett', 482024287, 'holohan7', '969-768-4928', 'hdeye7@fastcompany.com', '31645-152');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Cyndie', 72304745218, 'cbraams8', '413-337-7466', 'cnyland8@yelp.com', '49999-853');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Douglas', 45911620590, 'dfozard9', '153-286-2367', 'draddan9@google.es', '37000-302');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Eustacia', 31545224611, 'epymera', '410-317-0962', 'eduligala@smh.com.au', '53329-138');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Julee', 13125889119, 'jadamssonb', '105-674-7069', 'jridulfob@facebook.com', '54868-5467');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Truman', 46899517, 'tgerardetc', '646-155-0127', 'tbeevensc@netscape.com', '64980-183');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Matthiew', 96685581525, 'medgesond', '982-351-4339', 'mdranced@ocn.ne.jp', '46994-291');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Shurlocke', 69654608887, 'smacmanuse', '420-653-1275', 'selwille@dailymotion.com', '68084-508');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Welsh', 72963837431, 'wdeehanf', '108-125-3378', 'wlangloisf@vkontakte.ru', '76329-9061');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Wilow', 57188333261, 'wlittong', '855-687-6778', 'wgoalbyg@gov.uk', '0310-0705');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Loralyn', 78970686787, 'lmarcosh', '225-958-6348', 'lkaneh@zimbio.com', '36800-703');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Wat', 32943852831, 'wleecei', '624-277-1387', 'wfilimorei@omniture.com', '54569-4443');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Sydney', 92443427080, 'sortsj', '573-416-4916', 'sdustingj@list-manage.com', '58980-336');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Andonis', 54306584432, 'akyteleyk', '603-335-2196', 'aliddyardk@chron.com', '68220-111');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Kris', 69828689652, 'kguiotl', '558-945-8655', 'kolekl@issuu.com', '64725-2434');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Layne', 25924043154, 'lmctrustamm', '945-684-9032', 'lspittlesm@stumbleupon.com', '49349-225');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Eleanor', 21929322727, 'eiacovinin', '138-119-6750', 'elovickn@cbsnews.com', '50242-075');
insert into clientes (nome, cpf, usuário, telefone, gmail, table1_cep) values ('Briny', 83011432641, 'bcrickmooro', '540-221-7159', 'bferrierioo@europa.eu', '55264-626');

insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (1, 'Winny', '20th Floor', 75046235882517, '843-203-9615', 'Gigazoom', '52125-313');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (2, 'Dennie', 'Room 1026', 19072164602881, '204-634-7341', 'Lajo', '52380-0540');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (3, 'Nadya', '13th Floor', 27948231233336, '345-402-0433', 'Meetz', '67692-339');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (4, 'Chantalle', 'Suite 54', 896965227601, '362-426-9535', 'Skilith', '63187-022');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (5, 'Jacenta', '10th Floor', 10818035558123, '594-337-6044', 'Jabbersphere', '52125-149');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (6, 'Roxy', 'Apt 1933', 10873363703136, '819-909-3425', 'Gabtype', '18860-105');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (7, 'Harold', 'Apt 760', 90514225112077, '851-693-6439', 'Oyope', '57520-0520');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (8, 'Lorry', 'Apt 548', 72306967958042, '817-673-5196', 'Katz', '62011-0223');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (9, 'Tammie', 'Suite 48', 55229016471073, '401-457-8001', 'Rhycero', '51053-501');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (10, 'Dorrie', 'Room 1124', 59931320530294, '813-444-4054', 'Tagtune', '0517-3900');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (11, 'Lula', 'Suite 45', 8908326363993, '161-322-1828', 'Divanoodle', '30142-112');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (12, 'Bank', 'Suite 66', 55031785704796, '505-693-7006', 'Kamba', '45802-368');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (13, 'Norry', 'Suite 66', 85704227088192, '562-689-3723', 'Edgetag', '55154-2427');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (14, 'Rickie', '3rd Floor', 63251005732328, '284-281-1877', 'Feedbug', '61500-5527');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (15, 'Reba', 'Apt 115', 92777920990985, '306-280-4543', 'Browseblab', '0615-1593');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (16, 'Kaila', 'Room 427', 94403490124683, '999-507-4783', 'Mudo', '59011-260');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (17, 'Wain', '3rd Floor', 11854370347142, '445-891-2306', 'LiveZ', '59779-392');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (18, 'Marley', '5th Floor', 91558142300380, '100-202-4177', 'Buzzster', '54473-244');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (19, 'Flory', '19th Floor', 32047487063181, '175-739-3622', 'Nlounge', '0944-2845');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (20, 'Ermanno', 'Suite 28', 70201782036259, '244-700-6873', 'Yoveo', '43419-362');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (21, 'Jemmie', 'Suite 59', 54344684867256, '859-659-2020', 'Divavu', '60608-011');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (22, 'Xaviera', 'Suite 41', 51061700282756, '651-423-5834', 'Twitterwire', '0603-3968');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (23, 'Parke', 'Apt 1827', 87083160744453, '742-507-7981', 'Mybuzz', '61314-229');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (24, 'Nan', 'Room 1319', 49940082811301, '728-393-1506', 'Mita', '76237-135');
insert into fornecedores (id_fornecedor, nome, endereco, cnpj, telefone, empresa, endereco_cep) values (25, 'Caitrin', 'PO Box 35303', 26728775263681, '520-344-3488', 'Bluezoom', '51672-1271');

insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Cadillac', 'Escalade ESV', 93, 65, false, false, true, false, 2007, 'Orange', true, 617175);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Volkswagen', 'Touareg', 37, 61, false, false, false, true, 2008, 'Mauv', true, 15930);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Lincoln', 'Navigator', 82, 36, true, false, true, false, 2011, 'Mauv', true, 781195);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Chevrolet', 'Corvair 500', 37, 9, true, true, true, true, 1963, 'Blue', false, 697034);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Lincoln', 'Navigator', 85, 37, false, false, true, false, 2011, 'Puce', false, 958820);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Ford', 'Fusion', 12, 35, true, false, false, true, 2009, 'Blue', true, 929550);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mazda', 'MX-3', 82, 15, false, true, true, false, 1992, 'Aquamarine', true, 136048);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Ford', 'Edge', 48, 24, false, false, false, false, 2012, 'Goldenrod', false, 759029);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('GMC', 'Sierra 1500', 26, 40, false, false, false, false, 2007, 'Blue', true, 718194);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Dodge', 'D150', 51, 30, false, false, false, true, 1993, 'Blue', true, 774026);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mercedes-Benz', 'S-Class', 40, 7, true, true, false, false, 2005, 'Goldenrod', false, 907369);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Chevrolet', 'Corsica', 61, 99, false, true, false, true, 1994, 'Yellow', true, 443048);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Ford', 'LTD', 90, 35, false, false, false, false, 1985, 'Blue', false, 676606);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Buick', 'LeSabre', 3, 86, false, false, true, false, 1997, 'Pink', false, 652142);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Honda', 'Odyssey', 7, 53, false, false, false, true, 2006, 'Teal', true, 383120);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Volkswagen', 'riolet', 33, 53, false, true, true, true, 1992, 'Yellow', false, 347595);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mercury', 'Capri', 46, 80, false, true, true, false, 1991, 'Fuscia', false, 456100);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Dodge', 'Viper RT/10', 79, 86, true, true, false, true, 1995, 'Goldenrod', true, 766662);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Chevrolet', 'Malibu Maxx', 73, 71, false, false, false, false, 2006, 'Turquoise', true, 759542);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Hummer', 'H3', 12, 87, true, true, false, true, 2007, 'Purple', true, 210553);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Hyundai', 'XG350', 15, 36, true, true, true, false, 2003, 'Orange', false, 909273);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Chrysler', '300', 57, 88, false, true, true, false, 1999, 'Turquoise', true, 231672);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mitsubishi', 'Galant', 77, 59, true, false, false, false, 1993, 'Fuscia', true, 762517);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mercury', 'Grand Marquis', 1, 23, false, true, true, true, 2002, 'Mauv', false, 518766);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Plymouth', 'Colt Vista', 34, 85, true, false, false, false, 1994, 'Indigo', true, 583661);

insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (25837, 'Lindy', 22726014571, 13410553435, 723164, 'atendente', 26585150);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (21403, 'Jarret', 48791425360, 35980146935, 872439, 'controle de qualidade', 36095615);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (66805, 'Catrina', 80075228935, 19591078528, 34577, 'assistente financeiro', 43952416);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (12162, 'Karola', 15101050114, 77896118040, 60396, 'financeiro', 14511259);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (53884, 'Marsiella', 34307250676, 90680934226, 266864, 'anunciante', 3128314);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (3506, 'Bertha', 12463955569, 90116297387, 848844, 'limpador', 57427127);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (62286, 'Ferguson', 58930365379, 46109461366, 752010, 'atendente', 79994788);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (32700, 'Natka', 89531149986, 35610619177, 904351, 'abastecedor', 70447519);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (35722, 'Klarrisa', 9836497788, 91137859023, 366295, 'vendedor', 83800653);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (86322, 'Lari', 9877551095, 63845844974, 916615, 'empresario', 15743572);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (64190, 'Grace', 23309499408, 67234740452, 514410, 'mecanico', 62916261);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (14218, 'Aila', 505005408, 81714544142, 254192, 'sócio proprietario', 98150887);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (52267, 'Cyrille', 23547659105, 71090598457, 228762, 'coordernador', 99968732);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (95923, 'Marcile', 13348431197, 53528462624, 628954, 'Editor', 65937121);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (10898, 'Siegfried', 3552317540, 55399779452, 994769, 'Administrator', 29588060);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (3757, 'Pete', 12343440841, 77806073273, 182210, 'vendedor', 75672059);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (69152, 'Georgia', 39684215524, 5922694783, 808915, 'aprendiz de vendas', 40671665);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (46386, 'Berkley', 23432922723, 12278096315, 37000, 'Marketing', 91645844);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (63641, 'Stefano', 80946074838, 83454126209, 288747, 'mecanico', 3104288);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (40421, 'Meredithe', 33494134391, 84019606741, 461362, 'financiador', 99522093);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (49478, 'Zachary', 19495325321, 80874368814, 63220, 'gerente', 47559826);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (8403, 'Hanna', 50105009335, 36324574674, 768937, 'dono', 67687782);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (52362, 'Betti', 51034921685, 59913892801, 659172, 'atendente', 11668950);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (33799, 'Ashbey', 98288857125, 79896897818, 66949, 'limpador', 78651254);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (69111, 'Nani', 89697889863, 71680589359, 367649, 'vendedor', 93222148);

insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Adelheid', 68704944920, 'SedVestibulum.ppt', false, 'Silhouette');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Vasily', 52884361363, 'EtTempus.xls', true, 'S10');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Herold', 7823368975, 'BlanditNon.tiff', false, 'Navigator');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Bengt', 49315960949, 'VelAugue.gif', false, 'VehiCROSS');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Lionello', 28282848725, 'Suspendisse.ppt', true, 'Expedition');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Ianthe', 96792793746, 'Nec.pdf', false, 'Suburban 1500');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Riane', 17360308262, 'Molestie.jpeg', true, 'E-Class');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Lyell', 9639596492, 'Luctus.mp3', true, 'Optima');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Alix', 23754333721, 'Ac.mov', true, 'Camaro');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Magdalene', 83304029884, 'LiberoRutrumAc.gif', true, 'Solara');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Darwin', 82630920672, 'OrciEgetOrci.xls', false, 'RAV4');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Jerry', 44004039565, 'UltricesErat.txt', false, 'Solara');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Clea', 89182525968, 'PedeJusto.gif', true, 'V70');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Robinia', 11987259151, 'Mauris.tiff', true, 'Beretta');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Rabbi', 49716363623, 'RisusSemperPorta.ppt', true, 'Cabriolet');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Karisa', 17698270604, 'IntegerAliquet.xls', true, 'XL-7');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Mikaela', 22032283259, 'ArcuAdipiscingMolestie.xls', false, 'Escalade EXT');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Alvis', 50868545150, 'OrciVehiculaCondimentum.xls', false, 'Silverado 3500');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Ertha', 35386100041, 'CongueDiam.mp3', false, 'MDX');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Conrade', 28482723167, 'Phasellus.xls', false, 'Horizon');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Dion', 81491983259, 'DiamNeque.tiff', true, 'Toronado');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Berton', 20633940404, 'APede.jpeg', false, 'Miata MX-5');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Jacob', 19431254984, 'CuraeNullaDapibus.mp3', true, 'B-Series');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Melva', 37264335722, 'OdioOdioElementum.mp3', true, 'Defender 110');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Hildagard', 90710219622, 'Nunc.txt', true, 'NV2500');

select * from veiculos;
