CREATE EXTENSION mongo_fdw;


CREATE SERVER mongo_server
	FOREIGN DATA WRAPPER mongo_fdw
	OPTIONS (address 'mongodb', port '27017');

CREATE USER MAPPING FOR postgres
	SERVER mongo_server;


CREATE FOREIGN TABLE monogo_users
	(
        _id name,
		name text,
		age int,
		email text,
		admin boolean
	)
	SERVER mongo_server
	OPTIONS (database 'db', collection 'test');


select * from public.monogo_users;

insert into monogo_users values (
'461e3d00-f30f-4c89-b5c6-484c10ebef51','Obay Daba', 26, 'obay.daba@priceloop.ai', false);

insert into monogo_users values (
'2e31ef92-5cf1-47be-b448-5bcaef620894','Hamza Rabah', 27, 'hamza.rabah@l-one.de', true);
