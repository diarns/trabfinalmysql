/*Fornecedores*/
/*Caixa*/ 

SELECT cnpj, produto FROM caixa INNER JOIN fornecedores ON caixa.id_forn = fornecedores.pk_forn;