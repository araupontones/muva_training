***Clear Base de Dado Link

/*-----------------------------------------------------------------------------
 
  starting

-----------------------------------------------------------------------------*/
********************************************************************************
******************** Project: MUVA Link
******************** Analyst: Anavera Dabata
******************** Support: Dercio Nhanombe
******************** Date:   28/01/2021
******************************************************************************** 
clear all
set more off
 
/*
 if c(username) =="andre" {

                global path "C:\Users/`c(username)'\Dropbox\LIGADA MEL"

  }

 else {
                global path "C:\Users/`c(username)'\Dropbox (OPML)\LIGADA MEL"
}*/
 if c(username) =="hi riverside" {

                global path "C:\Users/`c(username)'\Documents\Analises"
				//"C:\Users\hi riverside\Documents\Analises"
  }
  

 else {
                global path "C:\Users/`c(username)'\Dropbox (OPML)\LIGADA MEL\Data Management\MUVA Link\1.Data\10 Dp WORlD"


  
 }

 tempfile  DBLINK_clear

                                

/********************************************************************************

                set directories

********************************************************************************/

             /*   global Registo "$path/1 Registo"
				global Chamada "$path/2 Chamadas em ingles"
				global Workshoop "$path/3 Workshoop de selecao"
				global Atitude "$path/4 Medica de atitudes"*/

 use "$path/DP WORLD CLEAN.dta", clear
 **use "$path/CLEAN_LINKADOS.dta", clear
 /*-----------------------------------------------------------------------------
                ORGANIZANDO PASTA DO REGISTO DP WORLD
-------------------------------------------------------------------------------*/

 sort Nome ID 
  
 **der ID Cohort Nome Sexo Provincia Cidade Bairro Idade vaga_concorrer Telefone Telefo*
 destring Telefone, replace
 
 
	/*ren Telefone_1 Telefone_alternativo
	label var Telefone_alternativo "Telefone alternativo"*/
	
	append using CLEAN_LINKADOS.dta
	foreach i in Sexo {
		 replace `i' = itrim(`i')

                replace `i' = trim(`i')

                replace `i' = rtrim(`i')

                replace `i' = subinstr(`i', "ç", "c", .)

                replace `i' = subinstr(`i', "Ç", "c", .)

                replace `i' = subinstr(`i', "ã", "a", .)

                replace `i' = subinstr(`i', "Ã", "a", .)

                replace `i' = subinstr(`i', "á", "a", .)

                replace `i' = subinstr(`i', "Á", "a", .)

                replace `i' = subinstr(`i', "à", "a", .)

                replace `i' = subinstr(`i', "À", "a", .)

                replace `i' = subinstr(`i', "é", "e", .)

                replace `i' = subinstr(`i', "É", "e", .)

                replace `i' = subinstr(`i', "È", "e", .)

                replace `i' = subinstr(`i', "è", "e", .)

                replace `i' = subinstr(`i', "â", "a", .)

                replace `i' = subinstr(`i', "Â", "e", .)

                replace `i' = subinstr(`i', "ê", "e", .)

                replace `i' = subinstr(`i', "Ê", "e", .)

                replace `i' = subinstr(`i', "ô", "o", .)

                replace `i' = subinstr(`i', "Ô", "o", .)

                replace `i' = subinstr(`i', "ó", "o", .)

                replace `i' = subinstr(`i', "Ó", "o", .)

                replace `i' = subinstr(`i', "õ", "o", .)

                replace `i' = subinstr(`i', "Õ", "o", .)

                replace `i' = subinstr(`i', "ú", "u", .)

                replace `i' = subinstr(`i', "Ú", "u", .)

                replace `i' = subinstr(`i', "í", "i", .)

                replace `i' = subinstr(`i', "Í", "i", .)

                replace `i' = subinstr(`i', "ì", "i", .)

                replace `i' = subinstr(`i', "Ì", "i", .)

                replace `i' = upper(`i')
	}
	
	**drop form_profissional_2 
	
	*replace Formacao=form_profissional if Formacao==.
	
	***	Eliminando variáveis duplicadas
	
	replace Formacao=form_profissional if form_profissional!=""
	drop form_profissional id
	
	replace form_profissional_1=form_profissional_2 if form_profissional_2!=""
	drop form_profissional_2
	
	replace nome_instituicao=instituicao if instituicao !=""
	drop instituicao
	replace Instituicao_formacao=nome_instituicao if nome_instituicao!=""
	drop nome_instituicao idnum
	
	
	***Contacto
	***tostring Contacto, replace
		
	***replace Telefone=Contacto if Contacto!=""
	
	
	
	
	***Organizando a Data de Nascimento ***
	
	
	
	
	
	drop score_geografia score_conclusao score_experiencia score_internacional
	drop score_nivelWord score_nivelExcel score_nivelIngles
	
	/**
	
	br ID bairro_geo score_geografia score_conclusao score_experiencia 
	score_internacional score_nivelWord score_nivelExcel score_nivelIngles SCORE 
	Status_entrevista 
	Score_Chamada Status_LN Literacia Numeracia SCORE_LN Num_ordem Score_Word 
	Score_Excel Score_Internet Score_PC Score_digital Status_MD
	*/
	
	
	replace Status_LN=Status_LN_WS if Status_LN_WS!=""
	/*
	destring Literacia, replace
	destring Numeracia, replace
	destring WS_Num, replace
	destring WS_Lit, replace*/
	
	replace WS_Lit=Literacia if WS_Lit==.
**	replace Literacia=WS_Lit if WS_Lit!=""
	replace WS_Num =Numeracia if WS_Num==.
*	drop Status_LN_WS Num_ordem WS_Lit WS_Num
	
	
	*/
	
	*drop Score Chamada Presenca fonte
	
	
	
	
 
